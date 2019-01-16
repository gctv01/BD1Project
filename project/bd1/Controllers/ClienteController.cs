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
        public ActionResult IndexCliente(string viewba)
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
            string accion = "Cliente Index ";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOCliente data = DAOCliente.getInstance();
            List<Cliente> Clientes = data.obtenerClientes();
            return View(Clientes);
        }
        public ActionResult Home_Cliente()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;
            DAOEnvio data2 = DAOEnvio.getInstance();
            List<Envio> envios = data2.obtenerEnvioUsuarioCliente(codUser);
            return View("~/Views/Cliente/CLIENTE.cshtml", envios);
        }
        [HttpPost]
        public ActionResult BuscarCliente(string cliente)
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
            string accion = "Busco el Cliente " + cliente;
            dataU.insertarAccion(codUser, 2, today, accion);

            if (cliente != "")
            {
                int cod = Int32.Parse(cliente);
                DAOCliente data = DAOCliente.getInstance();
                Cliente oficinaEncontrada = data.buscarCliente(cod);
                List<Cliente> oficinas = new List<Cliente>();
                oficinas.Add(oficinaEncontrada);

                return View("~/Views/Cliente/IndexCliente.cshtml", oficinas);
            }
            else
            {
                DAOCliente data = DAOCliente.getInstance();
                List<Cliente> oficinas = data.obtenerClientes();

                return View("~/Views/Cliente/IndexCliente.cshtml", oficinas);
            }
        }
        //Agregar
        public ActionResult AgregarCliente()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            return View();
        }
        [HttpPost]
        public ActionResult AgregarCliente(Usuario model, string rol, string ciS, string nombre, string apellido,
                                string fechaNac, string telefono, string estCivil, string trabajo, string lugar)
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
            string accion = "Registro Cliente " + ciS;
            dataU.insertarAccion(codUser, 2, today, accion);

            int codlugar = Int32.Parse(lugar);
            int ci = Int32.Parse(ciS);
            int tlfn = Int32.Parse(telefono);
            DAOCliente data = DAOCliente.getInstance();
            data.insertarCliente(ci, nombre, apellido, fechaNac, estCivil, trabajo, codlugar);
            DAOTelefono data3 = DAOTelefono.getInstance();
            data3.insertarTelefonoCli(tlfn, ci);
            List<Cliente> Clientes = data.obtenerClientes();
            DAOUsuario data2 = DAOUsuario.getInstance();
            data2.insertarUsuarioC(model.username, model.contrasena, rol, ci);
            return View("~/Views/Cliente/IndexCliente.cshtml", Clientes);
        }
        //Eliminar Cliente
        public ActionResult EliminarCliente()
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            return View();
        }
        [HttpPost]
        public ActionResult EliminarCliente(Cliente model)
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
            string accion = "Elimino Cliente " + model.CI;
            dataU.insertarAccion(codUser, 4, today, accion);

            DAOTelefono data3 = DAOTelefono.getInstance();
            data3.eliminarTelefonoCli(model.CI);
            DAOUsuario data2 = DAOUsuario.getInstance();
            data2.eliminarUsuarioC(model.CI);
            DAOCliente data = DAOCliente.getInstance();
            data.eliminarCliente(model.CI);
            List<Cliente> Clientes = data.obtenerClientes();
            
            return View("~/Views/Cliente/IndexCliente.cshtml", Clientes);
        }
        //Modificando Cliente
        public ActionResult ModificarCliente(string id)
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            int cod2 = Int32.Parse(id);
            DAOCliente data = DAOCliente.getInstance();
            Cliente ClienteEncontrado = data.buscarCliente(cod2);
            return View(ClienteEncontrado);
        }
        [HttpPost]
        public ActionResult ModificarCliente(Cliente model, string estCivil, string lugar)
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
            string accion = "Modifico Cliente " + model.CI;
            dataU.insertarAccion(codUser, 3, today, accion);

            int codlugar = Int32.Parse(lugar);
            DAOTelefono data3 = DAOTelefono.getInstance();
            data3.modificarTelefonoCli(model.CI, model.telefono);
            DAOCliente data = DAOCliente.getInstance();
            data.modificarCliente(model.CI, model.Nombre, model.Apellido, model.fechaNac, estCivil, model.Trabajo, codlugar);
            List<Cliente> Clientes = data.obtenerClientes();

            return View("~/Views/Cliente/IndexCliente.cshtml", Clientes);
        }
        public PartialViewResult MenuSuperior(string viewba)
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            return PartialView("MenuSuperiorAdm");
        }
        public PartialViewResult MenuSuperiorCli(string viewba)
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            ViewBag.name = name;
            ViewBag.rol = nameRol;
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            return PartialView("MenuSuperiorCli");
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