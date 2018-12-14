using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        public ActionResult Registro(string ID)
        {
            ViewBag.ID = ID;
            return View();
        }

        public PartialViewResult Rol()
        {
            DAORol data = DAORol.getInstance();
            List<Rol> roles = data.obtenerRol();
            return PartialView("rolDropdown", roles);
        }

        public PartialViewResult Cliente()
        {
            return PartialView("formCliente");
        }

        public PartialViewResult Empleado()
        {
            return PartialView("formEmpleado");
        }

        [HttpPost]
        public ActionResult RegistroC(Usuario model, string rol, string ciS, string nombre, string apellido,
                                string fechaNac, string estCivil, string trabajo, string lugar)
        {

            //string name = model.username;
            //int pass = model.Contrasena;
            //DateTime parsedDate = DateTime.Parse(fechaNac);
            int ci = Int32.Parse(ciS);
            int codlugar = Int32.Parse(lugar);
            DAOCliente data2 = DAOCliente.getInstance();
            data2.insertarCliente(ci, nombre, apellido, fechaNac, estCivil, trabajo, codlugar);

            DAOUsuario data = DAOUsuario.getInstance();
            data.insertarUsuarioC(model.username, model.contrasena, rol, ci);

            return View("~/Views/Home/Index.cshtml");
        }
        [HttpPost]
        public ActionResult RegistroE(Usuario model, string rol, string ciS, string nombre, string apellido,
                    string fechaNac, string correo, string nivelAca, string profesion, string estCivil, 
                    string ScantHijos, string correoEmp, string horarioAsig, string salarioAsigS, 
                    string fechaContratado, string fechaFinal, string sucursal, string horario)
        {

            int salario = Int32.Parse(salarioAsigS);
            int hijos = Int32.Parse(ScantHijos);
            int ci = Int32.Parse(ciS);
            int codSucursal = Int32.Parse(sucursal);
            correoEmp = correoEmp + "@LogUCAB.com";

            DAOEmpleado data2 = DAOEmpleado.getInstance();
            data2.insertarEmpleado(ci, nombre, apellido, fechaNac, correo, nivelAca, profesion, estCivil, hijos,
                correoEmp, salario, fechaContratado, fechaFinal, codSucursal, horario);

            DAOUsuario data = DAOUsuario.getInstance();
            data.insertarUsuarioE(model.username, model.contrasena, rol, ci);

            return View("~/Views/Home/Index.cshtml");
        }
        public PartialViewResult LugarDD()
        {
            DAOLugar data = DAOLugar.getInstance();
            List<Lugar> Lugares = data.obtenerLugar();
            return PartialView("LugarDropDown", Lugares);
        }
        public PartialViewResult OficinaDD()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> Oficinas = data.obtenerOficinas();
            return PartialView("SucursalDropDown", Oficinas);
        }
        public PartialViewResult HorarioDD()
        {
            DAOHorario data = DAOHorario.getInstance();
            List<Horario> Horarios = data.obtenerHorarios();
            return PartialView("HorarioDropDown", Horarios);
        }
    }
}