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

        public PartialViewResult MenuSuperior()
        {
            return PartialView("MenuSuperiorAdm");
        }
    }
}