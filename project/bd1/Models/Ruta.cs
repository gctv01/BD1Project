using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Ruta
    {
        public int COD { get; set; }
        public string origen { get; set; }
        public string destino { get; set; }
        public int duracion { get; set; }
    }
    public class DAORuta : DAO
    {

        private static DAORuta r = null;

        public static DAORuta getInstance()
        {
            if (DAORuta.r != null)
            {
                return r;
            }
            else
            {
                r = new DAORuta();
                return r;
            }
        }

        public List<Ruta> obtenerRuta()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"COD\", \"FK-Sucursal1\", \"FK-Sucursal2\", \"Duracion\" FROM \"Ruta\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Ruta> data = new List<Ruta>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Ruta()
                {
                    COD = Int32.Parse(dr[0].ToString()),
                    origen = dr[1].ToString(),
                    destino = dr[2].ToString(),
                    duracion = Int32.Parse(dr[3].ToString()),
                });
            }
            dr.Close();
            conn.Close();
            return data;

        }

        //INSERTAR
        public int insertarRuta(string origen, string destino, int duracion)
        {
            NpgsqlConnection conn = DAORuta.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Ruta\" (\"COD\", \"FK-Sucursal1\", \"FK-Sucursal2\", \"Duracion\") " +
                "VALUES ((SELECT NEXTVAL('seq')),'" + origen + "', '" + destino + "', '" + duracion + "')";
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
        //BUSCAR A UNO
        public Ruta buscarRuta(int cod)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"COD\", \"FK-Sucursal1\", \"FK-Sucursal2\", \"Duracion\" FROM \"Ruta\"" +
                "WHERE \"COD\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Ruta data = new Ruta();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.COD = Int32.Parse(dr[0].ToString());
                data.origen = dr[1].ToString();
                data.destino = dr[2].ToString();
                data.duracion = Int32.Parse(dr[3].ToString());
            }
            dr.Close();
            conn.Close();
            return data;
        }
        //ELIMINAR
        public int eliminarRuta(int cod)
        {
            NpgsqlConnection conn = DAORuta.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Ruta\" WHERE \"COD\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        //MODIFICAR
        public int modificarRuta(int cod, string origen, string destino, int duracion)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Ruta\" SET \"FK-Sucursal1\"='" + origen + "', \"FK-Sucursal2\"='" + destino + "'," +
                            "\"Duracion\"='" + duracion + "' " +
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