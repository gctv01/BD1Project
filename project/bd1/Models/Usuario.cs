﻿using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Usuario
    {
        public int cod { get; set; }
        public string username { get; set; }
        public string contrasena { get; set; }
        public string Rol { get; set; }
        public int codRol { get; set; }
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
        //INSERTAR USUARIO CLIENTE
        public int insertarUsuarioC(string username, string contrasena, string rol, int ci)
        {
            NpgsqlConnection conn = DAOUsuario.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Usuario\" (\"Nombre\", \"Contrasena\", \"FK-RolU\", \"FK-ClienteU\")"+
                "VALUES ('" + username + "', '" + contrasena + "', " + rol + ", " + ci + ")";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch (Exception e)
            {
                System.Diagnostics.TextWriterTraceListener writer = new System.Diagnostics.TextWriterTraceListener(System.Console.Out);
                System.Diagnostics.Debug.Listeners.Add(writer);
                System.Diagnostics.Debug.WriteLine(e.ToString());
                conn.Close();
                return 0;
            }
            
        }
        //INSERTAR USUARIO EMPLEADO
        public int insertarUsuarioE(string username, string contrasena, string rol, int ci)
        {
            NpgsqlConnection conn = DAOUsuario.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Usuario\" (\"COD\",\"Nombre\", \"Contrasena\", \"FK-RolU\", \"FK-EmpleadoU\") " +
                "VALUES ((SELECT NEXTVAL('seq')),'" + username + "', '" + contrasena + "', " + rol + ", " + ci + ")";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch(Exception e)
            {
                System.Diagnostics.TextWriterTraceListener writer = new System.Diagnostics.TextWriterTraceListener(System.Console.Out);
                System.Diagnostics.Debug.Listeners.Add(writer);
                System.Diagnostics.Debug.WriteLine(e.ToString());
                conn.Close();
                return 0;
            }
        }
        //Buscando USUARIO CLIENTE
        public int buscandoUsuarioC(string username, string contrasena)
        {
            NpgsqlConnection conn = DAOUsuario.getInstanceDAO();
            conn.Open();

            string sql = "SELECT \"Nombre\", \"Contrasena\", \"FK-ClienteU\" " +
                        "FROM \"Usuario\" WHERE \"Nombre\" = '" + username + "' AND " +
                        "\"FK-EmpleadoU\" is NULL";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            int compData = 0;
            try { 
                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    System.Diagnostics.TextWriterTraceListener writer = new System.Diagnostics.TextWriterTraceListener(System.Console.Out);
                    System.Diagnostics.Debug.Listeners.Add(writer);
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

        //Buscando USUARIO EMPLEADO
        public int buscandoUsuarioE(string username, string contrasena)
        {
            NpgsqlConnection conn = DAOUsuario.getInstanceDAO();
            conn.Open();

            string sql = "SELECT \"Nombre\", \"Contrasena\", \"FK-EmpleadoU\", \"FK-RolU\" " +
                        "FROM \"Usuario\" WHERE \"Nombre\" = '" + username + "' AND" +
                        "\"FK-ClienteU\" is NULL";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();           
            int compData = 0;
            try
            {
                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");

                    if (String.Equals(dr[1].ToString(), contrasena))
                    {
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
        
        //ELIMINAR USUARIO CLIENTE
        public int eliminarUsuarioC(int ci)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Usuario\" WHERE \"FK-ClienteU\" = " + ci + "";
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
        //ELIMINAR USUARIO EMPLEADO
        public int eliminarUsuarioE(int ci)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Usuario\" WHERE \"FK-EmpleadoU\" = " + ci + "";
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

        public List<Usuario> obtenerUsuario()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT u.\"COD\", u.\"Nombre\", u.\"FK-RolU\", r.\"Nombre\" " +
                            "FROM \"Usuario\" u, \"Rol\" r " +
                            "WHERE u.\"FK-RolU\" = r.\"COD\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Usuario> data = new List<Usuario>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Usuario()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    username = dr[1].ToString(),
                    codRol = Int32.Parse(dr[2].ToString()),
                    Rol = dr[3].ToString()
                });
            }
            dr.Close();
            conn.Close();

            return data;

        }
        //BUSCAR A UNO
        public Usuario buscarUsuario(int cod)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"COD\", \"Nombre\", \"Contrasena\" FROM \"Usuario\"" +
                "WHERE \"COD\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Usuario data = new Usuario();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.cod = Int32.Parse(dr[0].ToString());
                data.username = dr[1].ToString();
                data.contrasena = dr[2].ToString();
            }
            dr.Close();
            conn.Close();
            return data;
        }
        public Usuario buscarUsuarioRol(string username, string contrasena)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT  u.\"Nombre\", u.\"FK-RolU\", r.\"Nombre\" " +
                            "FROM \"Usuario\" u , \"Rol\" r " +
                            "WHERE u.\"FK-RolU\" = r.\"COD\" and u.\"Nombre\"= '"+ username + "' and u.\"Contrasena\"= '" + contrasena + "' ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Usuario data = new Usuario();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                //data.cod = Int32.Parse(dr[0].ToString());
                data.username = dr[0].ToString();
                data.codRol = Int32.Parse(dr[1].ToString());
                data.Rol = dr[2].ToString();
            }
            dr.Close();
            conn.Close();
            return data;
        }
        //MODIFICAR
        public int modificarUsuario(int cod, string nombre, string contrasena, string rol)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Usuario\" SET \"Nombre\"='" + nombre + "', \"Contrasena\"='" + contrasena + "', " +
                            "\"FK-RolU\"='" + rol + "'" +
                            "WHERE \"COD\"= " + cod + "";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch (Exception e)
            {
                conn.Close();
                return 0;
            }
        }
        //
        public int insertarAccion(int codU, int codAcc, string fecha, string accion)
        {
            NpgsqlConnection conn = DAOUsuario.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Accion-Usuario\" (\"codUsuario\", \"codAccion\", \"Fecha\", \"Descripcion\") " +
                "VALUES (" + codU + ", " + codAcc + ", TO_TIMESTAMP('" + fecha + "', 'DD-MM-YYYY HH24:MI:SS'), '"+ accion + "');";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch (Exception e)
            {
                System.Diagnostics.TextWriterTraceListener writer = new System.Diagnostics.TextWriterTraceListener(System.Console.Out);
                System.Diagnostics.Debug.Listeners.Add(writer);
                System.Diagnostics.Debug.WriteLine(e.ToString());
                conn.Close();
                return 0;
            }

        }
    }

}