using Npgsql;
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
        //BUSCAR A UNO
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

            String sql = "UPDATE \"Sucursal\" SET \"Nombre\"='" + nombre + "', \"Capacidad\"='" + capacidad + "', " +
                            "\"Correo\"='" + correo + "' ,\"Almacenamiento\"='" + almacenamiento + "' " +
                            "\"FK-LugarS\"='" + lugar + "'" +
                            "WHERE \"COD\"= " + cod + "";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch
            {
                conn.Close();
                return 0;
            }
        }
    }
}