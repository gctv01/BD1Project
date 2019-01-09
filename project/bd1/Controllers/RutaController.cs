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
            return View(Rutas);
        }
        public ActionResult AgregarRuta()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AgregarRuta(Ruta model, string SucursalOrigen, string SucursalDestino, string ruta)
        {
            int SO = Int32.Parse(SucursalOrigen);
            int fkR = Int32.Parse(ruta);   
            List<Ruta> Rutas;
            DAORuta data;
            if (fkR != 0)
            {
                data = DAORuta.getInstance();
                Ruta r = data.buscarRuta(fkR);
                if(r.codDestino == SO)
                {
                    data = DAORuta.getInstance();
                    data.insertarRutaCombinada(SucursalOrigen, SucursalDestino, model.costo, fkR);
                    Rutas = data.obtenerRuta();
                }
                else
                {
                    ViewBag.Error = "EL ORIGEN DE LA RUTA COMBINADA DEBE SER IGUAL AL DESTINO DEL LA RUTA ORIGINARIA";
                    return View("~/Views/Ruta/AgregarRuta.cshtml");
                }              
            }
            else
            {
                data = DAORuta.getInstance();
                data.insertarRuta(SucursalOrigen, SucursalDestino, model.costo);
                Rutas = data.obtenerRuta();
            }         
            return View("~/Views/Ruta/IndexRuta.cshtml", Rutas);
        }
        public PartialViewResult RutaDD()
        {
            DAORuta data = DAORuta.getInstance();
            List<Ruta> rutas = data.obtenerRuta();
            return PartialView("RutaDropDown", rutas);
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
            foreach (var item in Rutas)
            {
                OficinaDAO data2 = OficinaDAO.getInstance();
                Oficina ofic = data2.buscarOficina(Int32.Parse(item.origen));
                item.origen = ofic.nombre;
                data2 = OficinaDAO.getInstance();
                ofic = data2.buscarOficina(Int32.Parse(item.destino));
                item.destino = ofic.nombre;
            }
            return View("~/Views/Ruta/IndexRuta.cshtml", Rutas);
        }
        //Modificando Ruta
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
            data.modificarRuta(model.COD, SucursalOrigen, SucursalDestino, model.costo);
            List<Ruta> Rutas = data.obtenerRuta();
            foreach (var item in Rutas)
            {
                OficinaDAO data2 = OficinaDAO.getInstance();
                Oficina ofic = data2.buscarOficina(Int32.Parse(item.origen));
                item.origen = ofic.nombre;
                data2 = OficinaDAO.getInstance();
                ofic = data2.buscarOficina(Int32.Parse(item.destino));
                item.destino = ofic.nombre;
            }
            return View("~/Views/Ruta/IndexRuta.cshtml", Rutas);
        }

        public PartialViewResult Sucursal(string id)
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