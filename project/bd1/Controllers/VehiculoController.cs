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
        public ActionResult AgregarTerrestre(Terrestre model)
        {

            DAOTerrestre data = DAOTerrestre.getInstance();
            data.insertarTerrestres(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.tipo);
            List<Terrestre> terrestres = data.obtenerTerrestres();

            return View("~/Views/Vehiculo/IndexVehiculo.cshtml", terrestres);
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

            return View("~/Views/Vehiculo/IndexTerrestre.cshtml", terrestres);
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
        //Modificar Terrestre
        public ActionResult ModificarBarco(string id)
        {
            DAOBarco data = DAOBarco.getInstance();
            Barco BarcoEncontrado = data.buscarBarco(id);
            DateTime date = DateTime.Parse(BarcoEncontrado.fechaCreacion);
            ViewBag.date = date;
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
    }
}