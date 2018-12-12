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
        public ActionResult IndexOficina()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> oficinas = data.obtenerOficinas();

            return View(oficinas);
        }
        public ActionResult AgregarOficina()
        {
            return View();
        }

        public PartialViewResult MenuSuperior()
        {
            return PartialView("MenuSuperiorAdm");
        }
        public PartialViewResult TBOficina()
        {
            return PartialView("TextBoxOFICINA");
        }
        [HttpPost]
        public ActionResult AgregarOficina(Oficina model)
        {

            OficinaDAO data = OficinaDAO.getInstance();
            data.insertarOficina(model.nombre, model.capacidad, model.correo, model.almacenamiento);

            return View("~/Views/Oficinas/IndexOficina.cshtml");
        }
    }
}