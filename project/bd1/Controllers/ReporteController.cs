using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class ReporteController : Controller
    {
        // GET: Reporte
        public ActionResult IndexReporte(string viewba)
        {
            ViewBag.name = viewba;
            return View();
        }
        public ActionResult Reporte1R()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte1R();
            return View(oficinas);
        }
        public ActionResult Reporte3R()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte2R();
            return View(oficinas);
        }
        public ActionResult Reporte5R()
        {
            DAORuta data = DAORuta.getInstance();
            List<Ruta> rutas = data.obtenerReporte5R();
            return View(rutas);
        }
        public ActionResult Reporte7R()
        {
            DAOEmpleado data = DAOEmpleado.getInstance();
            List<Empleado> empleados = data.obtenerReporte7R();
            return View(empleados);
        }
        public ActionResult Reporte8R()
        {
            DAOEmpleado data = DAOEmpleado.getInstance();
            List<Empleado> empleados = data.obtenerReporte8R();
            return View(empleados);
        }
        public ActionResult Reporte12_1R()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte12_1R();
            return View(oficinas);
        }
        public ActionResult Reporte12_2R()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte12_2R();
            return View(oficinas);
        }
        public PartialViewResult MenuSuperior()
        {
            return PartialView("MenuSuperiorAdm");
        }
    }
}