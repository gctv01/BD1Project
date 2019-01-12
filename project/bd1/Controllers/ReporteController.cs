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