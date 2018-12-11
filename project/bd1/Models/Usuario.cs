using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Usuario
    {
        public string username { get; set; }
        public string contrasena { get; set; }
        public string Rol { get; set; }
    }

    public class DAOUsuario : DAO
    {
        private static DAOUsuario u = null;

        public static DAOUsuario getInstance()
        {
            if (DAOUsuario.u != null)
            {
                return u;
            }
            else
            {
                u = new DAOUsuario();
                return u;
            }
        }

        public int insertarUsuario(string username, string contrasena, string rol)
        {
            NpgsqlConnection conn = DAOUsuario.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Usuario\" (\"COD\" ,\"Username\", \"Contrasena\", \"FK-Rol\") VALUES ((SELECT NEXTVAL('usuario_seq')),'" + username + "', '" + contrasena + "', " + rol + ")";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }

        public int buscandoUsuario(string username, string contrasena)
        {
            NpgsqlConnection conn = DAOUsuario.getInstanceDAO();
            conn.Open();

            string sql = "SELECT \"Username\", \"Contrasena\" FROM \"Usuario\" WHERE \"Username\" = '" + username + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            int compData = 0;
            try { 
                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
 
                    if (String.Equals(dr[1].ToString(), contrasena)){
                        compData = 1;
                    }
                }
            }
            catch (Exception e)
            {
                compData = 0;
                System.Diagnostics.Debug.WriteLine(e.ToString());
            }
            dr.Close();
       
            conn.Close();

            return compData;

        }
    }

}