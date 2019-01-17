using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Lugar
    {
        public int cod { get; set; }
        public string nombre { get; set; }
        public string nombre2 { get; set; }
        public string tipo { get; set; }
        public string taller { get; set; }
    }

    public class DAOLugar : DAO
    {

        private static DAOLugar c = null;

        public static DAOLugar getInstance()
        {
            if (DAOLugar.c != null)
            {
                return c;
            }
            else
            {
                c = new DAOLugar();
                return c;
            }
        }

        public List<Lugar> obtenerLugar()
        {
            List<Lugar> data = null;
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"COD\", \"Nombre\", \"Tipo\" " +
                            "FROM \"Lugar\" " +
                            "WHERE \"Tipo\" = 'Municipio' " +
                            "Order by \"COD\"";
            try
            {
                NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = cmd.ExecuteReader();

                data = new List<Lugar>();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.Add(new Lugar()
                    {
                        cod = Int32.Parse(dr[0].ToString()),
                        nombre = dr[1].ToString(),
                        tipo = dr[2].ToString(),                       
                    });
                }
                dr.Close();
            }
            catch (Exception e) { conn.Close(); }
            conn.Close();
            return data;

        }

        //BUSCAR A UNO
        //public Lugar buscarLugar(int cod)
        //{

        //    NpgsqlConnection conn = DAO.getInstanceDAO();
        //    conn.Open();
        //    string sql = "SELECT \"CI\", \"Nombre\", \"Apellido\", \"FechaNac\", " +
        //        " \"Correo\", \"NivelAca\", \"Profesion\", \"EstadoCivil\", \"CantHijos\", \"CorreoEmpresa\", " +
        //        " \"SalarioAsig\", \"FechaContratado\", \"FechaFinal\"" +
        //        "FROM \"Lugar\"" +
        //        "WHERE \"COD\" = " + cod + "";
        //    NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
        //    NpgsqlDataReader dr = cmd.ExecuteReader();

        //    Lugar data = new Lugar();

        //    while (dr.Read())
        //    {
        //        System.Diagnostics.Debug.WriteLine("connection established");
        //        data.CI = Int32.Parse(dr[0].ToString());
        //        data.Nombre = dr[1].ToString();
        //        data.Apellido = dr[2].ToString();
        //        data.fechaNac = dr[3].ToString();
        //        data.correo = dr[4].ToString();
        //        data.nivelAca = dr[5].ToString();
        //        data.profesion = dr[6].ToString();
        //        data.estCivil = dr[7].ToString();
        //        data.cantHijos = dr[8].ToString();
        //        data.correoEmp = dr[9].ToString();
        //        data.salarioAsig = Int32.Parse(dr[10].ToString());
        //        data.fechaContratado = dr[11].ToString();
        //        data.fechaFinal = dr[12].ToString();
        //    }
        //    dr.Close();
        //    conn.Close();
        //    return data;

        //}
        //ELIMINAR
        public int eliminarLugar(int cod)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Lugar\" WHERE \"CI\" = " + cod + "";
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
        //REPORTE 26 ENUNCIADO
        public List<Lugar> obtenerReporte26E()
        {
            List<Lugar> data = null;
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select t.\"Nombre\", l.\"Nombre\", l2.\"Nombre\" " +
                "FROM \"Taller\" t, \"Lugar\" l, \"Lugar\" l2 " +
                "WHERE t.\"FK-LugarT\"=l.\"COD\" and l.\"Fk-LugarL\"=l2.\"COD\"";
            try
            {
                NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = cmd.ExecuteReader();

                data = new List<Lugar>();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.Add(new Lugar()
                    {
                        taller = dr[0].ToString(),
                        nombre = dr[1].ToString(),
                        nombre2 = dr[2].ToString(),
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