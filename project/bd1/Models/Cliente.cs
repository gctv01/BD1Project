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
        public string fechaNac { get; set; }
        public string EstadoCivil { get; set; }
        public string Trabajo { get; set; }
        public int telefono { get; set; }
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
        //INSERTAR

        public int insertarCliente(int ci, string nombre, string apellido, string fechaNac, string estCivil, 
            string trabajo, int lugar)
        {
            NpgsqlConnection conn = DAOCliente.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Cliente\" (\"CI\", \"Nombre\", \"Apellido\", \"FechaNac\" ,\"EstadoCivil\",\"Trabajo\",\"FK-LugarC\") " +
                "VALUES (" + ci + ",'" + nombre + "','" + apellido + "',TO_DATE('" + fechaNac + "', 'YYYY-MM-DD'),'"
                + estCivil + "','" + trabajo + "','" + lugar + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch(Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.ToString());
                conn.Close();
                return 0;
            }
        }
        public List<Cliente> obtenerClientes()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"CI\", \"Nombre\", \"Apellido\" " +
                "FROM \"Cliente\"" +
                "Order by \"CI\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Cliente> data = new List<Cliente>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Cliente()
                {
                    CI = Int32.Parse(dr[0].ToString()),
                    Nombre = dr[1].ToString(),
                    Apellido = dr[2].ToString(),
                });
            }
            dr.Close();
            conn.Close();
            return data;

        }

        //BUSCAR A UNO
        public Cliente buscarCliente(int cod)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"CI\", \"Nombre\", \"Apellido\", \"FechaNac\" ,\"EstadoCivil\",\"Trabajo\"" +
                "FROM \"Cliente\"" +
                "WHERE \"CI\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Cliente data = new Cliente();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.CI = Int32.Parse(dr[0].ToString());
                data.Nombre = dr[1].ToString();
                data.Apellido = dr[2].ToString();
                data.fechaNac = dr[3].ToString();
                data.EstadoCivil = dr[4].ToString();
                data.Trabajo = dr[5].ToString();
            }
            dr.Close();
            conn.Close();
            return data;

        }
        //ELIMINAR
        public int eliminarCliente(int cod)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Cliente\" WHERE \"CI\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch(Exception e)
            {
                conn.Close();
                return 0;
            }
        }
        //MODIFICAR
        public int modificarCliente(int ci, string nombre, string apellido, string fechaNac, string estCivil,
            string trabajo, int lugar)
        {
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Cliente\" SET \"Nombre\"='" + nombre + "', \"Apellido\"='" + apellido + "', " +
                            "\"FechaNac\"= TO_DATE('" + fechaNac + "', 'YYYY-MM-DD') ,\"EstadoCivil\"='" + estCivil + "', " +
                            "\"Trabajo\"='" + trabajo + "', \"FK-LugarC\"='" + lugar + "'" +
                            "WHERE \"CI\"= " + ci + "";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.ToString());
                conn.Close();
                return 0;
            }
        }
    }
}