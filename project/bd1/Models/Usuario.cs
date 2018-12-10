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

            string sql = "SELECT * FROM \"Perfil\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            int Cantdata = 0;

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                Cantdata++;
            }
            dr.Close();

            Cantdata++;

            sql = "INSERT INTO \"Perfil\" (\"COD\" ,\"Username\", \"Contrasena\") VALUES ("+ Cantdata +",'" + username + "', '" + contrasena + "')";
            cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //ESTO SOLO EJECUTA EL COMANDO, NO HAY NADA QUE LEER
            conn.Close();

            return resp;
        }
    }

}