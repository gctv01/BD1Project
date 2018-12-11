using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        public ActionResult Registro()
        {
            return View();
        }

        public PartialViewResult Rol()
        {
            DAORol data = DAORol.getInstance();
            List<Rol> roles = data.obtenerRol();
            return PartialView("rolDropdown", roles);
        }

        [HttpPost]
        public ActionResult Registro(Usuario model, string rol)
        {

            //string name = model.username;
            //int pass = model.Contrasena;

            DAOUsuario data = DAOUsuario.getInstance();

            data.insertarUsuario(model.username, model.contrasena, rol);

            return View("~/Views/Register/Registro.cshtml");
        }
    }
}