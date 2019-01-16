using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class OficinasController : Controller
    {
        // GET: Oficinas
        public ActionResult IndexOficina(string viewba)
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
            string accion = "Oficinas Index";
            dataU.insertarAccion(codUser, 2, today, accion);

            ViewBag.name = viewba;
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerOficinas();

            return View(oficinas);
        }
        [HttpGet]
        public ActionResult BuscarOficina(string viewba, string viewba2)
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
            string accion = "Buscando Oficina";
            dataU.insertarAccion(codUser, 2, today, accion);

            ViewBag.name = viewba;
            return View();
        }

        [HttpPost]
        public ActionResult BuscarOficina(string oficina)
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
            string accion = "Buscando Oficina " + oficina;
            dataU.insertarAccion(codUser, 2, today, accion);

            if (oficina != "")
            {
                int cod = Int32.Parse(oficina);
                OficinaDAO data = OficinaDAO.getInstance();
                Oficina oficinaEncontrada = data.buscarOficina(cod);
                List<Oficina> oficinas = new List<Oficina>();
                oficinas.Add(oficinaEncontrada);

                return View("~/Views/Oficinas/IndexOficina.cshtml", oficinas);
            }
            else
            {
                OficinaDAO data = OficinaDAO.getInstance();
                List<Oficina> oficinas = data.obtenerOficinas();

                return View("~/Views/Oficinas/IndexOficina.cshtml", oficinas);
            }
        }
        //Agregar Oficina
        public ActionResult AgregarOficina(string viewba)
        {
            ViewBag.name = viewba;
            return View();
        }
        [HttpPost]
        public ActionResult AgregarOficina(Oficina model, string lugar, string viewba)
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
            string accion = "Creando Oficina " + model.nombre;
            dataU.insertarAccion(codUser, 1, today, accion);

            ViewBag.name = viewba;
            int codlugar = Int32.Parse(lugar);
            OficinaDAO data = OficinaDAO.getInstance();
            data.insertarOficina(model.nombre, model.capacidad, model.correo, model.almacenamiento, codlugar);
            List<Oficina> oficinas = data.obtenerOficinas();

            return View("~/Views/Oficinas/IndexOficina.cshtml", oficinas);
        }
        //Eliminar Oficina
        public ActionResult EliminarOficina(string viewba1)
        {
            ViewBag.name = viewba1;
            return View();
        }
        [HttpPost]
        public ActionResult EliminarOficina(Oficina model)
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
            string accion = "Eliminar Oficina " + model.cod;
            dataU.insertarAccion(codUser, 4, today, accion);

            //int cod = Int32.Parse(model.cod);
            OficinaDAO data = OficinaDAO.getInstance();
            data.eliminarOficina(model.cod);
            DAOTelefono data3 = DAOTelefono.getInstance();
            data3.eliminarTelefonoOfic(model.cod);
            List<Oficina> oficinas = data.obtenerOficinas();

            return View("~/Views/Oficinas/IndexOficina.cshtml", oficinas);
        }
        //Modificando Oficina
        public ActionResult ModificarOficina(string id)
        {
            int cod2 = Int32.Parse(id);
            OficinaDAO data = OficinaDAO.getInstance();
            Oficina oficinaEncontrada = data.buscarOficina(cod2);
            return View(oficinaEncontrada);
        }
        [HttpPost]
        public ActionResult ModificarOficinaPOST(Oficina model, string lugar)
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
            string accion = "Modificando Oficina " + model.cod;
            dataU.insertarAccion(codUser, 3, today, accion);

            int codlugar = Int32.Parse(lugar);
            OficinaDAO data = OficinaDAO.getInstance();
            data.modificarOficina(model.cod, model.nombre, model.capacidad, model.correo, model.almacenamiento, codlugar);
            List<Oficina> oficinas = data.obtenerOficinas();

            return View("~/Views/Oficinas/IndexOficina.cshtml", oficinas);
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
        public PartialViewResult TBOficina()
        {
            return PartialView("TextBoxOFICINA");
        }
        public PartialViewResult LugarDD()
        {
            DAOLugar data = DAOLugar.getInstance();
            List<Lugar> Lugares = data.obtenerLugar();
            return PartialView("LugarDropDown", Lugares);
        }
    }
}