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
        public ActionResult Reporte10R()
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
            string accion = "Reporte 10R";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOUsuario data = DAOUsuario.getInstance();
            List<Usuario> usuarios = data.obtenerReporte10R();
            return View(usuarios);
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
        public ActionResult Reporte9E()
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
            string accion = "Reporte 9E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOPaquete data = DAOPaquete.getInstance();
            List<Paquete> paquetes = data.obtenerReporte9E();
            return View(paquetes);
        }
        public ActionResult Reporte10E_1()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Reporte10E_1(string fecha1, string fecha2)
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
            string accion = "Reporte 10E";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerReporte10E(fecha1, fecha2);
            return View("~/Views/Reporte/Reporte10E.cshtml", oficinas);
        }
        public ActionResult Reporte11E()
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
            string accion = "Reporte 11E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOUsuario data = DAOUsuario.getInstance();
            List<Usuario> paquetes = data.obtenerReporte11E();
            return View(paquetes);
        }
        public ActionResult Reporte12E()
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
            string accion = "Reporte 12E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOVehiculo data = DAOVehiculo.getInstance();
            List<Vehiculo> paquetes = data.obtenerReporte12E();
            return View(paquetes);
        }
        public ActionResult Reporte13E()
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
            string accion = "Reporte 13E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOVehiculo data = DAOVehiculo.getInstance();
            List<Vehiculo> paquetes = data.obtenerReporte13E();
            return View(paquetes);
        }
        public ActionResult Reporte14E()
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
            string accion = "Reporte 14E";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> paquetes = data.obtenerReporte14E();
            return View(paquetes);
        }
        public ActionResult Reporte16E()
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
            string accion = "Reporte 16E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOAvion data = DAOAvion.getInstance();
            List<Avion> paquetes = data.obtenerAviones();
            return View(paquetes);
        }
        public ActionResult Reporte17_1E()
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
            string accion = "Reporte 17_1E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOVehiculo data = DAOVehiculo.getInstance();
            List<Vehiculo> paquetes = data.obtenerReporte17_1E();
            return View(paquetes);
        }
        public ActionResult Reporte17_2E()
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
            string accion = "Reporte 17_2E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOVehiculo data = DAOVehiculo.getInstance();
            List<Vehiculo> paquetes = data.obtenerReporte17_2E();
            return View(paquetes);
        }
        public ActionResult Reporte18E()
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
            string accion = "Reporte 18E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOEmpleado data = DAOEmpleado.getInstance();
            List<Empleado> paquetes = data.obtenerReporte18E();
            return View(paquetes);
        }
        public ActionResult Reporte19E_1()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Reporte19E_1(string fecha1, string fecha2)
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
            string accion = "Reporte 19E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOPaquete data = DAOPaquete.getInstance();
            List<Paquete> paquetes = data.obtenerReporte19E(fecha1, fecha2);
            return View("~/Views/Reporte/Reporte19E.cshtml", paquetes);
        }
        public ActionResult Reporte20E()
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
            string accion = "Reporte 20E";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> paquetes = data.obtenerReporte20E();
            return View(paquetes);
        }
        public ActionResult Reporte21E()
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
            string accion = "Reporte 21E";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> paquetes = data.obtenerReporte21E();
            return View(paquetes);
        }
        public ActionResult Reporte22E()
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
            string accion = "Reporte 22E";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> paquetes = data.obtenerReporte22E();
            return View(paquetes);
        }
        public ActionResult Reporte23E()
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
            string accion = "Reporte 23E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOUsuario data = DAOUsuario.getInstance();
            List<Usuario> paquetes = data.obtenerReporte23E();
            return View(paquetes);
        }
        public ActionResult Reporte26E()
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
            string accion = "Reporte 26E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOLugar data = DAOLugar.getInstance();
            List<Lugar> paquetes = data.obtenerReporte26E();
            return View(paquetes);
        }
        public ActionResult Reporte27E()
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
            string accion = "Reporte 27E";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOVehiculo data = DAOVehiculo.getInstance();
            List<Vehiculo> paquetes = data.obtenerReporte27E();
            return View(paquetes);
        }
        public ActionResult Reporte28E_1()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Reporte28E_1(string fecha1, string fecha2)
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
            string accion = "Reporte 28E";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> paquetes = data.obtenerReporte28E(fecha1, fecha2);
            return View("~/Views/Reporte/Reporte28E.cshtml", paquetes);
        }
        public ActionResult Reporte30E()
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
            string accion = "Reporte 30E";
            dataU.insertarAccion(codUser, 2, today, accion);

            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> paquetes = data.obtenerReporte30E();
            return View(paquetes);
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