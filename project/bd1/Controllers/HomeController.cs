using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using bd1.Models;

namespace bd1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            return View();
        }
        public ActionResult Salir(string salir)
        {
            string name = TempData["username"].ToString();
            string nameRol = TempData["rol"].ToString();
            int codUser = Int32.Parse(TempData["codUser"].ToString());
            TempData["username"] = name;
            TempData["rol"] = nameRol;
            TempData["codUser"] = codUser;
            DAOUsuario data = DAOUsuario.getInstance();
            string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
            string accion = "Cerrar sesion";
            data.insertarAccion(codUser, 6, today, accion);
            return View("~/Views/Home/Index.cshtml");
        }

        [HttpPost]
        public ActionResult buscando(Usuario model)
        {

            //string name = model.username;
            //string pass = model.contrasena;
            string tipoUsuario = model.Rol;

            DAOUsuario data = DAOUsuario.getInstance();

            if (tipoUsuario == "Empleado")
            {
                int redireccion = data.buscandoUsuarioE(model.username, model.contrasena);
                if (redireccion == 1)
                {                   
                    data = DAOUsuario.getInstance();
                    Usuario usuario = data.buscarUsuarioRol(model.username, model.contrasena);
                    string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
                    string accion = "Iniciar sesion";
                    data.insertarAccion(usuario.cod, 5, today, accion);
                    TempData["codUser"] = usuario.cod;
                    TempData["username"] = model.username;
                    TempData["rol"] = usuario.Rol;
                    return View("~/Views/Admin/IndexAdmin.cshtml");
                    
                }
                else
                {
                    ViewBag.Message = "No existe el usuario, pruebe nuevamente";
                    return View("~/Views/Home/Index.cshtml");
                }

            }
            else
                if (tipoUsuario == "Cliente")
                {
                    int redireccion = data.buscandoUsuarioC(model.username, model.contrasena);
                    if(redireccion == 1)
                    {
                        data = DAOUsuario.getInstance();
                        Usuario usuario = data.buscarUsuarioRol(model.username, model.contrasena);
                        TempData["codUser"] = usuario.cod;
                        TempData["username"] = model.username;
                        TempData["rol"] = usuario.Rol;
                        ViewBag.name = model.username;
                        ViewBag.rol = usuario.Rol;
                        DAOEnvio data2 = DAOEnvio.getInstance();
                        List<Envio> envios = data2.obtenerEnvioUsuarioCliente(usuario.cod);
                        string today = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt");
                        string accion = "Iniciar sesion";
                        data.insertarAccion(usuario.cod, 5, today, accion);
                        TempData["message"] = "";
                        return View("~/Views/Cliente/CLIENTE.cshtml", envios);
                    }
                    else
                    {
                    ViewBag.name = null;
                    
                        ViewBag.Message = "No existe el usuario, pruebe nuevamente";
                        return View("~/Views/Home/Index.cshtml");
                    }
                }
                else
                {
                    ViewBag.Message = "Seleccionar el tipo de usuario";
                    return View("~/Views/Home/Index.cshtml");
                }
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Empleado()
        {
            return View();
        }

        public ActionResult Cliente()
        {
            return View();
        }
    }
}