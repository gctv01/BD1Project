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
        public ActionResult Reporte2R()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte2R();
            return View(oficinas);
        }
        public ActionResult Reporte3R()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte3R();
            return View(oficinas);
        }
        public ActionResult Reporte4R()
        {
            DAOEnvio data = DAOEnvio.getInstance();
            List<Envio> envios = data.obtenerReporte4R();
            return View(envios);
        }
        public ActionResult Reporte5R()
        {
            DAORuta data = DAORuta.getInstance();
            List<Ruta> rutas = data.obtenerReporte5R();
            return View(rutas);
        }
        public ActionResult Reporte6R()
        {
            DAOEmpleado data = DAOEmpleado.getInstance();
            List<Empleado> empleados = data.obtenerReporte6R();
            return View(empleados);
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
        public ActionResult Reporte13R()
        {
            DAOVehiculo data = DAOVehiculo.getInstance();
            List<Vehiculo> vehiculos = data.obtenerReporte13R();
            return View(vehiculos);
        }
        public ActionResult Reporte14R()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte14R();
            return View(oficinas);
        }
        public ActionResult Reporte1E()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte1E();
            return View(oficinas);
        }
        public ActionResult Reporte2E()
        {
            DAOVehiculo data = DAOVehiculo.getInstance();
            List<Vehiculo> vehiculos = data.obtenerReporte2E();
            return View(vehiculos);
        }
        public ActionResult Reporte4E_1()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Reporte4E_1(string fecha1, string fecha2)
        {          
            DAOEmpleado data = DAOEmpleado.getInstance();
            Empleado cont = data.obtenerReporte4E_cont(fecha1, fecha2);
            ViewBag.contEmpleados = cont.gastos;
            List<Empleado> empleados = data.obtenerReporte4E(fecha1, fecha2);
            return View("~/Views/Reporte/Reporte4E.cshtml", empleados);
        }
        public ActionResult Reporte4E()
        {
            return View();
        }
        public ActionResult Reporte5E()
        {
            DAORuta data = DAORuta.getInstance();
            List<Ruta> rutas = data.obtenerRuta();
            return View(rutas);
        }
        public ActionResult Reporte6E()
        {
            DAOVehiculo data = DAOVehiculo.getInstance();
            List<Vehiculo> vehiculos = data.obtenerReporte6E();
            return View(vehiculos);
        }
        public ActionResult Reporte7E_1()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Reporte7E_1(string fecha1, string fecha2)
        {
            DAOVehiculo data = DAOVehiculo.getInstance();
            List<Vehiculo> vehiculos = data.obtenerReporte7E(fecha1, fecha2);
            return View("~/Views/Reporte/Reporte7E.cshtml", vehiculos);
        }
        public PartialViewResult MenuSuperior()
        {
            return PartialView("MenuSuperiorAdm");
        }
    }
}