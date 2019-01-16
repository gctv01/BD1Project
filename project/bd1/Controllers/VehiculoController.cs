using bd1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bd1.Controllers
{
    public class VehiculoController : Controller
    {
        // GET: Vehiculo
        public ActionResult IndexVehiculo(string viewba)
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
            string accion = "Vehiculos Index";
            dataU.insertarAccion(codUser, 2, today, accion);

            ViewBag.name = viewba;
            DAOTerrestre data = DAOTerrestre.getInstance();
            List<Terrestre> terrestre = data.obtenerTerrestres();

            return View(terrestre);
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
        //Agregar Terrestre
        public ActionResult AgregarTerrestre()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AgregarTerrestre(Terrestre model, string modeloVeh, string sucursal)
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
            string accion = "Registro Vehiculo Terrestre " + model.placa;
            dataU.insertarAccion(codUser, 1, today, accion);

            int fkModelo = Int32.Parse(modeloVeh);
            int fkSucursal = Int32.Parse(sucursal);
            DAOTerrestre data = DAOTerrestre.getInstance();
            data.insertarTerrestres(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.tipo, fkSucursal, fkModelo);
            List<Terrestre> terrestres = data.obtenerTerrestres();

            return View("~/Views/Vehiculo/IndexVehiculo.cshtml", terrestres);
        }
        public PartialViewResult OficinaEmpDD()
        {
            OficinaDAO data = OficinaDAO.getInstance();
            List<Oficina> Oficinas = data.obtenerOficinas();
            return PartialView("SucursalEmpleado", Oficinas);
        }
        public PartialViewResult ModeloVehDD()
        {
            DAOModelo data = DAOModelo.getInstance();
            List<ModeloVehiculo> ModeloVehiculos = data.obtenerModeloVehiculo();
            return PartialView("ModeloVehiculoDropDown", ModeloVehiculos);
        }
        //Eliminar Terrestre
        public ActionResult EliminarTerrestre()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EliminarTerrestre(Terrestre model)
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
            string accion = "Elimino Vehiculo Terrestre " + model.placa;
            dataU.insertarAccion(codUser, 4, today, accion);

            //int cod = Int32.Parse(model.cod);
            DAOTerrestre data = DAOTerrestre.getInstance();
            data.eliminarTerrestre(model.placa);
            List<Terrestre> terrestres = data.obtenerTerrestres();

            return View("~/Views/Vehiculo/IndexVehiculo.cshtml", terrestres);
        }
        //Modificar Terrestre
        public ActionResult ModificarTerrestre(string id)
        {
            DAOTerrestre data = DAOTerrestre.getInstance();
            Terrestre terrestreEncontrado = data.buscarTerrestre(id);
            return View(terrestreEncontrado);
        }
        [HttpPost]
        public ActionResult ModificarTerrestre(Terrestre model)
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
            string accion = "Modifico Vehiculo Terrestre " + model.placa;
            dataU.insertarAccion(codUser, 3, today, accion);

            DAOTerrestre data = DAOTerrestre.getInstance();
            data.modificarTerrestre(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.tipo);
            List<Terrestre> terrestres = data.obtenerTerrestres();

            return View("~/Views/Vehiculo/IndexVehiculo.cshtml", terrestres);
        }

        //INDEX BARCO
        public ActionResult IndexBarco()
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
            string accion = "Barcos ";
            dataU.insertarAccion(codUser, 2, today, accion);

            DAOBarco data = DAOBarco.getInstance();
            List<Barco> Barcos = data.obtenerBarcos();
            if(Barcos!=null)
                return View("~/Views/Vehiculo/Barco.cshtml", Barcos);
            else
                return View("~/Views/Vehiculo/Barco.cshtml");
        }
        //Agregar Barco
        public ActionResult AgregarBarco()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AgregarBarco(Barco model, string modeloVeh, string puerto)
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
            string accion = "Registro Barco " + model.placa;
            dataU.insertarAccion(codUser, 1, today, accion);

            int fkM = Int32.Parse(modeloVeh);
            int fkP= Int32.Parse(puerto);
            DAOBarco data = DAOBarco.getInstance();
            data.insertarBarco(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.nombre, fkM, fkP);
            List<Barco> Barcos = data.obtenerBarcos();

            return View("~/Views/Vehiculo/Barco.cshtml", Barcos);
        }
        public PartialViewResult PuertoDD()
        {
            DAOPuerto data = DAOPuerto.getInstance();
            List<Puerto> puertos = data.obtenerPuertos();
            return PartialView("PuertoDropDown", puertos);
        }
        //Eliminar Barco
        public ActionResult EliminarBarco()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EliminarBarco(Barco model)
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
            string accion = "Elimino Barco " + model.placa;
            dataU.insertarAccion(codUser, 4, today, accion);

            //int cod = Int32.Parse(model.cod);
            DAOBarco data = DAOBarco.getInstance();
            data.eliminarBarco(model.placa);
            List<Barco> Barcos = data.obtenerBarcos();

            return View("~/Views/Vehiculo/Barco.cshtml", Barcos);
        }
        //Modificar Barco
        public ActionResult ModificarBarco(string id)
        {
            DAOBarco data = DAOBarco.getInstance();
            Barco BarcoEncontrado = data.buscarBarco(id);
            return View(BarcoEncontrado);
        }
        [HttpPost]
        public ActionResult ModificarBarco(Barco model, string modeloVeh, string puerto)
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
            string accion = "Modifico Barco " + model.placa;
            dataU.insertarAccion(codUser, 3, today, accion);

            int fkM = Int32.Parse(modeloVeh);
            int fkP = Int32.Parse(puerto);
            DAOBarco data = DAOBarco.getInstance();
            data.modificarBarco(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.nombre, fkM, fkP);
            List<Barco> Barcos = data.obtenerBarcos();

            return View("~/Views/Vehiculo/Barco.cshtml", Barcos);
        }
        //INDEX AVION
        public ActionResult IndexAvion()
        {
            DAOAvion data = DAOAvion.getInstance();
            List<Avion> Aviones = data.obtenerAviones();
            if (Aviones != null)
                return View("~/Views/Vehiculo/Avion.cshtml", Aviones);
            else
                return View("~/Views/Vehiculo/Avion.cshtml");
        }
        //Agregar Avion
        public ActionResult AgregarAvion()
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
            string accion = "Avion ";
            dataU.insertarAccion(codUser, 2, today, accion);

            return View();
        }
        [HttpPost]
        public ActionResult AgregarAvion(Avion model, string modeloVeh, string AeroP)
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
            string accion = "Registro Avion " + model.placa;
            dataU.insertarAccion(codUser, 1, today, accion);

            int fkM = Int32.Parse(modeloVeh);
            int fkA = Int32.Parse(AeroP);
            DAOAvion data = DAOAvion.getInstance();
            data.insertarAvion(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.longitud,
                model.pesoVacio, model.envergadura, model.pesoMax, model.altura, model.anchoCabina,
                model.capacidadCombustible, model.carreraDespegue, model.diametroFuselaje, fkM, fkA);
            List<Avion> Aviones = data.obtenerAviones();

            return View("~/Views/Vehiculo/Avion.cshtml", Aviones);
        }
        public PartialViewResult AeropuertoDD()
        {
            DAOAeropuerto data = DAOAeropuerto.getInstance();
            List<Aeropuerto> aeropuertos = data.obtenerAeropuerto();
            return PartialView("AeropuertoDropDown", aeropuertos);
        }
        //Eliminar Avion
        public ActionResult EliminarAvion()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EliminarAvion(Avion model)
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
            string accion = "Elimino Avion " + model.placa;
            dataU.insertarAccion(codUser, 4, today, accion);

            //int cod = Int32.Parse(model.cod);
            DAOAvion data = DAOAvion.getInstance();
            data.eliminarAvion(model.placa);
            List<Avion> Aviones = data.obtenerAviones();

            return View("~/Views/Vehiculo/Avion.cshtml", Aviones);
        }
        //Modificar Avion
        public ActionResult ModificarAvion(string id)
        {
            DAOAvion data = DAOAvion.getInstance();
            Avion AvionEncontrado = data.buscarAvion(id);
            return View(AvionEncontrado);
        }
        [HttpPost]
        public ActionResult ModificarAvion(Avion model, string modeloVeh, string AeroP)
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
            string accion = "Modifico Avion " + model.placa;
            dataU.insertarAccion(codUser, 3, today, accion);

            int fkM = Int32.Parse(modeloVeh);
            int fkA = Int32.Parse(AeroP);
            DAOAvion data = DAOAvion.getInstance();
            data.modificarAvion(model.placa, model.serialMotor, model.capacidad, model.peso,
                model.descripcion, model.serialCarroceria, model.fechaCreacion, model.longitud,
                model.pesoVacio, model.envergadura, model.pesoMax, model.altura, model.anchoCabina,
                model.capacidadCombustible, model.carreraDespegue, model.diametroFuselaje, fkM, fkA);
            List<Avion> Aviones = data.obtenerAviones();

            return View("~/Views/Vehiculo/Avion.cshtml", Aviones);
        }
    }
}