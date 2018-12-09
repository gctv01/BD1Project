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
            ModeloLogIn data = new ModeloLogIn();
            data.Usuario = "RAFAEL";
            data.Contrasena = 1234;
            return View(data);
        }
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(ModeloLogIn model)
        {
           
            string name = model.Usuario;
            int pass = model.Contrasena;

            return View();
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
    }
}