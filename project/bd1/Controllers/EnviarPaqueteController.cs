using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class EnviarPaqueteController : Controller
    {
        // GET: EnviarPaquete
        public ActionResult IndexEnvio()
        {
            DAOEnvio data = DAOEnvio.getInstance();
            List<Envio> envios = data.obtenerEnvio();
            return View(envios);
        }
        public PartialViewResult MenuSuperior()
        {
            return PartialView("MenuSuperiorAdm");
        }
        public PartialViewResult TBEnvio()
        {
            return PartialView("TextBoxEnvio");
        }
        [HttpPost]
        public ActionResult BuscarEnvio(string envio)
        {
            if (envio != "")
            {
                int cod = Int32.Parse(envio);
                DAOEnvio data = DAOEnvio.getInstance();
                Envio envioEncontrado = data.buscarEnvio(cod);
                List<Envio> envios = new List<Envio>();
                envios.Add(envioEncontrado);

                return View("~/Views/EnviarPaquete/IndexEnvio.cshtml", envios);
            }
            else
            {
                DAOEnvio data = DAOEnvio.getInstance();
                List<Envio> envios = data.obtenerEnvio();

                return View("~/Views/EnviarPaquete/IndexEnvio.cshtml", envios);
            }
        }
        //CAMBIANDO ESTADO DEL ENVIO
        public ActionResult CambiarEstado(string id)
        {
            int cod = Int32.Parse(id);
            DAOEnvio data = DAOEnvio.getInstance();
            Envio estatus = data.buscarEnvio(cod);
            return View(estatus);
        }
        public PartialViewResult EstatusDD()
        {
            DAOEnvio data = DAOEnvio.getInstance();
            List<Envio> estatus = data.obtenerEstatus();
            return PartialView("EstatusDropDown", estatus);
        }
        [HttpPost]
        public ActionResult CambiarEstado(Envio model, string estatus)
        {
            int fkE = Int32.Parse(estatus);
            DAOEnvio data2 = DAOEnvio.getInstance();
            data2.cambiarEstado(model.cod, fkE);
            DAOEnvio data = DAOEnvio.getInstance();
            List<Envio> envios = data.obtenerEnvio();
            return View("~/Views/EnviarPaquete/IndexEnvio.cshtml", envios);
        }
        //Eliminar Envio
        public ActionResult EliminarEnvio()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EliminarEnvio(Envio model)
        {
            //int cod = Int32.Parse(model.cod);
            DAOPago data1 = DAOPago.getInstance();
            data1.eliminarPago(model.cod);
            DAOPaquete data2 = DAOPaquete.getInstance();
            data2.eliminarPaquete(model.cod);
            DAOEnvio data = DAOEnvio.getInstance();
            data.eliminarEnvio(model.cod);
            List<Envio> envios = data.obtenerEnvio();

            return View("~/Views/EnviarPaquete/IndexEnvio.cshtml", envios);
        }

    }
}