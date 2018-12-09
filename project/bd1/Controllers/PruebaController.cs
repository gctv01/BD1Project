﻿using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class PruebaController : Controller
    {
        // GET: Prueba
        public ActionResult PruebaTabla()
        {
            DAO data = new DAO();
            List<Persona> personas = data.obtenerPersonas();

            return View(personas);
			//prueba
        }
    }
}