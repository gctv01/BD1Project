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
        public ActionResult Register()
        {
            return View();
        }

        public ActionResult Homecliente()
        {
            return View();
        }
        public ActionResult Detalleenvio()
        {
            return View();
        }
        public ActionResult Homempleado()
        {
            return View();
        }
        public ActionResult Menuenvios()
        {
            return View();
        }
        public ActionResult Enviarpaquete()
        {
            return View();
        }
        public ActionResult Cambioestatuspaquete()
        {
            return View();
        }
        public ActionResult HomeAdmin()
        {
            return View();
        }
        public ActionResult DetallesOficina()
        {
            return View();
        }

        public ActionResult EditarOficina()
        {
            return View();
        }
        public ActionResult MenuAdmin()
        {
            return View();
        }
        public ActionResult GestionUsuario()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EnviarPaquete(ModeloPaquete model)
        {

            string name = model.Nombre;
            string type = model.Tipo;
            int weight= model.Peso;
            string destination = model.Destino;

            return View();
        }
        [HttpPost]
        public ActionResult Register(ModeloRegistro model)
        {

            string name = model.Usuario;
            int pass = model.Contrasena;
            int pass1 = model.ContrasenaConfirmar;
            string email = model.Correoelectronico;
            int phone = model.Telefono;
            string id = model.CedulaIdentidad;

            return View();
        }

        [HttpPost]
        public ActionResult Index(ModeloLogIn model)
        {

            string name = model.Usuario;
            int pass = model.Contrasena;

            return View();
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
    }
}