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
            DAORol data = new DAORol();
            List<Rol> roles = data.obtenerRol();
            return View(roles);
        }

        [HttpPost]
        public ActionResult Registro(Usuario model)
        {

            //string name = model.username;
            //int pass = model.Contrasena;

            DAOUsuario data = new DAOUsuario();

            data.insertar(model.username, model.contrasena);

            return View("~/Views/Register/Registro.cshtml");
        }
    }
}