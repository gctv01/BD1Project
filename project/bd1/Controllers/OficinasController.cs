﻿using bd1.Models;
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
        public ActionResult IndexOficina()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerOficinas();

            return View(oficinas);
        }
        [HttpPost]
        public ActionResult BuscarOficina(string oficina)
        {
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
        public ActionResult AgregarOficina()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AgregarOficina(Oficina model)
        {

            OficinaDAO data = OficinaDAO.getInstance();
            data.insertarOficina(model.nombre, model.capacidad, model.correo, model.almacenamiento);
            List<Oficina> oficinas = data.obtenerOficinas();

            return View("~/Views/Oficinas/IndexOficina.cshtml", oficinas);
        }
        //Eliminar Oficina
        public ActionResult EliminarOficina()
        {

            return View();
        }
        [HttpPost]
        public ActionResult EliminarOficina(Oficina model)
        {
            //int cod = Int32.Parse(model.cod);
            OficinaDAO data = OficinaDAO.getInstance();
            data.eliminarOficina(model.cod);
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
        public ActionResult ModificarOficinaPOST(Oficina model)
        {

            OficinaDAO data = OficinaDAO.getInstance();
            data.modificarOficina(model.cod, model.nombre, model.capacidad, model.correo, model.almacenamiento);
            List<Oficina> oficinas = data.obtenerOficinas();

            return View("~/Views/Oficinas/IndexOficina.cshtml", oficinas);
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