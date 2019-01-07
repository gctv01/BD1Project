using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class PagoController : Controller
    {
        // GET: Pago
        public ActionResult PagoEnvio()
        {
            return View();
        }
        [HttpPost]
        public ActionResult pagoEnvio(Pago model, Envio model2, string pagoD, string metodoPago,
            string metodoPago2, string metodoPago3, string metodoPago4)
        {
            DAOPago data = DAOPago.getInstance();
            data.insertarPago(model2.monto, model.fecha, pagoD, model2.cod);

            DAOPago data2 = DAOPago.getInstance();
            Pago pago = data2.buscarUltimoPago();
            if (pagoD == "TRUE")
            {
                metodoPago = "efectivo";
                metodoPago2 = "efectivo";
                metodoPago3 = "efectivo";
                metodoPago4 = "efectivo";
            }

            ViewBag.mP = metodoPago;
            TempData["metodo1"] = metodoPago;
            ViewBag.mP2 = metodoPago2;
            TempData["metodo2"] = metodoPago2;
            ViewBag.mP3 = metodoPago3;
            TempData["metodo3"] = metodoPago3;
            ViewBag.mP4 = metodoPago4;
            TempData["metodo4"] = metodoPago4;

            return View("~/Views/Pago/PagoEnvio2.cshtml", pago);
        }
        public ActionResult PagoEnvio2()
        {
            return View();
        }
        [HttpPost]
        public ActionResult pagoEnvio2(Pago model, string clienteR, MetodoPago e, Cheque ch, Transferencia trans, Tarjeta tarj)
        {
            //DAOPago data = DAOPago.getInstance();
            //data.insertarPago(model2.monto, model.fecha, pagoD, model2.cod);
            int fkCliente = Int32.Parse(clienteR);
            int pagoTotal = e.montoE + ch.montoCh + trans.montoTrans + tarj.montoTarj;
            int montoTotal = model.montoTotal;
            string metodoPago = TempData["metodo1"].ToString();
            string metodoPago2 = TempData["metodo2"].ToString();
            string metodoPago3 = TempData["metodo3"].ToString();
            string metodoPago4 = TempData["metodo4"].ToString();

            if (pagoTotal == montoTotal)
            {
                DAOPago data2 = DAOPago.getInstance();
                Pago pago = data2.buscarUltimoPago();
                if ((metodoPago == "efectivo")|| (metodoPago2 == "efectivo")||(metodoPago3 == "efectivo") || (metodoPago4 == "efectivo"))
                {
                    DAOEfectivo dataE = DAOEfectivo.getInstance();
                    dataE.insertarEfectivo(pago.cod, e.moneda, fkCliente);
                }
                if ((metodoPago == "cheque") || (metodoPago2 == "cheque") || (metodoPago3 == "cheque") || (metodoPago4 == "cheque"))
                {
                    DAOCheque dataCh = DAOCheque.getInstance();
                    dataCh.insertarCheque(pago.cod, ch.Banco, ch.NroCuenta, ch.fecha, ch.montoCh, fkCliente);
                }
                if ((metodoPago == "transferencia") || (metodoPago2 == "transferencia") || (metodoPago3 == "transferencia") || (metodoPago4 == "transferencia"))
                {
                    DAOTransferencia dataTrans = DAOTransferencia.getInstance();
                    dataTrans.insertarTransferencia(pago.cod, trans.Banco, trans.NroCuenta, trans.descripcion, trans.correo, fkCliente);
                }
                if ((metodoPago == "tarjeta") || (metodoPago2 == "tarjeta") || (metodoPago3 == "tarjeta") || (metodoPago4 == "tarjeta"))
                {
                    DAOTarjeta dataTarj = DAOTarjeta.getInstance();
                    dataTarj.insertarTarjeta(pago.cod, tarj.Banco, tarj.NroCuenta, tarj.tipo, tarj.fechaVencimiento, tarj.marca, fkCliente);
                }

                DAOEnvio data = DAOEnvio.getInstance();
                List<Envio> envios = data.obtenerEnvio();
                foreach (var item in envios)
                {
                    data2 = DAOPago.getInstance();
                    pago = data2.buscarPagoEnvio(item.cod);
                    item.codPago = pago.cod;
                }
                return View("~/Views/EnviarPaquete/IndexEnvio.cshtml", envios);
            }
            else
            {
                DAOPago data2 = DAOPago.getInstance();
                Pago pago = data2.buscarUltimoPago();

                //DAOEfectivo dataE = DAOEfectivo.getInstance();
                //dataE.insertarEfectivo(pago.cod, e.moneda, c.CI);
                //DAOCheque dataCh = DAOCheque.getInstance();
                //dataCh.insertarCheque(pago.cod, ch.Banco, ch.NroCuenta, ch.fecha, ch.montoCh, c.CI);
                //DAOTransferencia dataTrans = DAOTransferencia.getInstance();
                //dataTrans.insertarTransferencia(pago.cod, trans.Banco, trans.NroCuenta, trans.descripcion, trans.correo, c.CI);
                //DAOTarjeta dataTarj = DAOTarjeta.getInstance();
                //dataTarj.insertarTarjeta(pago.cod, tarj.Banco, tarj.NroCuenta, tarj.tipo, tarj.fechaVencimiento, tarj.marca, c.CI);
                
                ViewBag.mP = metodoPago;
                ViewBag.mP2 = metodoPago2;
                ViewBag.mP3 = metodoPago3;
                ViewBag.mP4 = metodoPago4;
                ViewBag.Error = "LA SUMA DE LOS PAGOS NO ES SUFICIENTE";
                return View("~/Views/Pago/PagoEnvio2.cshtml", pago);
            }
        }
        public PartialViewResult NuevoEnvioTB(string id)
        {
            int cod = Int32.Parse(id);
            DAOEnvio data = DAOEnvio.getInstance();
            Envio envio = data.buscarEnvio(cod);
            return PartialView("CodigoNuevoEnvioTextBox", envio);
        }
        public PartialViewResult montoTB(string id)
        {
            int cod = Int32.Parse(id);
            DAOEnvio data = DAOEnvio.getInstance();
            Envio envio = data.buscarEnvio(cod);
            return PartialView("MontoEnvioTextBox", envio);
        }
        public PartialViewResult ClienteMetodoPagoDD()
        {
            DAOCliente data = DAOCliente.getInstance();
            List<Cliente> clientes = data.obtenerClientes();
            return PartialView("ClienteMetodoPAGODropDown", clientes);
        }
        public PartialViewResult EfectivoFORM()
        {
            return PartialView("formEFECTIVO");
        }
        public PartialViewResult ChequeFORM()
        {
            return PartialView("formCHEQUE");
        }
        public PartialViewResult TransferenciaFORM()
        {
            return PartialView("formTRANSFERENCIA");
        }
        public PartialViewResult TarjetaFORM()
        {
            return PartialView("formTARJETA");
        }
    }
}