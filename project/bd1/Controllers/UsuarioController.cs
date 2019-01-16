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
        public ActionResult IndexUsuario(string viewba)
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Usuario Index ";
            dataU.insertarAccion(codUser, 2, today, accion);

            ViewBag.name = viewba;
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
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Modifico Usuario " + model.cod;
            dataU.insertarAccion(codUser, 3, today, accion);

            DAOUsuario data = DAOUsuario.getInstance();
            data.modificarUsuario(model. cod, model.username, model.contrasena, model.Rol);
            List<Usuario> Usuarios = data.obtenerUsuario();

            return View("~/Views/Usuario/IndexUsuario.cshtml", Usuarios);
        }
        public PartialViewResult MenuSuperior()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
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