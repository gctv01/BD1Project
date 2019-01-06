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

        //Para detalles del envio
        public int codPaquete { get; set; }
        public int codPago { get; set; }
        public string codVehiculo { get; set; }
        public string codRuta { get; set; }
        public string nombreClienteO { get; set; }
        public string nombreClienteD { get; set; }
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
                          "Order by \"COD\" ";
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
        //DETALLES DE ENVIO
        public Envio detallesEnvio(int cod)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select e.\"COD\", em.\"Nombre\"||' '||em.\"Apellido\", p.\"COD\", pg.\"COD\", vr.\"PlacaA\", " +
                        "vr.\"PlacaB\", vr.\"PlacaT\", vr.\"CODRuta\", c2.\"Nombre\" ||' '||c2.\"Apellido\", " +
                        "c.\"Nombre\" ||' '||c.\"Apellido\" " +
                        "FROM \"Paquete\" p, \"Envio\" e, \"Pago\" pg, \"Veh-Rut\" vr, \"Cliente\" c, " +
                        "\"Cliente\" c2, \"Empleado\" em, \"Traslado\" t " +
                        "Where em.\"CI\"= e.\"FK-EmpleadoE\" and e.\"COD\"= p.\"FK-EnvioP\" and pg.\"FK-EnvioP\"= e.\"COD\" and " +
                        "t.\"CODEnvio\"=e.\"COD\" and t.\"CODVeh-Rut\"=vr.\"COD\" and c.\"CI\" = p.\"FK-Cliente2\" and " +
                        "c2.\"CI\" = p.\"FK-Cliente1\" and e.\"COD\" = "+cod+" ; ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Envio data = new Envio();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.cod = Int32.Parse(dr[0].ToString());
                data.NombreEmpleadoE = dr[1].ToString();
                data.codPaquete = Int32.Parse(dr[2].ToString());
                data.codPago = Int32.Parse(dr[3].ToString());
                data.codVehiculo = dr[4].ToString();               
                if (data.codVehiculo == "")
                {
                    data.codVehiculo = dr[5].ToString();
                }
                if (data.codVehiculo == "")
                {
                    data.codVehiculo = dr[6].ToString();
                }
                data.codRuta = dr[7].ToString();
                data.nombreClienteO = dr[8].ToString();
                data.nombreClienteD = dr[9].ToString();
            }
            dr.Close();
            if ((data.codVehiculo == null)&&(data.codRuta == null))
            {
                sql = "Select em.\"Nombre\"||' '||em.\"Apellido\", p.\"COD\", pg.\"COD\", c2.\"Nombre\" ||' '||c2.\"Apellido\", " +
                        "c.\"Nombre\" ||' '||c.\"Apellido\" " +
                        "FROM \"Paquete\" p, \"Envio\" e, \"Pago\" pg, \"Cliente\" c, " +
                        "\"Cliente\" c2, \"Empleado\" em " +
                        "Where em.\"CI\"= e.\"FK-EmpleadoE\" and e.\"COD\"= p.\"FK-EnvioP\" and pg.\"FK-EnvioP\"= e.\"COD\" and " +
                        "c.\"CI\" = p.\"FK-Cliente2\" and " +
                        "c2.\"CI\" = p.\"FK-Cliente1\" and e.\"COD\" = " + cod + " ; ";
                cmd = new NpgsqlCommand(sql, conn);
                dr = cmd.ExecuteReader();

                data = new Envio();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.NombreEmpleadoE = dr[0].ToString();
                    data.codPaquete = Int32.Parse(dr[1].ToString());
                    data.codPago = Int32.Parse(dr[2].ToString());
                    data.nombreClienteO = dr[3].ToString();
                    data.nombreClienteD = dr[4].ToString();

                    data.codVehiculo = "-";
                    data.codRuta = "-";
                }
                dr.Close();
            }
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
                          "WHERE em.\"CI\" = e.\"FK-EmpleadoE\" and es.\"COD\" = e.\"FK-EstatusE\" and e.\"COD\" = " + cod + " ";
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