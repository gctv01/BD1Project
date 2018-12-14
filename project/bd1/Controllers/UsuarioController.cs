using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class UsuarioController : Controller
    {
        // GET: Usuario
        public ActionResult IndexUsuario()
        {
            DAOUsuario data = DAOUsuario.getInstance();
            List<Usuario> Usuarios = data.obtenerUsuario();

            return View(Usuarios);
        }
        public ActionResult ModificarUsuario(string id)
        {
            int cod2 = Int32.Parse(id);
            DAOUsuario data = DAOUsuario.getInstance();
            Usuario UsuarioEncontrado = data.buscarUsuario(cod2);
            return View(UsuarioEncontrado);
        }
        [HttpPost]
        public ActionResult ModificarUsuario(Usuario model)
        {

            DAOUsuario data = DAOUsuario.getInstance();
            data.modificarUsuario(model. cod, model.username, model.contrasena, model.Rol);
            List<Usuario> Usuarios = data.obtenerUsuario();

            return View("~/Views/Usuario/IndexUsuario.cshtml", Usuarios);
        }
        public PartialViewResult MenuSuperior()
        {
            return PartialView("MenuSuperiorAdm");
        }
        public PartialViewResult RolDD()
        {
            DAORol data = DAORol.getInstance();
            List<Rol> roles = data.obtenerRol();
            return PartialView("rolDropdown", roles);
        }
    }
}