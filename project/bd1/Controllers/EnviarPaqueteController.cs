using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class EnviarPaqueteController : Controller
    {
        // GET: EnviarPaquete
        public ActionResult IndexEnvio()
        {
            DAOEnvio data = DAOEnvio.getInstance();
            List<Envio> envios = data.obtenerEnvio();
            foreach (var item in envios)
            {
                DAOPago data2 = DAOPago.getInstance();
                Pago pago = data2.buscarPagoEnvio(item.cod);
                item.codPago = pago.cod;
            }
            return View(envios);
        }
        public PartialViewResult MenuSuperior()
        {
            return PartialView("MenuSuperiorAdm");
        }
        public PartialViewResult TBEnvio()
        {
            return PartialView("TextBoxEnvio");
        }
        [HttpPost]
        public ActionResult BuscarEnvio(string envio)
        {
            if (envio != "")
            {
                int cod = Int32.Parse(envio);
                DAOEnvio data = DAOEnvio.getInstance();
                Envio envioEncontrado = data.buscarEnvio(cod);
                List<Envio> envios = new List<Envio>();
                envios.Add(envioEncontrado);
                foreach (var item in envios)
                {
                    DAOPago data2 = DAOPago.getInstance();
                    Pago pago = data2.buscarPagoEnvio(item.cod);
                    item.codPago = pago.cod;
                }
                return View("~/Views/EnviarPaquete/IndexEnvio.cshtml", envios);
            }
            else
            {
                DAOEnvio data = DAOEnvio.getInstance();
                List<Envio> envios = data.obtenerEnvio();
                foreach (var item in envios)
                {
                    DAOPago data2 = DAOPago.getInstance();
                    Pago pago = data2.buscarPagoEnvio(item.cod);
                    item.codPago = pago.cod;
                }
                return View("~/Views/EnviarPaquete/IndexEnvio.cshtml", envios);
            }
        }
        //ENVIANDO PAQUETE (INSERTANDO PAQUETE, ENVIO, TRASLADO y VEH-RUT)
        public ActionResult nuevoEnvio()
        {
            return View();
        }
        [HttpPost]
        public ActionResult nuevoEnvio(Envio model, string empleadoE)
        {
            int fkE = Int32.Parse(empleadoE);
            DAOEnvio data = DAOEnvio.getInstance();
            data.insertarEnvio(model.fechaInicio, model.fechaLlegada, fkE);

            return View("~/Views/EnviarPaquete/NuevoEnvio2.cshtml");
        }
        public ActionResult NuevoEnvio2()
        {
            return View();
        }
        [HttpPost]
        public ActionResult nuevoEnvio2(Paquete model, Envio model2, string tipoPaquete, string sucursal, 
            string clienteR, string clienteD, string transporte)
        {
            int fkC1 = Int32.Parse(clienteR);
            int fkC2 = Int32.Parse(clienteD);
            int fkTP = Int32.Parse(tipoPaquete);
            int fkS = Int32.Parse(sucursal);
            DAOPaquete data = DAOPaquete.getInstance();
            data.insertarPaquete(model.peso, model.volumen, fkTP, fkS, model2.cod, fkC1, fkC2);

            DAOEnvio data2 = DAOEnvio.getInstance();
            Envio envio = data2.buscarUltimoEnvio();
            TempData["codSucursal"] = fkS;
            ViewBag.transporte = transporte;

            return View("~/Views/EnviarPaquete/NuevoEnvio3.cshtml");
        }
        public ActionResult NuevoEnvio3()
        {
            return View();
        }
        [HttpPost]
        public ActionResult nuevoEnvio3(Envio model2, string ruta, string avion, string barco, string terrestre)
        {
            int r = Int32.Parse(ruta);
            int precioV = 0;
            
            DAOEnvio data = DAOEnvio.getInstance();
            if ((avion == null)&&(barco == null))
            {
                data.insertarTerrRut(terrestre, model2.duracionVR, r);
                precioV = 500;
            }
            if ((avion == null) && (terrestre == null))
            {
                data.insertarBarRut(barco, model2.duracionVR, r);
                precioV = 2500;
            }
            if ((terrestre == null) && (barco == null))
            {
                data.insertarAviRut(avion, model2.duracionVR, r);
                precioV = 3000;
            }
            data = DAOEnvio.getInstance();
            Envio envio = data.buscarUltimoVehRut();
            Envio envio2 = data.buscarUltimoEnvio();
            DAOPaquete dataP = DAOPaquete.getInstance();
            Paquete paq = dataP.buscarUltimoPaquete();
            DAORuta dataR = DAORuta.getInstance();
            Ruta buscandoPrecioRuta = dataR.buscarRuta(r);
            data.insertarTraslado(envio.cod, envio2.cod, precioV, buscandoPrecioRuta.costo);
          
            DAOEnvio data2 = DAOEnvio.getInstance();
            envio = data2.buscarUltimoEnvio();
            if (paq.peso >= 10)
            {
                envio.monto = (buscandoPrecioRuta.costo + precioV) * (paq.volumen);
            }
            else
            {
                envio.monto = (buscandoPrecioRuta.costo + precioV) * (paq.peso);
            }
            DAOCliente dataC = DAOCliente.getInstance();
            Cliente cliente = dataC.buscarClienteEnvio(paq.cod);
            cliente = dataC.buscarLVIP(cliente.CI);
            if (cliente.cantEnvios >= 5)
            {
                ViewBag.LVIP = "10% de descuento por ser L-VIP, sin serlo el monto era " + envio.monto;
                envio.monto = envio.monto * 0.1;      
            }

            return View("~/Views/EnviarPaquete/NuevoEnvioFinal.cshtml", envio);
        }
        public ActionResult NuevoEnvioFinal()
        {
            return View();
        }
        [HttpPost]
        public ActionResult nuevoEnvioFinal(Envio model)
        {

            DAOEnvio data2 = DAOEnvio.getInstance();
            data2.actualizarEnvio(model.cod, model.monto, model.fechaLlegada);
            Envio envio = data2.buscarUltimoEnvio();
            DAOEnvio data = DAOEnvio.getInstance();
            List<Envio> envios = data.obtenerEnvio();
            foreach (var item in envios)
            {
                DAOPago data3 = DAOPago.getInstance();
                Pago pago = data3.buscarPagoEnvio(item.cod);
                item.codPago = pago.cod;
            }
            return View("~/Views/EnviarPaquete/IndexEnvio.cshtml", envios);
        }
        public PartialViewResult RutaDD()
        {
            string fkS = TempData["codSucursal"].ToString();
            int cS = Int32.Parse(fkS);
            DAORuta data = DAORuta.getInstance();
            List<Ruta> rutas = data.obtenerRutaEnvios(cS);
            return PartialView("RutaDropDown", rutas);
        }
        public PartialViewResult BarcoDD()
        {
            DAOBarco data = DAOBarco.getInstance();
            List<Barco> barcos = data.obtenerBarcos();
            return PartialView("BarcoDropDown", barcos);
        }
        public PartialViewResult AvionDD()
        {
            DAOAvion data = DAOAvion.getInstance();
            List<Avion> aviones = data.obtenerAviones();
            return PartialView("AvionDropDown", aviones);
        }
        public PartialViewResult TerrestreDD()
        {
            DAOTerrestre data = DAOTerrestre.getInstance();
            List<Terrestre> terrestres = data.obtenerTerrestres();
            return PartialView("TerrestreDropDown", terrestres);
        }
        public PartialViewResult ClientePaqueteDD()
        {
            DAOCliente data = DAOCliente.getInstance();
            List<Cliente> clientes = data.obtenerClientes();
            return PartialView("ClientePaqueteDropDown", clientes);
        }
        public PartialViewResult TipoPaqueteDD()
        {
            DAOPaquete data = DAOPaquete.getInstance();
            List<Paquete> tipoPaquetes = data.obtenerTipoPaquete();
            return PartialView("TipoPaqueteDropDown", tipoPaquetes);
        }
        public PartialViewResult SucursalDD()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerOficinas();
            return PartialView("SucursalEmpleado", oficinas);
        }
        public PartialViewResult EmpleadoDD()
        {
            DAOEmpleado data = DAOEmpleado.getInstance();
            List<Empleado> empleados = data.obtenerEmpleado();
            return PartialView("EmpleadoEnvioDropDown", empleados);
        }
        public PartialViewResult NuevoEnvioTB()
        {
            DAOEnvio data = DAOEnvio.getInstance();
            Envio envio = data.buscarUltimoEnvio();
            return PartialView("CodigoNuevoEnvioTextBox", envio);
        }
        //CAMBIANDO ESTADO DEL ENVIO
        public ActionResult CambiarEstado(string id)
        {
            int cod = Int32.Parse(id);
            DAOEnvio data = DAOEnvio.getInstance();
            Envio estatus = data.buscarEnvio(cod);
            return View(estatus);
        }
        public PartialViewResult EstatusDD()
        {
            DAOEnvio data = DAOEnvio.getInstance();
            List<Envio> estatus = data.obtenerEstatus();
            return PartialView("EstatusDropDown", estatus);
        }
        [HttpPost]
        public ActionResult CambiarEstado(Envio model, string estatus)
        {
            int fkE = Int32.Parse(estatus);
            DAOEnvio data2 = DAOEnvio.getInstance();
            data2.cambiarEstado(model.cod, fkE);
            DAOEnvio data = DAOEnvio.getInstance();
            List<Envio> envios = data.obtenerEnvio();
            foreach (var item in envios)
            {
                DAOPago data3 = DAOPago.getInstance();
                Pago pago = data3.buscarPagoEnvio(item.cod);
                item.codPago = pago.cod;
            }
            return View("~/Views/EnviarPaquete/IndexEnvio.cshtml", envios);
        }
        //DETALLES DEL ENVIO
        public ActionResult DetallesEnvio(string id)
        {
            int cod = Int32.Parse(id);
            DAOEnvio data = DAOEnvio.getInstance();
            Envio detalles = data.detallesEnvio(cod);
            List<Envio> envios = new List<Envio>();
            envios.Add(detalles);
            return View(envios);
        }
        public PartialViewResult EnvioDetalleTB(Envio m, string id)
        {
            int cod = m.cod;
            if (cod == 0)
            {
                cod = Int32.Parse(id);
            }
            DAOEnvio data = DAOEnvio.getInstance();
            Envio envio = data.buscarEnvio(cod);
            return PartialView("EnvioDetalleTextBox", envio);
        }
        public ActionResult DetallePaquete(string id2)
        {
            int cod = Int32.Parse(id2);
            DAOPaquete data = DAOPaquete.getInstance();
            Paquete paquete = data.buscarPaquete(cod);
            return View(paquete);
        }
        public ActionResult DetallePago(string id2)
        {
            int cod = Int32.Parse(id2);
            DAOPago data = DAOPago.getInstance();
            Pago pago = data.buscarPago(cod);
            return View(pago);
        }
        public ActionResult DetalleRuta(string id2)
        {
            int cod = Int32.Parse(id2);
            DAORuta data = DAORuta.getInstance();
            Ruta ruta = data.buscarRuta(cod);
            return View(ruta);
        }
        public ActionResult DetalleVehiculo(string id2)
        {
            DAOVehiculo data = DAOVehiculo.getInstance();
            Vehiculo veh = data.buscarDetalleTerrestre(id2);
            if(veh.placa == null)
            {
                veh = data.buscarDetalleBarco(id2);
            }
            if (veh.placa == null)
            {
                veh = data.buscarDetalleAvion(id2);
            }
            return View(veh);
        }
        [HttpPost]
        public ActionResult RegresoDetallesEnvio(Envio m)
        {
            //int cod = Int32.Parse(m.cod);
            DAOEnvio data = DAOEnvio.getInstance();
            Envio detalles = data.detallesEnvio(m.cod);
            List<Envio> envios = new List<Envio>();
            envios.Add(detalles);
            return View("~/Views/EnviarPaquete/DetallesEnvio.cshtml", envios);
        }
        //Eliminar Envio
        public ActionResult EliminarEnvio()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EliminarEnvio(Envio model)
        {
            //int cod = Int32.Parse(model.cod);
            DAOPago data1 = DAOPago.getInstance();
            data1.eliminarPago(model.cod);
            DAOPaquete data2 = DAOPaquete.getInstance();
            data2.eliminarPaquete(model.cod);
            DAOEnvio data3 = DAOEnvio.getInstance();
            data3.eliminarTraslado(model.cod);
            DAOEnvio data = DAOEnvio.getInstance();
            data.eliminarEnvio(model.cod);
            List<Envio> envios = data.obtenerEnvio();
            foreach (var item in envios)
            {
                DAOPago data4 = DAOPago.getInstance();
                Pago pago = data4.buscarPagoEnvio(item.cod);
                item.codPago = pago.cod;
            }
            return View("~/Views/EnviarPaquete/IndexEnvio.cshtml", envios);
        }

    }
}