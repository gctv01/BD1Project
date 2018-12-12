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
    }
}