﻿using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Rol
    {
        public int COD { get; set; }
        public string Nombre { get; set; } 
    }

    public class DAORol : DAO
    {

        private static DAORol r = null;

        public static DAORol getInstance()
        {
            if (DAORol.r != null)
            {
                return r;
            }
            else
            {
                r = new DAORol();
                return r;
            }
        }

        public List<Rol> obtenerRol()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Nombre\", \"COD\" FROM \"Rol\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Rol> data = new List<Rol>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Rol()
                {
                    Nombre = dr[0].ToString(),
                    COD = Int32.Parse(dr[1].ToString())
                });
            }
            dr.Close();
            conn.Close();

            System.Diagnostics.Debug.WriteLine("Los datos obtenidos fueron");
            foreach (Rol p in data)
            {
                System.Diagnostics.Debug.WriteLine("Cod: " + p.COD + "\t nombre: " + p.Nombre);
            }

            return data;

        }
       
        //INSERTAR
        public int insertarRol(string nombre)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Rol\" (\"COD\", \"Nombre\") " +
                "VALUES ((SELECT NEXTVAL('seq')),'" + nombre + "')";
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
        //ELIMINAR
        public int eliminarRol(int cod)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Rol\" WHERE \"COD\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        //MODIFICAR
        public int modificarRol(int cod, string nombre)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Rol\" SET \"Nombre\"='" + nombre + "'" +
                            "WHERE \"COD\"= " + cod + "";

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