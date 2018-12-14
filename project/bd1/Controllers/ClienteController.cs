using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class ClienteController : Controller
    {
        // GET: Cliente
        public ActionResult IndexCliente()
        {
            DAOCliente data = DAOCliente.getInstance();
            List<Cliente> Clientes = data.obtenerClientes();
            return View(Clientes);
        }
        //Agregar
        public ActionResult AgregarCliente()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AgregarCliente(Usuario model, string rol, string ciS, string nombre, string apellido,
                                string fechaNac, string estCivil, string trabajo, string lugar)
        {   
            int codlugar = Int32.Parse(lugar);
            int ci = Int32.Parse(ciS);
            DAOCliente data = DAOCliente.getInstance();
            data.insertarCliente(ci, nombre, apellido, fechaNac, estCivil, trabajo, codlugar);
            List<Cliente> Clientes = data.obtenerClientes();
            DAOUsuario data2 = DAOUsuario.getInstance();
            data2.insertarUsuarioC(model.username, model.contrasena, rol, ci);
            return View("~/Views/Cliente/IndexCliente.cshtml", Clientes);
        }
        //Eliminar Cliente
        public ActionResult EliminarCliente()
        {

            return View();
        }
        [HttpPost]
        public ActionResult EliminarCliente(Cliente model)
        {
            //int cod = Int32.Parse(model.cod);
            DAOCliente data = DAOCliente.getInstance();
            data.eliminarCliente(model.CI);
            List<Cliente> Clientes = data.obtenerClientes();
            DAOUsuario data2 = DAOUsuario.getInstance();
            data2.eliminarUsuarioC(model.CI);
            return View("~/Views/Cliente/IndexCliente.cshtml", Clientes);
        }
        //Modificando Cliente
        public ActionResult ModificarCliente(string id)
        {
            int cod2 = Int32.Parse(id);
            DAOCliente data = DAOCliente.getInstance();
            Cliente ClienteEncontrado = data.buscarCliente(cod2);
            return View(ClienteEncontrado);
        }
        [HttpPost]
        public ActionResult ModificarCliente(Cliente model, string estCivil, string lugar)
        {
            int codlugar = Int32.Parse(lugar);
            DAOCliente data = DAOCliente.getInstance();
            data.modificarCliente(model.CI, model.Nombre, model.Apellido, model.fechaNac, estCivil, model.Trabajo, codlugar);
            List<Cliente> Clientes = data.obtenerClientes();

            return View("~/Views/Cliente/IndexCliente.cshtml", Clientes);
        }
        public PartialViewResult MenuSuperior()
        {
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

        public PartialViewResult Cliente()
        {
            return PartialView("formCliente");
        }
        public PartialViewResult LugarDD()
        {
            DAOLugar data = DAOLugar.getInstance();
            List<Lugar> Lugares = data.obtenerLugar();
            return PartialView("LugarDropDown", Lugares);
        }
    }
}