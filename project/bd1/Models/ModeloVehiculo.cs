using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class ModeloVehiculo
    {
        public int cod { get; set; }
        public string nombre { get; set; }
        public string marca { get; set; }
    }

    public class DAOModelo : DAO
    {

        private static DAOModelo c = null;

        public static DAOModelo getInstance()
        {
            if (DAOModelo.c != null)
            {
                return c;
            }
            else
            {
                c = new DAOModelo();
                return c;
            }
        }

        public List<ModeloVehiculo> obtenerModeloVehiculo()
        {
            List<ModeloVehiculo> data = null;
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT mo.\"COD\", mo.\"Nombre\", ma.\"Nombre\" " +
                            "FROM \"Marca\" ma, \"Modelo\" mo " +
                            "WHERE \"FK-MarcaM\" = ma.\"COD\" " +
                            "Order by \"COD\"";
            try
            {
                NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = cmd.ExecuteReader();

                data = new List<ModeloVehiculo>();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.Add(new ModeloVehiculo()
                    {
                        cod = Int32.Parse(dr[0].ToString()),
                        nombre = dr[1].ToString(),
                        marca = dr[2].ToString(),
                    });
                }
                dr.Close();
            }
            catch (Exception e) { conn.Close(); }
            conn.Close();
            return data;

        }
    }
}