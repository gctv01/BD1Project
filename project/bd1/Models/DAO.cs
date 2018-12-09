﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;

namespace bd1.Models
{
    public class DAO
    {
        public const string connString = "Server=localhost;Port=5434;" +
                    "User Id=postgres;Password=123;Database=Test;";

        private static NpgsqlConnection connS = null;

        public static NpgsqlConnection getInstanceDAO()
        {
            if (DAO.connS != null)
            {
                return connS;
            }
            else
            {
                connS = new NpgsqlConnection(connString);
                return connS;
            }
        }

        public List<Persona> obtenerPersonas()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT * FROM \"Persona\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Persona> data = new List<Persona>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Persona()
                {
                    nombre = dr[1].ToString(),
                    apellido = dr[2].ToString(),
                    ci = dr[0].ToString()
                });
            }
            dr.Close();
            conn.Close();

            System.Diagnostics.Debug.WriteLine("Los datos obtenidos fueron");
            foreach (Persona p in data)
            {
                System.Diagnostics.Debug.WriteLine("nombre: " + p.nombre + "\t apellido: " + p.apellido + "\t CI: " + p.ci);
            }

            return data;

            //AHORA UN INSERT

            /*NpgsqlConnection conn2 = Program.getInstanceDAO();
            conn2.Open();
            sql = "INSERT INTO \"Persona\" (\"Nombre\", \"CI\") VALUES ('Pep', 13579)";
            NpgsqlCommand cmd2 = new NpgsqlCommand(sql, conn2);
            cmd2.ExecuteNonQuery(); //ESTO SOLO EJECUTA EL COMANDO, NO HAY NADA QUE LEER
            conn.Close();*/

        }
    }
}