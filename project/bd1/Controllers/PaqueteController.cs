using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class PaqueteController : Controller
    {
        // GET: Paquete
        public ActionResult IndexPaquete(string viewba)
        {
            ViewBag.name = viewba;
            return View();
        }
        public PartialViewResult MenuSuperior()
        {
            string name = TempData["username"].ToString();
            ViewBag.name = name;
            TempData["username"] = name;
            return PartialView("MenuSuperiorAdm");
        }
    }
}