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
                                string fechaNac, string estCivil, string trabajo)
        {

            //string name = model.username;
            //int pass = model.Contrasena;
            //DateTime parsedDate = DateTime.Parse(fechaNac);
            int ci = Int32.Parse(ciS);

            DAOCliente data2 = DAOCliente.getInstance();
            data2.insertarCliente(ci, nombre, apellido, fechaNac, estCivil, trabajo);

            DAOUsuario data = DAOUsuario.getInstance();
            data.insertarUsuarioC(model.username, model.contrasena, rol, ci);

            return View("~/Views/Home/Index.cshtml");
        }
        [HttpPost]
        public ActionResult RegistroE(Usuario model, string rol, string ciS, string nombre, string apellido,
                    string fechaNac, string correo, string nivelAca, string profesion, string estCivil, 
                    string cantHijos, string correoEmp, string horarioAsig, string salarioAsig, 
                    string fechaContratado, string fechaFinal)
        {

            int salario = Int32.Parse(salarioAsig);
            int hijos = Int32.Parse(cantHijos);
            int ci = Int32.Parse(ciS);
            correoEmp = correoEmp + "@LogUCAB.com";

            DAOEmpleado data2 = DAOEmpleado.getInstance();
            data2.insertarEmpleado(ci, nombre, apellido, fechaNac, correo, nivelAca, profesion, estCivil, hijos,
                correoEmp, salario, fechaContratado, fechaFinal);

            DAOUsuario data = DAOUsuario.getInstance();
            data.insertarUsuarioE(model.username, model.contrasena, rol, ci);

            return View("~/Views/Home/Index.cshtml");
        }
    }
}