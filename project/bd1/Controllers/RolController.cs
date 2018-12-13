using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class RolController : Controller
    {
        // GET: Roles
        public ActionResult IndexRol()
        {
            DAORol data = DAORol.getInstance();
            List<Rol> Roles = data.obtenerRol();

            return View(Roles);
        }
        [HttpPost]
        public ActionResult BuscarRol(string rol)
        {
            if (rol != "")
            {
                int cod = Int32.Parse(rol);
                DAORol data = DAORol.getInstance();
                Rol RolEncontrado = data.buscarRol(cod);
                List<Rol> Roles = new List<Rol>();
                Roles.Add(RolEncontrado);

                return View("~/Views/Rol/IndexRol.cshtml", Roles);
            }
            else
            {
                DAORol data = DAORol.getInstance();
                List<Rol> Roles = data.obtenerRol();

                return View("~/Views/Rol/IndexRol.cshtml", Roles);
            }
        }
        //Agregar Rol
        public ActionResult AgregarRol()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AgregarRol(Rol model)
        {

            DAORol data = DAORol.getInstance();
            data.insertarRol(model.Nombre);
            List<Rol> Roles = data.obtenerRol();

            return View("~/Views/Rol/IndexRol.cshtml", Roles);
        }
        //Eliminar Rol
        public ActionResult EliminarRol()
        {

            return View();
        }
        [HttpPost]
        public ActionResult EliminarRol(Rol model)
        {
            //int cod = Int32.Parse(model.cod);
            DAORol data = DAORol.getInstance();
            data.eliminarRol(model.COD);
            List<Rol> Roles = data.obtenerRol();

            return View("~/Views/Rol/IndexRol.cshtml", Roles);
        }
        //Modificando Rol
        public ActionResult ModificarRol(string id)
        {
            int cod2 = Int32.Parse(id);
            DAORol data = DAORol.getInstance();
            Rol RolEncontrado = data.buscarRol(cod2);
            return View(RolEncontrado);
        }
        [HttpPost]
        public ActionResult ModificarRol(Rol model)
        {

            DAORol data = DAORol.getInstance();
            data.modificarRol(model.COD, model.Nombre);
            List<Rol> oficinas = data.obtenerRol();

            return View("~/Views/Rol/IndexRol.cshtml", oficinas);
        }
        public PartialViewResult MenuSuperior()
        {
            return PartialView("MenuSuperiorAdm");
        }
        public PartialViewResult TBOficina()
        {
            return PartialView("TextBoxOFICINA");
        }
    }
}