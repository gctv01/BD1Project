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
        public string pagoEnDestino { get; set; }
        public string codMetodoPago { get; set; }
        public string metodoPago { get; set; }
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
            string sql = "SELECT p.\"COD\", p.\"MontoTotal\", to_char(p.\"Fecha\", 'DD-MM-YYYY'), p.\"PagoDest\", pm.\"CODTarjeta\", " +
                          "pm.\"CODCheque\", pm.\"CODTrans\", pm.\"CODEfect\" " +
                          "FROM \"Pago\" p, \"Pago-Metodo\" pm " +
                          "WHERE p.\"COD\" = " + cod + " and p.\"COD\"=pm.\"CODPago\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Pago data = new Pago();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.cod = Int32.Parse(dr[0].ToString());
                data.montoTotal = Int32.Parse(dr[1].ToString());
                data.fecha = dr[2].ToString();
                data.pagoEnDestino = dr[3].ToString();
                data.codMetodoPago = dr[4].ToString();
                data.metodoPago = "Tarjeta";
                if (data.codMetodoPago == "")
                {
                    data.codMetodoPago = dr[5].ToString();
                    data.metodoPago = "Cheque";
                }
                if (data.codMetodoPago == "")
                {
                    data.codMetodoPago = dr[6].ToString();
                    data.metodoPago = "Transferencia";
                }
                if ((data.codMetodoPago == "")||(data.pagoEnDestino == "True"))
                {
                    data.codMetodoPago = dr[7].ToString();
                    data.metodoPago = "Efectivo";
                }
                if (data.pagoEnDestino == "True")
                {
                    data.pagoEnDestino = "Si";
                }
                else
                {
                    data.pagoEnDestino = "No";
                }
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