using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class MetodoPago
    {
        public int cod { get; set; }
        public string moneda { get; set; }
        public int cedulaCliente { get; set; }
        public string Banco { get; set; }
        public int NroCuenta { get; set; }
        public int montoE { get; set; }
        public int montoCh { get; set; }
        public int montoTrans { get; set; }
        public int montoTarj { get; set; }
    }
    public class DAOEfectivo : DAO
    {

        private static DAOEfectivo r = null;

        public static DAOEfectivo getInstance()
        {
            if (DAOEfectivo.r != null)
            {
                return r;
            }
            else
            {
                r = new DAOEfectivo();
                return r;
            }
        }
        //INSERTAR EFECTIVO
        public int insertarEfectivo(int codPago,string moneda, int fkCliente)
        {
            NpgsqlConnection conn = DAOEfectivo.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Efectivo\" (\"COD\", \"Moneda\", \"FK-ClienteE\") " +
                "VALUES ((SELECT NEXTVAL('seq')), '" + moneda + "', " +
                "" + fkCliente + ")";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE

                String sql2 = "SELECT  e.\"COD\" " +
                          "FROM \"Efectivo\" e " +
                          "Order by \"COD\" DESC " +
                          "Limit 1 ";
                NpgsqlCommand cmd2 = new NpgsqlCommand(sql2, conn);
                NpgsqlDataReader dr = cmd2.ExecuteReader();

                MetodoPago data = new MetodoPago();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.cod = Int32.Parse(dr[0].ToString());
                }
                dr.Close();

                sql = "INSERT INTO \"Pago-Metodo\" (\"COD\", \"CODPago\", \"CODEfect\") " +
                "VALUES ((SELECT NEXTVAL('seq')), " + codPago + ", " +
                "" + data.cod + ")"; 
                cmd = new NpgsqlCommand(sql, conn);
                try
                {
                    resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                }
                catch (Exception e)
                {
                    conn.Close();
                    return 0;
                }
                conn.Close();
                return resp;
            }
            catch (Exception e)
            {
                conn.Close();
                return 0;
            }
        }
    }
    public class Cheque : MetodoPago
    {
        public string fecha { get; set; }
    }
    public class DAOCheque : DAO
    {

        private static DAOCheque r = null;

        public static DAOCheque getInstance()
        {
            if (DAOCheque.r != null)
            {
                return r;
            }
            else
            {
                r = new DAOCheque();
                return r;
            }
        }
        //INSERTAR CHUEQUE
        public int insertarCheque(int codPago, string banco, int nroCuenta, string fecha, int montoCh, int fkCliente)
        {
            NpgsqlConnection conn = DAOCheque.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Cheque\" (\"COD\", \"Banco\", \"NroCuenta\", \"Fecha\", \"Monto\", \"FK-ClienteM\") " +
                "VALUES ((SELECT NEXTVAL('seq')), '" + banco + "', " + nroCuenta + ", TO_DATE('" + fecha + "', 'YYYY-MM-DD'), " +
                "" + montoCh + ", " + fkCliente + ")";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE

                String sql2 = "SELECT  e.\"COD\" " +
                          "FROM \"Cheque\" e " +
                          "Order by \"COD\" DESC " +
                          "Limit 1 ";
                NpgsqlCommand cmd2 = new NpgsqlCommand(sql2, conn);
                NpgsqlDataReader dr = cmd2.ExecuteReader();

                MetodoPago data = new MetodoPago();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.cod = Int32.Parse(dr[0].ToString());
                }
                dr.Close();

                sql = "INSERT INTO \"Pago-Metodo\" (\"COD\", \"CODPago\", \"CODCheque\") " +
                "VALUES ((SELECT NEXTVAL('seq')), " + codPago + ", " +
                "" + data.cod + ")";
                cmd = new NpgsqlCommand(sql, conn);
                try
                {
                    resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                }
                catch (Exception e)
                {
                    conn.Close();
                    return 0;
                }

                conn.Close();
                return resp;
            }
            catch (Exception e)
            {
                conn.Close();
                return 0;
            }
        }
    }
    public class Transferencia : MetodoPago
    {

        public string correo { get; set; }
        public string descripcion { get; set; }
    }
    public class DAOTransferencia : DAO
    {
        private static DAOTransferencia r = null;

        public static DAOTransferencia getInstance()
        {
            if (DAOTransferencia.r != null)
            {
                return r;
            }
            else
            {
                r = new DAOTransferencia();
                return r;
            }
        }
        //INSERTAR Transferencia
        public int insertarTransferencia(int codPago, string banco, int nroCuenta, string descripcion, string correo, int fkCliente)
        {
            NpgsqlConnection conn = DAOEfectivo.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Transferencia\" (\"COD\", \"Banco\", \"NroCuenta\", \"Descripcion\", " +
                "\"Correo\", \"FK-ClienteTrans\") " +
                "VALUES ((SELECT NEXTVAL('seq')), '" + banco + "', " + nroCuenta + ", '" + descripcion + "', " +
                "'" + correo + "', " + fkCliente + ")";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE

                String sql2 = "SELECT  e.\"COD\" " +
                          "FROM \"Transferencia\" e " +
                          "Order by \"COD\" DESC " +
                          "Limit 1 ";
                NpgsqlCommand cmd2 = new NpgsqlCommand(sql2, conn);
                NpgsqlDataReader dr = cmd2.ExecuteReader();

                MetodoPago data = new MetodoPago();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.cod = Int32.Parse(dr[0].ToString());
                }
                dr.Close();

                sql = "INSERT INTO \"Pago-Metodo\" (\"COD\", \"CODPago\", \"CODTrans\") " +
                "VALUES ((SELECT NEXTVAL('seq')), " + codPago + ", " +
                "" + data.cod + ")";
                cmd = new NpgsqlCommand(sql, conn);
                try
                {
                    resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                }
                catch (Exception e)
                {
                    conn.Close();
                    return 0;
                }

                conn.Close();
                return resp;
            }
            catch (Exception e)
            {
                conn.Close();
                return 0;
            }
        }
    }
    public class Tarjeta : MetodoPago
    {
        public string tipo { get; set; }
        public string fechaVencimiento { get; set; }
        public string marca { get; set; }
    }   
    public class DAOTarjeta : DAO
    {
        private static DAOTarjeta r = null;

        public static DAOTarjeta getInstance()
        {
            if (DAOTarjeta.r != null)
            {
                return r;
            }
            else
            {
                r = new DAOTarjeta();
                return r;
            }
        }
        //INSERTAR TARJETA
        public int insertarTarjeta(int codPago, string banco, int nroCuenta, string tipo, string fechaV, string marca, int fkCliente)
        {
            NpgsqlConnection conn = DAOEfectivo.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Tarjeta\" (\"COD\", \"Banco\", \"NroCuenta\", \"Tipo\", " +
                "\"FechaVen\", \"Marca\", \"FK-ClienteT\") " +
                "VALUES ((SELECT NEXTVAL('seq')), '" + banco + "', " + nroCuenta + ", '" + tipo + "', " +
                " TO_DATE('" + fechaV + "', 'YYYY-MM-DD'), '" + marca + "', " + fkCliente + ")";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE

                String sql2 = "SELECT  e.\"COD\" " +
                         "FROM \"Tarjeta\" e " +
                         "Order by \"COD\" DESC " +
                         "Limit 1 ";
                NpgsqlCommand cmd2 = new NpgsqlCommand(sql2, conn);
                NpgsqlDataReader dr = cmd2.ExecuteReader();

                MetodoPago data = new MetodoPago();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.cod = Int32.Parse(dr[0].ToString());
                }
                dr.Close();

                sql = "INSERT INTO \"Pago-Metodo\" (\"COD\", \"CODPago\", \"CODTarjeta\") " +
                "VALUES ((SELECT NEXTVAL('seq')), " + codPago + ", " +
                "" + data.cod + ")";
                cmd = new NpgsqlCommand(sql, conn);
                try
                {
                    resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                }
                catch (Exception e)
                {
                    conn.Close();
                    return 0;
                }

                conn.Close();
                return resp;
            }
            catch (Exception e)
            {
                conn.Close();
                return 0;
            }
        }
    }
}
