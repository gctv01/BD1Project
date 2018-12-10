using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using bd1.Models;

namespace bd1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        

        [HttpPost]
        public ActionResult buscando(Usuario model)
        {

            //string name = model.username;
            //string pass = model.contrasena;
            string tipoUsuario = model.tipoUsuario;

            DAOUsuario data = new DAOUsuario();

            int redireccion = data.buscandoUsuario(model.username, model.contrasena);
            if(redireccion == 1)
            {
                if (tipoUsuario ==)
                return View("~/Views/Home/Empleado.cshtml");
            }
            else
            {
                ViewBag.Message = "No existe el usuario, pruebe nuevamente";
                return View("~/Views/Home/Index.cshtml");
            }
            
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Empleado()
        {
            return View();
        }

        public ActionResult Cliente()
        {
            return View();
        }
    }
}