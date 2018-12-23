using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class VehiculoController : Controller
    {
        // GET: Vehiculo
        public ActionResult IndexVehiculo()
        {
            DAOTerrestre data = DAOTerrestre.getInstance();
            List<Terrestre> terrestre = data.obtenerTerrestres();

            return View(terrestre);
        }
        public PartialViewResult MenuSuperior()
        {
            return PartialView("MenuSuperiorAdm");
        }
        //Agregar Terrestre
        public ActionResult AgregarTerrestre()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AgregarTerrestre(Terrestre model, string modeloVeh, string sucursal)
        {
            int fkModelo = Int32.Parse(modeloVeh);
            int fkSucursal = Int32.Parse(sucursal);
            DAOTerrestre data = DAOTerrestre.getInstance();
            data.insertarTerrestres(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.tipo, fkSucursal, fkModelo);
            List<Terrestre> terrestres = data.obtenerTerrestres();

            return View("~/Views/Vehiculo/IndexVehiculo.cshtml", terrestres);
        }
        public PartialViewResult OficinaEmpDD()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> Oficinas = data.obtenerOficinas();
            return PartialView("SucursalEmpleado", Oficinas);
        }
        public PartialViewResult ModeloVehDD()
        {
            DAOModelo data = DAOModelo.getInstance();
            List<ModeloVehiculo> ModeloVehiculos = data.obtenerModeloVehiculo();
            return PartialView("ModeloVehiculoDropDown", ModeloVehiculos);
        }
        //Eliminar Terrestre
        public ActionResult EliminarTerrestre()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EliminarTerrestre(Terrestre model)
        {
            //int cod = Int32.Parse(model.cod);
            DAOTerrestre data = DAOTerrestre.getInstance();
            data.eliminarTerrestre(model.placa);
            List<Terrestre> terrestres = data.obtenerTerrestres();

            return View("~/Views/Vehiculo/IndexVehiculo.cshtml", terrestres);
        }
        //Modificar Terrestre
        public ActionResult ModificarTerrestre(string id)
        {
            DAOTerrestre data = DAOTerrestre.getInstance();
            Terrestre terrestreEncontrado = data.buscarTerrestre(id);
            return View(terrestreEncontrado);
        }
        [HttpPost]
        public ActionResult ModificarTerrestre(Terrestre model)
        {
            DAOTerrestre data = DAOTerrestre.getInstance();
            data.modificarTerrestre(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.tipo);
            List<Terrestre> terrestres = data.obtenerTerrestres();

            return View("~/Views/Vehiculo/IndexVehiculo.cshtml", terrestres);
        }

        //INDEX BARCO
        public ActionResult IndexBarco()
        {
            DAOBarco data = DAOBarco.getInstance();
            List<Barco> Barcos = data.obtenerBarcos();
            if(Barcos!=null)
                return View("~/Views/Vehiculo/Barco.cshtml", Barcos);
            else
                return View("~/Views/Vehiculo/Barco.cshtml");
        }
        //Agregar Barco
        public ActionResult AgregarBarco()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AgregarBarco(Barco model)
        {

            DAOBarco data = DAOBarco.getInstance();
            data.insertarBarco(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.nombre);
            List<Barco> Barcos = data.obtenerBarcos();

            return View("~/Views/Vehiculo/Barco.cshtml", Barcos);
        }
        //Eliminar Barco
        public ActionResult EliminarBarco()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EliminarBarco(Barco model)
        {
            //int cod = Int32.Parse(model.cod);
            DAOBarco data = DAOBarco.getInstance();
            data.eliminarBarco(model.placa);
            List<Barco> Barcos = data.obtenerBarcos();

            return View("~/Views/Vehiculo/Barco.cshtml", Barcos);
        }
        //Modificar Barco
        public ActionResult ModificarBarco(string id)
        {
            DAOBarco data = DAOBarco.getInstance();
            Barco BarcoEncontrado = data.buscarBarco(id);
            return View(BarcoEncontrado);
        }
        [HttpPost]
        public ActionResult ModificarBarco(Barco model)
        {
            DAOBarco data = DAOBarco.getInstance();
            data.modificarBarco(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.nombre);
            List<Barco> Barcos = data.obtenerBarcos();

            return View("~/Views/Vehiculo/Barco.cshtml", Barcos);
        }
        //INDEX AVION
        public ActionResult IndexAvion()
        {
            DAOAvion data = DAOAvion.getInstance();
            List<Avion> Aviones = data.obtenerAviones();
            if (Aviones != null)
                return View("~/Views/Vehiculo/Avion.cshtml", Aviones);
            else
                return View("~/Views/Vehiculo/Avion.cshtml");
        }
        //Agregar Barco
        public ActionResult AgregarAvion()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AgregarAvion(Avion model)
        {

            DAOAvion data = DAOAvion.getInstance();
            data.insertarAvion(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.longitud,
                model.pesoVacio, model.envergadura, model.pesoMax, model.altura, model.anchoCabina,
                model.capacidadCombustible, model.carreraDespegue, model.diametroFuselaje);
            List<Avion> Aviones = data.obtenerAviones();

            return View("~/Views/Vehiculo/Avion.cshtml", Aviones);
        }
        //Eliminar Barco
        public ActionResult EliminarAvion()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EliminarAvion(Avion model)
        {
            //int cod = Int32.Parse(model.cod);
            DAOAvion data = DAOAvion.getInstance();
            data.eliminarAvion(model.placa);
            List<Avion> Aviones = data.obtenerAviones();

            return View("~/Views/Vehiculo/Avion.cshtml", Aviones);
        }
        //Modificar Barco
        public ActionResult ModificarAvion(string id)
        {
            DAOAvion data = DAOAvion.getInstance();
            Avion AvionEncontrado = data.buscarAvion(id);
            return View(AvionEncontrado);
        }
        [HttpPost]
        public ActionResult ModificarAvion(Avion model)
        {
            DAOAvion data = DAOAvion.getInstance();
            data.modificarAvion(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.longitud,
                model.pesoVacio, model.envergadura, model.pesoMax, model.altura, model.anchoCabina,
                model.capacidadCombustible, model.carreraDespegue, model.diametroFuselaje);
            List<Avion> Aviones = data.obtenerAviones();

            return View("~/Views/Vehiculo/Avion.cshtml", Aviones);
        }
    }
}