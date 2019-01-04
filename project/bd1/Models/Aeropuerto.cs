using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Aeropuerto
    {
        public int cod { get; set; }
        public int cantTerminales { get; set; }
        public int cantPistas { get; set; }
        public int capacidad { get; set; }
        public string fkSucursal { get; set; }
        public int fkLugar { get; set; }
    }
    public class DAOAeropuerto : DAO
    {

        private static DAOAeropuerto c = null;

        public static DAOAeropuerto getInstance()
        {
            if (DAOAeropuerto.c != null)
            {
                return c;
            }
            else
            {
                c = new DAOAeropuerto();
                return c;
            }
        }

        public List<Aeropuerto> obtenerAeropuerto()
        {
            List<Aeropuerto> data = null;
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT a.\"COD\", a.\"CantTerminales\", a.\"CantPistas\", a.\"Capacidad\", su.\"Nombre\" " +
                            ", a.\"FK-LugarAe\" " +
                            "FROM \"Aeropuerto\" a, \"Sucursal\" su " +
                            "Where a.\"FK-SucursalA\"= su.\"COD\" " +
                            "Order by \"COD\"";
            try
            {
                NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = cmd.ExecuteReader();

                data = new List<Aeropuerto>();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.Add(new Aeropuerto()
                    {
                        cod = Int32.Parse(dr[0].ToString()),
                        cantTerminales = Int32.Parse(dr[1].ToString()),
                        cantPistas = Int32.Parse(dr[2].ToString()),
                        capacidad = Int32.Parse(dr[3].ToString()),
                        fkSucursal = dr[4].ToString(),
                        fkLugar = Int32.Parse(dr[5].ToString()),

                    });
                }
                dr.Close();
            }
            catch (Exception e) {
                conn.Close();
            }
            conn.Close();
            return data;

        }
    }
}