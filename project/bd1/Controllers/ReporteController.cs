﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class ReporteController : Controller
    {
        // GET: Reporte
        public ActionResult IndexReporte()
        {
            return View();
        }

        public PartialViewResult MenuSuperior()
        {
            return PartialView("MenuSuperiorAdm");
        }
    }
}