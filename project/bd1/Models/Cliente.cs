using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Cliente
    {
        public int CI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime fechaNac { get; set; }
        public string EstadoCivil { get; set; }
        public string Trabajo { get; set; }
    }

    public class DAOCliente : DAO
    {

        private static DAOCliente c = null;

        public static DAOCliente getInstance()
        {
            if (DAOCliente.c != null)
            {
                return c;
            }
            else
            {
                c = new DAOCliente();
                return c;
            }
        }

        public int insertarCliente(int ci, string nombre, string apellido, string fechaNac, string estCivil, 
            string trabajo)
        {
            NpgsqlConnection conn = DAOCliente.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Cliente\" (\"CI\", \"Nombre\", \"Apellido\", \"FechaNac\" ,\"EstadoCivil\",\"Trabajo\") " +
                "VALUES (" + ci + ",'" + nombre + "','" + apellido + "',TO_DATE('" + fechaNac + "', 'YYYY-MM-DD'),'"
                + estCivil + "','" + trabajo + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
    }
}