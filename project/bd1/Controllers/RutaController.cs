using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class RutaController : Controller
    {
        // GET: Ruta
        public ActionResult IndexRuta()
        {
            DAORuta data = DAORuta.getInstance();
            List<Ruta> Rutas = data.obtenerRuta();
            /*foreach (var item in Rutas)
            {   
                OficinaDAO data2 = OficinaDAO.getInstance();
                Oficina ofic = data2.buscarOficina(Int32.Parse(item.origen));
                item.origen = ofic.nombre;
                data2 = OficinaDAO.getInstance();
                ofic = data2.buscarOficina(Int32.Parse(item.destino));
                item.destino = ofic.nombre;
            }*/
            return View(Rutas);
        }
        public ActionResult AgregarRuta()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AgregarRuta(Ruta model, string SucursalOrigen, string SucursalDestino)
        {
            DAORuta data = DAORuta.getInstance();
            data.insertarRuta(SucursalOrigen, SucursalDestino, model.duracion);
            List<Ruta> Rutas = data.obtenerRuta();
            /*foreach (var item in Rutas)
            {
                OficinaDAO data2 = OficinaDAO.getInstance();
                Oficina ofic = data2.buscarOficina(Int32.Parse(item.origen));
                item.origen = ofic.nombre;
                data2 = OficinaDAO.getInstance();
                ofic = data2.buscarOficina(Int32.Parse(item.destino));
                item.destino = ofic.nombre;
            }*/
            return View("~/Views/Ruta/IndexRuta.cshtml", Rutas);
        }
        //Eliminar Ruta
        public ActionResult EliminarRuta()
        {

            return View();
        }
        [HttpPost]
        public ActionResult EliminarRuta(Ruta model)
        {
            //int cod = Int32.Parse(model.cod);
            DAORuta data = DAORuta.getInstance();
            data.eliminarRuta(model.COD);
            List<Ruta> Rutas = data.obtenerRuta();
            /*foreach (var item in Rutas)
            {
                OficinaDAO data2 = OficinaDAO.getInstance();
                Oficina ofic = data2.buscarOficina(Int32.Parse(item.origen));
                item.origen = ofic.nombre;
                data2 = OficinaDAO.getInstance();
                ofic = data2.buscarOficina(Int32.Parse(item.destino));
                item.destino = ofic.nombre;
            }*/
            return View("~/Views/Ruta/IndexRuta.cshtml", Rutas);
        }
        //Modificando Rol
        public ActionResult ModificarRuta(string id)
        {
            int cod2 = Int32.Parse(id);
            DAORuta data = DAORuta.getInstance();
            Ruta RutaEncontrada = data.buscarRuta(cod2);
            return View(RutaEncontrada);
        }
        [HttpPost]
        public ActionResult ModificarRuta(Ruta model, string SucursalOrigen, string SucursalDestino)
        {
            DAORuta data = DAORuta.getInstance();
            data.modificarRuta(model.COD, SucursalOrigen, SucursalDestino, model.duracion);
            List<Ruta> Rutas = data.obtenerRuta();
            /*foreach (var item in Rutas)
            {
                OficinaDAO data2 = OficinaDAO.getInstance();
                Oficina ofic = data2.buscarOficina(Int32.Parse(item.origen));
                item.origen = ofic.nombre;
                data2 = OficinaDAO.getInstance();
                ofic = data2.buscarOficina(Int32.Parse(item.destino));
                item.destino = ofic.nombre;
            }*/
            return View("~/Views/Ruta/IndexRuta.cshtml", Rutas);
        }

        public PartialViewResult Sucursal()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> Sucursales = data.obtenerOficinas();
            return PartialView("SucursalDropDown", Sucursales);
        }
        public PartialViewResult MenuSuperior()
        {
            return PartialView("MenuSuperiorAdm");
        }
        public PartialViewResult TBOficina()
        {
            return PartialView("TextBoxOFICINA");
        }
    }
}