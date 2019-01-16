using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult IndexAdmin()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;
            return View();
        }

        public PartialViewResult MenuSuperior()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["codUser"] = codUser;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            return PartialView("MenuSuperiorAdm");
        }
        public PartialViewResult TBOficina()
        {
            return PartialView("TextBoxOFICINA");
        }
    }
}