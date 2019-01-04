using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Envio
    {
        public int cod { get; set; }
        public string fechaInicio { get; set; }
        public string fechaLlegada { get; set; }
        public int monto { get; set; }
        public string NombreEmpleadoE { get; set; }
        public int fkEmpleadoE { get; set; }
        public string NombreEstatusE { get; set; }
        public int fkEstatusE { get; set; }
    }
    public class DAOEnvio : DAO
    {

        private static DAOEnvio r = null;

        public static DAOEnvio getInstance()
        {
            if (DAOEnvio.r != null)
            {
                return r;
            }
            else
            {
                r = new DAOEnvio();
                return r;
            }
        }
        //VER LISTA DE Envios
        public List<Envio> obtenerEnvio()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT e.\"COD\", to_char(e.\"FechaInicio\", 'DD-MM-YYYY'), to_char(e.\"FechaLlegada\", 'DD-MM-YYYY'), " +
                          "e.\"Monto\", em.\"Nombre\", es.\"Nombre\" " +
                          "FROM \"Envio\" e, \"Empleado\" em, \"Estatus\" es " +
                          "WHERE em.\"CI\" = e.\"FK-EmpleadoE\" and es.\"COD\" = e.\"FK-EstatusE\" " +
                          "Order by \"FechaInicio\" ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Envio> data = new List<Envio>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Envio()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    fechaInicio = dr[1].ToString(),
                    fechaLlegada = dr[2].ToString(),
                    monto = Int32.Parse(dr[3].ToString()),
                    NombreEmpleadoE = dr[4].ToString(),
                    NombreEstatusE = dr[5].ToString()
                });
            }
            dr.Close();
            conn.Close();
            return data;
        }
        //LISTA DE ESTATUS PARA EL DROPDOWN
        public List<Envio> obtenerEstatus()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT es.\"COD\", es.\"Nombre\" " +
                          "FROM \"Estatus\" es " +
                          "Order by \"Nombre\" ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Envio> data = new List<Envio>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Envio()
                {
                    fkEstatusE = Int32.Parse(dr[0].ToString()),
                    NombreEstatusE = dr[1].ToString(),
                });
            }
            dr.Close();
            conn.Close();
            return data;
        }
        //CAMBIAR ESTADO DEL ENVIO
        public int cambiarEstado(int cod, int fkEstatus)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Envio\" SET \"FK-EstatusE\"=" + fkEstatus + "" +
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
        //BUSCAR A UNO
        public Envio buscarEnvio(int cod)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT e.\"COD\", to_char(e.\"FechaInicio\", 'DD-MM-YYYY'), to_char(e.\"FechaLlegada\", 'DD-MM-YYYY'), " +
                          "e.\"Monto\", em.\"Nombre\", es.\"Nombre\" " +
                          "FROM \"Envio\" e, \"Empleado\" em, \"Estatus\" es " +
                          "WHERE e.\"COD\" = " + cod + " and em.\"CI\" = e.\"FK-EmpleadoE\" and es.\"COD\" = e.\"FK-EstatusE\" ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Envio data = new Envio();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.cod = Int32.Parse(dr[0].ToString());
                data.fechaInicio = dr[1].ToString();
                data.fechaLlegada = dr[2].ToString();
                data.monto = Int32.Parse(dr[3].ToString());
                data.NombreEmpleadoE = dr[4].ToString();
                data.NombreEstatusE = dr[5].ToString();
            }
            dr.Close();
            conn.Close();
            return data;
        }
        //ELIMINAR
        public int eliminarEnvio(int cod)
        {
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Envio\" WHERE \"COD\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
    }
}