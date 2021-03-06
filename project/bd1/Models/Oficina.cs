﻿using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Oficina
    {
        public int cod { get; set; }
        public string nombre { get; set; }
        public int capacidad { get; set; }
        public string correo { get; set; }
        public int almacenamiento { get; set; }
        public int codZona { get; set; }
        public string nombreZona { get; set; }
        //Para reportes
        public int cantEnvios { get; set; }
        public string descripcion { get; set; }
        public double pesoProm { get; set; }
        public string mesMantenimiento { get; set; }
        public int gastoMantenimiento { get; set; }
        public int monto { get; set; }
    }

    public class OficinaDAO : DAO
    {
        private static OficinaDAO c = null;

        public static OficinaDAO getInstance()
        {
            if (OficinaDAO.c != null)
            {
                return c;
            }
            else
            {
                c = new OficinaDAO();
                return c;
            }
        }
        //MOSTRAR
        public List<Oficina> obtenerOficinas()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"COD\", \"Nombre\", \"Capacidad\", \"Correo\", \"Almacenamiento\"  " +
                "FROM \"Sucursal\"" +
                "Order by \"COD\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    capacidad = Int32.Parse(dr[2].ToString()),
                    correo = dr[3].ToString(),
                    almacenamiento = Int32.Parse(dr[4].ToString()),

                });
            }
            dr.Close();
            conn.Close();

            System.Diagnostics.Debug.WriteLine("Los datos obtenidos fueron");
            foreach (Oficina p in data)
            {
                System.Diagnostics.Debug.WriteLine("Codigo: " + p.cod + "\t nombre: " + p.nombre +
                    "\t Capacidad: " + p.capacidad + "\t correo: " + p.correo + "\t Almacenamiento: " + p.almacenamiento);
            }

            return data;

        }
        //INSERTAR
        public int insertarOficina(string nombre, int capacidad, string correo, int almacenamiento, int lugar)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Sucursal\" (\"COD\", \"Nombre\", \"Capacidad\", \"Correo\" ,\"Almacenamiento\", \"FK-LugarS\") " +
                "VALUES ((SELECT NEXTVAL('seq')),'" + nombre + "','" + capacidad + "','" + correo + "','" + almacenamiento + "', " +
                "'" + lugar + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.ToString());
                conn.Close();
                return 0;
            }
        }
        //BUSCAR A UNO POR EL COD
        public Oficina buscarOficina(int cod)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"COD\", \"Nombre\", \"Capacidad\", \"Correo\", \"Almacenamiento\"  FROM \"Sucursal\"" +
                "WHERE \"COD\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Oficina data = new Oficina();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.cod = Int32.Parse(dr[0].ToString());
                data.nombre = dr[1].ToString();
                data.capacidad = Int32.Parse(dr[2].ToString());
                data.correo = dr[3].ToString();
                data.almacenamiento = Int32.Parse(dr[4].ToString());

            }
            dr.Close();
            conn.Close();

            System.Diagnostics.Debug.WriteLine("Los datos obtenidos fueron");
            System.Diagnostics.Debug.WriteLine("Codigo: " + data.cod + "\t nombre: " + data.nombre +
                    "\t Capacidad: " + data.capacidad + "\t correo: " + data.correo + "\t Almacenamiento: " + data.almacenamiento);


            return data;

        }
        //BUSCAR A UNO POR EL NOMBRE
        public Oficina buscarOficinaNombre(string name)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"COD\", \"Nombre\", \"Capacidad\", \"Correo\", \"Almacenamiento\"  FROM \"Sucursal\"" +
                "WHERE \"Nombre\" = '" + name + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Oficina data = new Oficina();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.cod = Int32.Parse(dr[0].ToString());
                data.nombre = dr[1].ToString();
                data.capacidad = Int32.Parse(dr[2].ToString());
                data.correo = dr[3].ToString();
                data.almacenamiento = Int32.Parse(dr[4].ToString());

            }
            dr.Close();
            conn.Close();

            System.Diagnostics.Debug.WriteLine("Los datos obtenidos fueron");
            System.Diagnostics.Debug.WriteLine("Codigo: " + data.cod + "\t nombre: " + data.nombre +
                    "\t Capacidad: " + data.capacidad + "\t correo: " + data.correo + "\t Almacenamiento: " + data.almacenamiento);


            return data;

        }
        //ELIMINAR
        public int eliminarOficina(int cod)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Sucursal\" WHERE \"COD\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        //MODIFICAR
        public int modificarOficina(int cod,string nombre, int capacidad, string correo, int almacenamiento, int lugar)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Sucursal\" SET \"Nombre\"= '" + nombre + "', \"Capacidad\"= " + capacidad + ", " +
                            "\"Correo\"= '" + correo + "' , \"Almacenamiento\"= " + almacenamiento + ", " +
                            " \"FK-LugarS\"= " + lugar + "" +
                            "WHERE \"COD\"= " + cod + "";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch(Exception e)
            {
                conn.Close();
                return 0;
            }
        }
        //Registro de Asistencias
        public List<Oficina> obtenerZona()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT z.\"COD\",z.\"Nombre\" FROM \"Zona\" z ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    codZona = Int32.Parse(dr[0].ToString()),
                    nombreZona = dr[1].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 1 REQUERIMIENTOS
        public List<Oficina> obtenerReporte1R()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select s.\"COD\", s.\"Nombre\", cant_envios  " +
                            "From \"Sucursal\" s, (Select Count(em.\"FK-SucursalEmp\") as cant_envios, em.\"FK-SucursalEmp\" " +
                            "from \"Empleado\" em, \"Envio\" e " +
                            "Where e.\"FK-EmpleadoE\"=em.\"CI\" " +
                            "Group by em.\"FK-SucursalEmp\" " +
                            "Order by Count(em.\"FK-SucursalEmp\") DESC " +
                            "limit 1) x " +
                         "Where s.\"COD\" = x.\"FK-SucursalEmp\" " +
                         "Union " +
                         "Select s2.\"COD\", s2.\"Nombre\", cant_recibidos " +
                         "From \"Sucursal\" s2, (Select Count(r.\"CODSucursal2\") as cant_recibidos, r.\"CODSucursal2\" " +
                             "from \"Ruta\" r, \"Veh-Rut\" vr, \"Traslado\" t, \"Envio\" e " +
                             "Where vr.\"CODRuta\"=r.\"COD\" and vr.\"COD\"=t.\"CODVeh-Rut\" and " +
                             "t.\"CODEnvio\"=e.\"COD\" " +
                             "Group by r.\"CODSucursal2\" " +
                             "Order by Count(r.\"CODSucursal2\") DESC " +
                             "limit 1) y " +
                         "Where s2.\"COD\" = y.\"CODSucursal2\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();
            int cont = 1;
            while (dr.Read())
            {
                if (cont == 1)
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.Add(new Oficina()
                    {
                        cod = Int32.Parse(dr[0].ToString()),
                        nombre = dr[1].ToString(),
                        cantEnvios = Int32.Parse(dr[2].ToString()),
                        descripcion = "Oficina que mas envia",
                    });
                    cont++;
                }else
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.Add(new Oficina()
                    {
                        cod = Int32.Parse(dr[0].ToString()),
                        nombre = dr[1].ToString(),
                        cantEnvios = Int32.Parse(dr[2].ToString()),
                        descripcion = "Oficina que mas recibe",
                    });
                }     
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 2 REQUERIMIENTOS
        public List<Oficina> obtenerReporte2R()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select s.\"COD\", s.\"Nombre\", SUM(\"MontoTotal\") as monto, Extract(MONTH FROM p.\"Fecha\") as mes, 'INGRESOS' as tipo " +
                "from \"Sucursal\" s, \"Pago\" p, \"Envio\" e, \"Empleado\" em " +
                "where p.\"FK-EnvioP\"=e.\"COD\" and e.\"FK-EmpleadoE\"=em.\"CI\" and s.\"COD\"=em.\"FK-SucursalEmp\" " +
                "group by Extract(MONTH FROM p.\"Fecha\"), s.\"COD\", s.\"Nombre\" " +
                "Union " +
                "Select s.\"COD\", s.\"Nombre\", SUM(se.\"Costo\"+m.\"Costo\"+em.\"SalarioAsig\") as monto, " +
                "Extract(MONTH FROM g.\"Fecha\")as mes, 'EGRESOS' as tipo " +
                "from \"Sucursal\" s, \"Gastos\" g, \"Servicio\" se, \"Mantenimiento\" m, \"Empleado\" em " +
                "where g.\"FK-SucursalG\"=s.\"COD\" and (g.\"FK-ServicioG\"=se.\"COD\" or g.\"FK-MantenimientoG\"=m.\"COD\") and em.\"FK-SucursalEmp\"=s.\"COD\" " +
                "group by Extract(MONTH FROM g.\"Fecha\"), s.\"COD\", s.\"Nombre\" " +
                "order by tipo, mes ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    monto = Int32.Parse(dr[2].ToString()),
                    mesMantenimiento = dr[3].ToString(),
                    descripcion = dr[4].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 3 REQUERIMIENTOS
        public List<Oficina> obtenerReporte3R()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select s.\"COD\", s.\"Nombre\", x.prom_paq " +
                "From \"Sucursal\" s, (Select AVG(p.\"Peso\") as prom_paq, em.\"FK-SucursalEmp\" " +
                                        "from \"Empleado\" em, \"Envio\" e, \"Paquete\" p " +
                                        "Where e.\"FK-EmpleadoE\"=em.\"CI\" and p.\"FK-EnvioP\"=e.\"COD\" " +
                                        "Group by em.\"FK-SucursalEmp\" " +
                                        "Order by prom_paq DESC) x " +
                "Where s.\"COD\" = x.\"FK-SucursalEmp\" " +
                "Order by x.prom_paq DESC";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    pesoProm = Convert.ToDouble(dr[2].ToString()),
                });             
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 12.1 REQUERIMIENTOS
        public List<Oficina> obtenerReporte12_1R()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select s.\"COD\", s.\"Nombre\", 'Puerto de '||l.\"Nombre\" " +
                "from \"Sucursal\" s, \"Puerto\" p, \"Lugar\" l " +
                "where p.\"FK-Sucursal\"=s.\"COD\" and p.\"FK-LugarP\"=l.\"COD\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    descripcion = dr[2].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 12.2 REQUERIMIENTOS
        public List<Oficina> obtenerReporte12_2R()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select s.\"COD\", s.\"Nombre\", 'Aeropuerto de '||l.\"Nombre\" " +
                "from \"Sucursal\" s, \"Aeropuerto\" p, \"Lugar\" l " +
                "where p.\"FK-SucursalA\"=s.\"COD\" and p.\"FK-LugarAe\"=l.\"COD\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    descripcion = dr[2].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 14 REQUERIMIENTOS
        public List<Oficina> obtenerReporte14R()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select SUM(m.\"Costo\") as costoT, Extract(MONTH FROM m.\"FechaIni\"), s.\"COD\", s.\"Nombre\" " +
                "from \"Mantenimiento\" m, \"Barco\" b, \"Puerto\" p, \"Sucursal\" s " +
                "where(m.\"PlacaB\"=b.\"Placa\") and  " +
                "((b.\"FK-PuertoB\"=p.\"COD\" and p.\"FK-Sucursal\"=s.\"COD\")) " +
                "Group by s.\"COD\", Extract(MONTH FROM m.\"FechaIni\") " +
                "Union " +
                "Select SUM(m2.\"Costo\")as costoT, Extract(MONTH FROM m2.\"FechaIni\"), s2.\"COD\", s2.\"Nombre\"  " +
                "from \"Mantenimiento\" m2, \"Avion\" av, \"Aeropuerto\" ae, \"Sucursal\" s2 " +
                "where(m2.\"PlacaA\"=av.\"Placa\") and  " +
                "((av.\"FK-Aeropuerto\"=ae.\"COD\" and ae.\"FK-SucursalA\"=s2.\"COD\")) " +
                "Group by s2.\"COD\", Extract(MONTH FROM m2.\"FechaIni\") " +
                "Union " +
                "Select SUM(m3.\"Costo\")as costoT, Extract(MONTH FROM m3.\"FechaIni\"), s3.\"COD\", s3.\"Nombre\" " +
                "from \"Mantenimiento\" m3, \"Terrestre\" t, \"Sucursal\" s3 " +
                "where(m3.\"PlacaT\"=t.\"Placa\") and  " +
                "(t.\"FK-SucursalT\"=s3.\"COD\") " +
                "Group by s3.\"COD\", Extract(MONTH FROM m3.\"FechaIni\") order by costoT Desc";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    gastoMantenimiento = Int32.Parse(dr[0].ToString()),
                    mesMantenimiento = dr[1].ToString(),
                    cod = Int32.Parse(dr[2].ToString()),
                    nombre = dr[3].ToString(),                                       
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 1 ENUNCIADO
        public List<Oficina> obtenerReporte1E()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select s.\"COD\", s.\"Nombre\", estado " +
                "From \"Sucursal\" s, \"Lugar\" l, (Select \"Nombre\" as estado, \"COD\" " +
                                                    "From \"Lugar\" " +
                                                    "Where \"Tipo\"='Estado' " +
                                                    "Order by estado) x " +
                "where s.\"FK-LugarS\"=l.\"COD\" and l.\"Fk-LugarL\"=x.\"COD\"  " +
                "Order by estado, s.\"Nombre\" ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    descripcion = dr[2].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 10 ENUNCIADO
        public List<Oficina> obtenerReporte10E(string fecha1, string fecha2)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select s.\"COD\", s.\"Nombre\", count(pa.\"FK-Sucursal\") " +
                "From \"Sucursal\" s, \"Paquete\" pa, \"Envio\" e " +
                "Where pa.\"FK-Sucursal\"=s.\"COD\" and pa.\"FK-EnvioP\"=e.\"COD\" and e.\"FechaInicio\" between '"+ fecha1 + "' and '" + fecha2 + "' " +
                "group by s.\"COD\", s.\"Nombre\" " +
                "order by count(pa.\"FK-Sucursal\") DESC " +
                "limit 1 ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    cantEnvios = Int32.Parse(dr[2].ToString()),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 14 ENUNCIADO
        public List<Oficina> obtenerReporte14E()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select s.\"COD\", s.\"Nombre\", z.\"Nombre\", l2.\"Nombre\" " +
                "From \"Sucursal\" s, \"Zona\" z, \"Lugar\" l, \"Lugar\" l2 " +
                "WHERE z.\"FK-SucursalZ\"=s.\"COD\" and s.\"FK-LugarS\"=l.\"COD\" and l.\"Fk-LugarL\"=l2.\"COD\" " +
                "Order by l2.\"Nombre\" ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    nombreZona = dr[2].ToString(),
                    descripcion = dr[3].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 20 ENUNCIADO
        public List<Oficina> obtenerReporte20E()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT s.\"COD\", s.\"Nombre\", AVG(cont) " +
                "FROM \"Sucursal\" s, (select COUNT(\"FechaInicio\") as cont, s2.\"COD\" " +
                "from \"Envio\" env, \"Sucursal\" s2, \"Empleado\" em2  " +
                "where s2.\"COD\"=em2.\"FK-SucursalEmp\" and env.\"FK-EmpleadoE\"=em2.\"CI\" " +
                "group by s2.\"COD\", env.\"FechaInicio\" " +
                "order by cont) x " +
                "WHERE s.\"COD\"= x.\"COD\" " +
                "GROUP BY s.\"COD\", s.\"Nombre\" " +
                "order by s.\"Nombre\" ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    pesoProm = Convert.ToDouble(dr[2].ToString()),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 21 ENUNCIADO
        public List<Oficina> obtenerReporte21E()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT s.\"COD\", s.\"Nombre\", l.\"Nombre\", l2.\"Nombre\" " +
                "FROM \"Sucursal\" s, \"Lugar\" l, \"Lugar\" l2 " +
                "WHERE s.\"FK-LugarS\"=l.\"COD\" and l.\"Fk-LugarL\"=l2.\"COD\" ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    nombreZona = dr[2].ToString(),
                    descripcion = dr[3].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 22 ENUNCIADO
        public List<Oficina> obtenerReporte22E()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT s.\"COD\", s.\"Nombre\", l2.\"Nombre\", Max(s.\"Capacidad\") as maxCap " +
                "FROM \"Sucursal\" s, \"Lugar\" l, \"Lugar\" l2 " +
                "WHERE s.\"FK-LugarS\"=l.\"COD\" and l.\"Fk-LugarL\"=l2.\"COD\" " +
                "group by l2.\"Nombre\", s.\"COD\", s.\"Nombre\" " +
                "order by maxCap DESC ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    nombreZona = dr[2].ToString(),
                    capacidad = Int32.Parse(dr[3].ToString()),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 28 REQUERIMIENTOS
        public List<Oficina> obtenerReporte28E(string fecha1, string fecha2)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select s.\"COD\", s.\"Nombre\", SUM(\"MontoTotal\") as monto, 'INGRESOS' as tipo " +
                "from \"Sucursal\" s, \"Pago\" p, \"Envio\" e, \"Empleado\" em " +
                "where p.\"FK-EnvioP\"=e.\"COD\" and e.\"FK-EmpleadoE\"=em.\"CI\" and s.\"COD\"=em.\"FK-SucursalEmp\" and " +
                "p.\"Fecha\" between '"+ fecha1 + "' and '" + fecha2 + "' " +
                "group by s.\"COD\", s.\"Nombre\" " +
                "Union " +
                "Select s.\"COD\", s.\"Nombre\", SUM(se.\"Costo\"+m.\"Costo\"+em.\"SalarioAsig\") as monto, 'EGRESOS' as tipo " +
                "from \"Sucursal\" s, \"Gastos\" g, \"Servicio\" se, \"Mantenimiento\" m, \"Empleado\" em " +
                "where g.\"FK-SucursalG\"=s.\"COD\" and (g.\"FK-ServicioG\"=se.\"COD\" or g.\"FK-MantenimientoG\"=m.\"COD\") and " +
                "em.\"FK-SucursalEmp\"=s.\"COD\" and g.\"Fecha\" between '" + fecha1 + "' and '" + fecha2 + "' " +
                "group by s.\"COD\", s.\"Nombre\" " +
                "order by tipo ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    monto = Int32.Parse(dr[2].ToString()),
                    descripcion = dr[3].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 30 REQUERIMIENTOS
        public List<Oficina> obtenerReporte30E()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT s.\"COD\", s.\"Nombre\", ser.\"Nombre\" " +
                "FROM \"Sucursal\" s, \"Gastos\" g, \"Servicio\" ser " +
                "WHERE g.\"FK-SucursalG\"=s.\"COD\" and g.\"FK-ServicioG\"=ser.\"COD\" ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Oficina> data = new List<Oficina>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Oficina()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    nombre = dr[1].ToString(),
                    descripcion = dr[2].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
    }
}