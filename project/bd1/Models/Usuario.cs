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

    public class DAOUsuario
    {
        public const string connString = "Server=localhost;Port=5434;" +
                    "User Id=postgres;Password=123;Database=LogUCAB;";

        private static NpgsqlConnection connS = null;

        public static NpgsqlConnection getInstanceDAO()
        {
            if (DAOUsuario.connS != null)
            {
                return connS;
            }
            else
            {
                connS = new NpgsqlConnection(connString);
                return connS;
            }
        }
        public int insertar(string username, string contrasena)
        {
            NpgsqlConnection conn = DAOUsuario.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Usuario\" (\"COD\" ,\"Username\", \"Contrasena\") VALUES ((SELECT NEXTVAL('usuario_seq')),'" + username + "', '" + contrasena + "')";
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