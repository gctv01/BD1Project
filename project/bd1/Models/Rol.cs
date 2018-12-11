using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Rol
    {
        public int COD { get; set; }
        public string Nombre { get; set; } 
    }

    public class DAORol : DAO
    {

        private static DAORol r = null;

        public static DAORol getInstance()
        {
            if (DAORol.r != null)
            {
                return r;
            }
            else
            {
                r = new DAORol();
                return r;
            }
        }

        public List<Rol> obtenerRol()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Nombre\", \"COD\" FROM \"Rol\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Rol> data = new List<Rol>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Rol()
                {
                    COD = Int32.Parse(dr[1].ToString()),
                    Nombre = dr[0].ToString()
                });
            }
            dr.Close();
            conn.Close();

            System.Diagnostics.Debug.WriteLine("Los datos obtenidos fueron");
            foreach (Rol p in data)
            {
                System.Diagnostics.Debug.WriteLine("Cod: " + p.COD + "\t nombre: " + p.Nombre);
            }

            return data;

        }
    }
}