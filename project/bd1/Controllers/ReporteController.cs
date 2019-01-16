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
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reportes Index";
            dataU.insertarAccion(codUser, 2, today, accion);

            return View();
        }
        public ActionResult Reporte1R()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 1R";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte1R();
            return View(oficinas);
        }
        public ActionResult Reporte2R()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 2R";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte2R();
            return View(oficinas);
        }
        public ActionResult Reporte3R()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 3R";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte3R();
            return View(oficinas);
        }
        public ActionResult Reporte4R()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 4R";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOEnvio data = DAOEnvio.getInstance();
            List<Envio> envios = data.obtenerReporte4R();
            return View(envios);
        }
        public ActionResult Reporte5R()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 5R";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAORuta data = DAORuta.getInstance();
            List<Ruta> rutas = data.obtenerReporte5R();
            return View(rutas);
        }
        public ActionResult Reporte6R()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 6R";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOEmpleado data = DAOEmpleado.getInstance();
            List<Empleado> empleados = data.obtenerReporte6R();
            return View(empleados);
        }
        public ActionResult Reporte7R()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 7R";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOEmpleado data = DAOEmpleado.getInstance();
            List<Empleado> empleados = data.obtenerReporte7R();
            return View(empleados);
        }
        public ActionResult Reporte8R()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 8R";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOEmpleado data = DAOEmpleado.getInstance();
            List<Empleado> empleados = data.obtenerReporte8R();
            return View(empleados);
        }
        public ActionResult Reporte12_1R()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 12.1R";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte12_1R();
            return View(oficinas);
        }
        public ActionResult Reporte12_2R()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 12.2R";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte12_2R();
            return View(oficinas);
        }
        public ActionResult Reporte13R()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 13R";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOVehiculo data = DAOVehiculo.getInstance();
            List<Vehiculo> vehiculos = data.obtenerReporte13R();
            return View(vehiculos);
        }
        public ActionResult Reporte14R()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 14R";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte14R();
            return View(oficinas);
        }
        public ActionResult Reporte1E()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 1E";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte1E();
            return View(oficinas);
        }
        public ActionResult Reporte2E()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 2E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOVehiculo data = DAOVehiculo.getInstance();
            List<Vehiculo> vehiculos = data.obtenerReporte2E();
            return View(vehiculos);
        }
        public ActionResult Reporte3E()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 3E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOEmpleado data = DAOEmpleado.getInstance();
            List<Empleado> empleados = data.obtenerReporte3E();
            return View(empleados);
        }
        public ActionResult Reporte4E_1()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Reporte4E_1(string fecha1, string fecha2)
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 4E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOEmpleado data = DAOEmpleado.getInstance();
            Empleado cont = data.obtenerReporte4E_cont(fecha1, fecha2);
            ViewBag.contEmpleados = cont.gastos;
            List<Empleado> empleados = data.obtenerReporte4E(fecha1, fecha2);
            return View("~/Views/Reporte/Reporte4E.cshtml", empleados);
        }
        public ActionResult Reporte5E()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 5E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAORuta data = DAORuta.getInstance();
            List<Ruta> rutas = data.obtenerRuta();
            return View(rutas);
        }
        public ActionResult Reporte6E()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 6E";
            dataU.insertarAccion(codUser, 2, today, accion);

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
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 7E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOVehiculo data = DAOVehiculo.getInstance();
            List<Vehiculo> vehiculos = data.obtenerReporte7E(fecha1, fecha2);
            return View("~/Views/Reporte/Reporte7E.cshtml", vehiculos);
        }
        public ActionResult Reporte8E()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;

            DAOUsuario dataU = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Reporte 8E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOCliente data = DAOCliente.getInstance();
            List<Cliente> clientes = data.obtenerReporte8E();
            return View(clientes);
        }
        public PartialViewResult MenuSuperior()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            return PartialView("MenuSuperiorAdm");
        }
    }
}