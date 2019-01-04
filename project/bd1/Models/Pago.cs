using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Pago
    {
        public int cod { get; set; }
        public int montoTotal { get; set; }
        public string fecha { get; set; }
        public int pagoEnDestino { get; set; }
        public int fkEnvio { get; set; }
    }
    public class DAOPago : DAO
    {

        private static DAOPago r = null;

        public static DAOPago getInstance()
        {
            if (DAOPago.r != null)
            {
                return r;
            }
            else
            {
                r = new DAOPago();
                return r;
            }
        }
        //VER LISTA DE PAGOS
        //public List<Pago> obtenerPago()
        //{

        //    NpgsqlConnection conn = DAO.getInstanceDAO();
        //    conn.Open();
        //    string sql = "SELECT p.\"COD\", p.\"Peso\", p.\"Volumen\", tp.\"Clasificacion\", p.\"FK-EnvioP\", s.\"Nombre\", " +
        //                  "FROM \"Paquete\" p, \"TipoPaquete\" tp, \"Cliente\" c1, \"Cliente\" c2, \"Sucursal\" s " +
        //                  "WHERE p.\"FK - TipoPaquete\"= tp.\"COD\" and p.\"FK - Sucursal\"=s.\"COD\" and " +
        //                  "Order by p.\"COD\" ";
        //    NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
        //    NpgsqlDataReader dr = cmd.ExecuteReader();

        //    List<Pago> data = new List<Pago>();

        //    while (dr.Read())
        //    {
        //        System.Diagnostics.Debug.WriteLine("connection established");
        //        data.Add(new Pago()
        //        {
        //            cod = Int32.Parse(dr[0].ToString()),
        //            peso = Int32.Parse(dr[1].ToString()),
        //            volumen = Int32.Parse(dr[2].ToString()),
        //            ClasificacionTipoPaquete = dr[3].ToString(),
        //            fkEnvioP = Int32.Parse(dr[4].ToString()),
        //            NombreSucursal = dr[5].ToString(),
        //            NombreClienteEnvia = dr[6].ToString(),
        //            NombreClienteRecibe = dr[7].ToString(),
        //        });
        //    }
        //    dr.Close();
        //    conn.Close();
        //    return data;
        //}

        //BUSCAR A UNO
        public Pago buscarPago(int cod)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"COD\" FROM \"Pago\"" +
                "WHERE \"COD\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Pago data = new Pago();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.cod = Int32.Parse(dr[0].ToString());
            }
            dr.Close();
            conn.Close();
            return data;
        }
        //ELIMINAR
        public int eliminarPago(int fkEnvio)
        {
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Pago\" WHERE \"FK-EnvioP\" = " + fkEnvio + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
    }
}