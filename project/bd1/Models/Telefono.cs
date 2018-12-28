using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Telefono
    {
        public int cod { get; set; }
        public int numero { get; set; }
        public int fkTaller { get; set; }
        public int fkEmpleado { get; set; }
        public int fkSucursal { get; set; }
        public int fkCliente { get; set; }
    }
    public class DAOTelefono : DAO
    {

        private static DAOTelefono r = null;

        public static DAOTelefono getInstance()
        {
            if (DAOTelefono.r != null)
            {
                return r;
            }
            else
            {
                r = new DAOTelefono();
                return r;
            }
        }

        public List<Telefono> obtenerTelefono()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Numero\", \"COD\" FROM \"Telefono\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Telefono> data = new List<Telefono>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Telefono()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    numero = Int32.Parse(dr[1].ToString())
                });
            }
            dr.Close();
            conn.Close();


            return data;

        }

        //INSERTAR Telefono de Sucursal
        public int insertarTelefonoOfic(int cod, int numero, int fkS)
        {
            NpgsqlConnection conn = DAOTelefono.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Telefono\" (\"COD\", \"Numero\", \"FK-SucursalT\") " +
                "VALUES ((SELECT NEXTVAL('seq'))," + numero + ", " + fkS + ")";
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
        //INSERTAR Telefono de Empleado
        public int insertarTelefonoEmp(int numero, int fkE)
        {
            NpgsqlConnection conn = DAOTelefono.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Telefono\" (\"COD\", \"Numero\", \"FK-Empleado\") " +
                "VALUES ((SELECT NEXTVAL('seq'))," + numero + ", " + fkE + ")";
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
        //INSERTAR Telefono de Cliente
        public int insertarTelefonoCli(int numero, int fkC)
        {
            NpgsqlConnection conn = DAOTelefono.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Telefono\" (\"COD\", \"Numero\", \"FK-Cliente\") " +
                "VALUES ((SELECT NEXTVAL('seq'))," + numero + ", " + fkC + ")";
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
        //INSERTAR Telefono de Taller
        public int insertarTelefonoTaller(int numero, int fkT)
        {
            NpgsqlConnection conn = DAOTelefono.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Telefono\" (\"COD\", \"Numero\", \"FK-TallerT\") " +
                "VALUES ((SELECT NEXTVAL('seq'))," + numero + ", " + fkT + ")";
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
        //BUSCAR A UNO
        public Rol buscarRol(int cod)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"COD\", \"Nombre\" FROM \"Rol\"" +
                "WHERE \"COD\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Rol data = new Rol();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.COD = Int32.Parse(dr[0].ToString());
                data.Nombre = dr[1].ToString();
            }
            dr.Close();
            conn.Close();
            return data;
        }
        //ELIMINAR Telefono de Sucursal
        public int eliminarTelefonoOfic(int cod)
        {
            NpgsqlConnection conn = DAOTelefono.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Telefono\" WHERE \"FK-SucursalT\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        //ELIMINAR Telefono de Empleado
        public int eliminarTelefonoEmp(int cod)
        {
            NpgsqlConnection conn = DAOTelefono.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Telefono\" WHERE \"FK-Empleado\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        //ELIMINAR Telefono de Cliente
        public int eliminarTelefonoCli(int cod)
        {
            NpgsqlConnection conn = DAOTelefono.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Telefono\" WHERE \"FK-Cliente\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        //ELIMINAR Telefono de Taller
        public int eliminarTelefonoTaller(int cod)
        {
            NpgsqlConnection conn = DAOTelefono.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Telefono\" WHERE \"FK-TallerT\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        //MODIFICAR Telefono de Sucursal
        public int modificarTelefonoOfic(int fk, int numero)
        {
            NpgsqlConnection conn = DAOTelefono.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Telefono\" SET \"Numero\"='" + numero + "'" +
                            "WHERE \"FK-SucursalT\"= " + fk + "";

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
        //MODIFICAR Telefono de Empleado
        public int modificarTelefonoEmp(int fk, int numero)
        {
            NpgsqlConnection conn = DAOTelefono.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Telefono\" SET \"Numero\"='" + numero + "'" +
                            "WHERE \"FK-Empleado\"= " + fk + "";

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
        //MODIFICAR Telefono de Cliente
        public int modificarTelefonoCli(int fk, int numero)
        {
            NpgsqlConnection conn = DAOTelefono.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Telefono\" SET \"Numero\"='" + numero + "'" +
                            "WHERE \"FK-Cliente\"= " + fk + "";

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
        //MODIFICAR Telefono de Taller
        public int modificarTelefonoTaller(int fk, int numero)
        {
            NpgsqlConnection conn = DAOTelefono.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Telefono\" SET \"Numero\"='" + numero + "'" +
                            "WHERE \"FK-TallerT\"= " + fk + "";

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
    }
}