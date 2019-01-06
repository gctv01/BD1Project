﻿using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Paquete
    {
        public int cod { get; set; }
        public int peso { get; set; }
        public int volumen { get; set; }
        public int fkTipoPaquete { get; set; }
        public string ClasificacionTipoPaquete { get; set; }
        public int fkSucursal { get; set; }
        public string NombreSucursal { get; set; }
        public int fkEnvioP { get; set; }
        public int fkClienteEnvia { get; set; }
        public string NombreClienteEnvia { get; set; }
        public int fkClienteRecibe { get; set; }
        public string NombreClienteRecibe { get; set; }
    }
    public class DAOPaquete : DAO
    {

        private static DAOPaquete r = null;

        public static DAOPaquete getInstance()
        {
            if (DAOPaquete.r != null)
            {
                return r;
            }
            else
            {
                r = new DAOPaquete();
                return r;
            }
        }
        //VER LISTA DE PAQUETES
        public List<Paquete> obtenerPaquete()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT p.\"COD\", p.\"Peso\", p.\"Volumen\", tp.\"Clasificacion\", p.\"FK-EnvioP\", s.\"Nombre\", " +
                          "c1.\"Nombre\", c2.\"Nombre\" " +
                          "FROM \"Paquete\" p, \"TipoPaquete\" tp, \"Cliente\" c1, \"Cliente\" c2, \"Sucursal\" s " +
                          "WHERE p.\"FK - TipoPaquete\"= tp.\"COD\" and p.\"FK - Sucursal\"=s.\"COD\" and " +
                          "p.\"FK - Cliente1\"=c1.\"CI\" and p.\"FK - Cliente2\"=c2.\"CI\" " +
                          "Order by p.\"COD\" ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Paquete> data = new List<Paquete>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Paquete()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    peso = Int32.Parse(dr[1].ToString()),
                    volumen = Int32.Parse(dr[2].ToString()),
                    ClasificacionTipoPaquete = dr[3].ToString(),
                    fkEnvioP = Int32.Parse(dr[4].ToString()),
                    NombreSucursal = dr[5].ToString(),
                    NombreClienteEnvia = dr[6].ToString(),
                    NombreClienteRecibe = dr[7].ToString(),
                });
            }
            dr.Close();
            conn.Close();
            return data;
        }
        
        //BUSCAR A UNO
        public Paquete buscarPaquete(int cod)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT p.\"COD\", p.\"Peso\", p.\"Volumen\", tp.\"Clasificacion\", s.\"Nombre\", " +
                          "c1.\"Nombre\", c2.\"Nombre\" " +
                          "FROM \"Paquete\" p, \"TipoPaquete\" tp, \"Cliente\" c1, \"Cliente\" c2, \"Sucursal\" s " +
                          "WHERE p.\"FK-TipoPaquete\"= tp.\"COD\" and p.\"FK-Sucursal\"=s.\"COD\" and " +
                          "p.\"FK-Cliente1\"=c1.\"CI\" and p.\"FK-Cliente2\"=c2.\"CI\" and p.\"COD\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Paquete data = new Paquete();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.cod = Int32.Parse(dr[0].ToString());
                data.peso = Int32.Parse(dr[1].ToString());
                data.volumen = Int32.Parse(dr[2].ToString());
                data.ClasificacionTipoPaquete = dr[3].ToString();
                data.NombreSucursal = dr[4].ToString();
                data.NombreClienteEnvia = dr[5].ToString();
                data.NombreClienteRecibe = dr[6].ToString();
            }
            dr.Close();
            conn.Close();
            return data;
        }
        //ELIMINAR
        public int eliminarPaquete(int fkEnvio)
        {
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Paquete\" WHERE \"FK-EnvioP\" = " + fkEnvio + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
    }
}