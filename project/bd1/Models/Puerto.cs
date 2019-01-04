using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Puerto
    {
        public int cod { get; set; }
        public int Puestos { get; set; }
        public int Calado { get; set; }
        public int TotalMuelles { get; set; }
        public string Uso { get; set; }
        public int Longitud { get; set; }
        public int Ancho { get; set; }
        public int fkLugar { get; set; }
        public string fkSucursal { get; set; }

    }
    public class DAOPuerto : DAO
    {

        private static DAOPuerto c = null;

        public static DAOPuerto getInstance()
        {
            if (DAOPuerto.c != null)
            {
                return c;
            }
            else
            {
                c = new DAOPuerto();
                return c;
            }
        }

        public List<Puerto> obtenerPuertos()
        {
            List<Puerto> data = null;
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT p.\"COD\", p.\"Puestos\", p.\"Calado\", p.\"TotalMuelles\", p.\"Uso\", p.\"Longitud\", p.\"Ancho\", " +
                            "p.\"FK-LugarP\", s.\"Nombre\" " +
                            "FROM \"Puerto\" p, \"Sucursal\" s " +
                            "Where p.\"FK-Sucursal\" = s.\"COD\" " +
                            "Order by \"COD\"";
            try
            {
                NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = cmd.ExecuteReader();

                data = new List<Puerto>();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.Add(new Puerto()
                    {
                        cod = Int32.Parse(dr[0].ToString()),
                        Puestos = Int32.Parse(dr[1].ToString()),
                        Calado = Int32.Parse(dr[2].ToString()),
                        TotalMuelles = Int32.Parse(dr[3].ToString()),
                        Uso = dr[4].ToString(),
                        Longitud = Int32.Parse(dr[5].ToString()),
                        Ancho = Int32.Parse(dr[6].ToString()),
                        fkLugar = Int32.Parse(dr[7].ToString()),
                        fkSucursal = dr[8].ToString()
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