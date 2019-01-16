using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class EmpleadoController : Controller
    {
        // GET: Empleado
        public ActionResult IndexEmpleado(string viewba)
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
            string accion = "Empleados Index";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOEmpleado data = DAOEmpleado.getInstance();
            List<Empleado> Empleados = data.obtenerEmpleado();
            return View(Empleados);
        }
        [HttpPost]
        public ActionResult BuscarEmpleado(string cliente)
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
            string accion = "Busco Empleado " + cliente;
            dataU.insertarAccion(codUser, 1, today, accion);

            if (cliente != "")
            {
                int cod = Int32.Parse(cliente);
                DAOEmpleado data = DAOEmpleado.getInstance();
                Empleado empleadoEncontrado = data.buscarEmpleado(cod);
                List<Empleado> Empleados = new List<Empleado>();
                Empleados.Add(empleadoEncontrado);

                return View("~/Views/Empleado/IndexEmpleado.cshtml", Empleados);
            }
            else
            {
                DAOEmpleado data = DAOEmpleado.getInstance();
                List<Empleado> Empleados = data.obtenerEmpleado();

                return View("~/Views/Empleado/IndexEmpleado.cshtml", Empleados);
            }
        }
        
        //Agregar
        public ActionResult AgregarEmpleado()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            return View();
        }
        [HttpPost]
        public ActionResult AgregarEmpleado(Usuario model, string rol, string ciS, string nombre, 
            string apellido, string fechaNac, string telefono, string correo, string nivelAca, string profesion, string estCivil,
            string ScantHijos, string correoEmp, string salarioAsigS, string fechaContratado,
            string sucursal, string horarioI)
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
            string accion = "Registro Empleado " + ciS;
            dataU.insertarAccion(codUser, 1, today, accion);

            int codSucursal = Int32.Parse(sucursal);
            int ci = Int32.Parse(ciS);
            int cantHijos = Int32.Parse(ScantHijos);
            int salarioAsig = Int32.Parse(salarioAsigS);
            int tlfn = Int32.Parse(telefono);

            DAOEmpleado data = DAOEmpleado.getInstance();
            data.insertarEmpleado(ci,  nombre,
             apellido,  fechaNac,  correo,  nivelAca,  profesion,  estCivil,
             cantHijos,  correoEmp, salarioAsig,  fechaContratado, codSucursal, horarioI);

            DAOTelefono data3 = DAOTelefono.getInstance();
            data3.insertarTelefonoEmp(tlfn, ci); 

            DAOUsuario data2 = DAOUsuario.getInstance();
            data2.insertarUsuarioE(model.username, model.contrasena, rol, ci);

            List<Empleado> Empleados = data.obtenerEmpleado();
            return View("~/Views/Empleado/IndexEmpleado.cshtml", Empleados);
        }
        //Eliminar Empleado
        public ActionResult EliminarEmpleado()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            return View();
        }
        [HttpPost]
        public ActionResult EliminarEmpleado(Empleado model)
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
            string accion = "Elimino Empleado " + model.CI;
            dataU.insertarAccion(codUser, 4, today, accion);

            DAOTelefono data3 = DAOTelefono.getInstance();
            data3.eliminarTelefonoEmp(model.CI);

            DAOEmpleado data = DAOEmpleado.getInstance();
            data.eliminarEmpleado(model.CI);           
            
            DAOUsuario data2 = DAOUsuario.getInstance();
            data2.eliminarUsuarioE(model.CI);
            List<Empleado> Empleados = data.obtenerEmpleado();
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            return View("~/Views/Empleado/IndexEmpleado.cshtml", Empleados);
        }
        //Modificando Empleado
        public ActionResult ModificarEmpleado(string id)
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            int cod2 = Int32.Parse(id);
            DAOEmpleado data = DAOEmpleado.getInstance();
            Empleado EmpleadoEncontrado = data.buscarEmpleado(cod2);
            return View(EmpleadoEncontrado);
        }
        [HttpPost]
        public ActionResult ModificarEmpleado(Empleado model, string estCivil)
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
            string accion = "Modifico Empleado " + model.CI;
            dataU.insertarAccion(codUser, 3, today, accion);

            int ci = Int32.Parse(model.CI.ToString());
            int cantHijos = Int32.Parse(model.cantHijos.ToString());
            int salarioAsig = Int32.Parse(model.salarioAsig.ToString());
            DAOEmpleado data = DAOEmpleado.getInstance();
            data.modificarEmpleado(ci, model.Nombre,
             model.Apellido, model.fechaNac, model.correo, model.nivelAca, model.profesion, estCivil,
             cantHijos, model.correoEmp, salarioAsig, model.fechaContratado, model.telefono);
            List<Empleado> Empleados = data.obtenerEmpleado();

            return View("~/Views/Empleado/IndexEmpleado.cshtml", Empleados);
        }
        //ASISTENCIA
        public ActionResult AsistenciaEmpleado()
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
            string accion = "Asistencia de Empleados";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOEmpleado data = DAOEmpleado.getInstance();
            List<Empleado> empleados = data.obtenerEmpleadoAsistencia();
            return View(empleados);
        }
        public ActionResult RegistroAsistencia()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            return View();
        }
        [HttpPost]
        public ActionResult RegistroAsistencia(Empleado model, string empleadoE, string zona)
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
            string accion = "Registro Asistencia de " + model.CI;
            dataU.insertarAccion(codUser, 1, today, accion);

            int ci = Int32.Parse(empleadoE);
            int codZ = Int32.Parse(zona);
            DAOEmpleado data = DAOEmpleado.getInstance();
            data.registrarAsistencia(ci, codZ, model.fechaContratado);
            data = DAOEmpleado.getInstance();
            List<Empleado> empleados = data.obtenerEmpleadoAsistencia();
            return View("~/Views/Empleado/AsistenciaEmpleado.cshtml", empleados);
        }
        [HttpPost]
        public ActionResult BuscarEmpleadoAsistencia(string cliente)
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
            string accion = "Busco Asistencia de " + cliente;
            dataU.insertarAccion(codUser, 2, today, accion);

            if (cliente != "")
            {
                int cod = Int32.Parse(cliente);
                DAOEmpleado data = DAOEmpleado.getInstance();
                List<Empleado> empleados = data.buscarEmpleadoAsistencia(cod);
                return View("~/Views/Empleado/AsistenciaEmpleado.cshtml", empleados);
            }
            else
            {
                DAOEmpleado data = DAOEmpleado.getInstance();
                List<Empleado> Empleados = data.obtenerEmpleadoAsistencia();

                return View("~/Views/Empleado/AsistenciaEmpleado.cshtml", Empleados);
            }
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
        public PartialViewResult TBCliente()
        {
            return PartialView("TextBoxCLIENTE");
        }
        public PartialViewResult Rol()
        {
            DAORol data = DAORol.getInstance();
            List<Rol> roles = data.obtenerRol();
            return PartialView("rolDropdown", roles);
        }
        public PartialViewResult OficinaEmpDD()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> Oficinas = data.obtenerOficinas();
            return PartialView("SucursalEmpleado", Oficinas);
        }
        public PartialViewResult HorarioDD()
        {
            DAOHorario data = DAOHorario.getInstance();
            List<Horario> Horarios = data.obtenerHorarios();
            return PartialView("HorarioDropDown", Horarios);
        }
        public PartialViewResult Empleado()
        {
            return PartialView("formEmpleado");
        }
        public PartialViewResult EmpleadoDD()
        {
            DAOEmpleado data = DAOEmpleado.getInstance();
            List<Empleado> empleados = data.obtenerEmpleado();
            return PartialView("EmpleadoEnvioDropDown", empleados);
        }
        public PartialViewResult ZonaDD()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> zonas = data.obtenerZona();
            return PartialView("ZonaDropDown", zonas);
        }
    }
}