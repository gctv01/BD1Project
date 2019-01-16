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
        public double monto { get; set; }
        public string NombreEmpleadoE { get; set; }
        public int fkEmpleadoE { get; set; }
        public string NombreEstatusE { get; set; }
        public int fkEstatusE { get; set; }

        //Por conveniencia
        public int sucursal { get; set; }

        //Para detalles del envio
        public int codPaquete { get; set; }
        public int codPago { get; set; }
        public string codVehiculo { get; set; }
        public string codRuta { get; set; }
        public string nombreClienteO { get; set; }
        public string nombreClienteD { get; set; }
        public int duracionVR { get; set; }

        //Para reportes
        public int contEnvios { get; set; }
        public string mes { get; set; }
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
        //INSERTAR ENVIO
        public int insertarEnvio(string fechaInicio, string fechaLlegada)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Envio\" (\"COD\", \"FechaInicio\", \"FechaLlegada\", \"FK-EstatusE\") " +
                "VALUES ((SELECT NEXTVAL('seq')), TO_DATE('" + fechaInicio + "', 'YYYY-MM-DD'), TO_DATE('" + fechaLlegada + "', 'YYYY-MM-DD'), 5)";
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
        //Ingresar monto y fecha estimada del envio
        public int actualizarEnvio(int cod, double monto, string fechaEstimada, int fkE)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();
            int montoT = Convert.ToInt32(monto);
            String sql = "UPDATE \"Envio\" SET \"Monto\"=" + montoT + ", " +
                "\"FechaLlegada\"= TO_DATE('"+ fechaEstimada + "', 'YYYY-MM-DD'), \"FK-EmpleadoE\"="+ fkE +" " +
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
        //BUSCAR ULTIMO ENVIO
        public Envio buscarUltimoEnvio()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT  e.\"COD\" " +
                          "FROM \"Envio\" e " +
                          "Order by \"COD\" DESC " +
                          "LIMIT 1 ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Envio data = new Envio();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.cod = Int32.Parse(dr[0].ToString());
            }
            dr.Close();
            conn.Close();
            return data;
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
                          "Order by \"COD\" DESC";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Envio> data = new List<Envio>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                try
                {
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
                catch
                {
                    data.Add(new Envio()
                    {
                        cod = Int32.Parse(dr[0].ToString()),
                        fechaInicio = dr[1].ToString(),
                        fechaLlegada = "-",
                        monto = 0,
                        NombreEmpleadoE = dr[4].ToString(),
                        NombreEstatusE = dr[5].ToString()
                    });
                }  
            }
            dr.Close();
            conn.Close();
            return data;
        }
        public List<Envio> obtenerEnvioUsuarioCliente(int codUser)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT e.\"COD\", to_char(e.\"FechaInicio\", 'DD-MM-YYYY'), to_char(e.\"FechaLlegada\", 'DD-MM-YYYY'),  " +
                "e.\"Monto\", em.\"Nombre\", es.\"Nombre\"  " +
                "FROM \"Envio\" e, \"Empleado\" em, \"Estatus\" es, \"Paquete\" p, \"Cliente\" c, \"Usuario\" u " +
                "WHERE em.\"CI\" = e.\"FK-EmpleadoE\" and es.\"COD\" = e.\"FK-EstatusE\" and p.\"FK-EnvioP\"=e.\"COD\" and p.\"FK-Cliente1\"=c.\"CI\"  " +
                "and c.\"CI\"=u.\"FK-ClienteU\" and  u.\"COD\"= "+ codUser +" " +
                "Order by \"COD\" DESC";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Envio> data = new List<Envio>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                try
                {
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
                catch
                {
                    data.Add(new Envio()
                    {
                        cod = Int32.Parse(dr[0].ToString()),
                        fechaInicio = dr[1].ToString(),
                        fechaLlegada = "-",
                        monto = 0,
                        NombreEmpleadoE = dr[4].ToString(),
                        NombreEstatusE = dr[5].ToString()
                    });
                }
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
            if(data.cod == 0)
            {
                sql = "Select e.\"COD\", em.\"Nombre\"||' '||em.\"Apellido\", p.\"COD\", vr.\"PlacaA\", " +
                        "vr.\"PlacaB\", vr.\"PlacaT\", vr.\"CODRuta\", c2.\"Nombre\" ||' '||c2.\"Apellido\", " +
                        "c.\"Nombre\" ||' '||c.\"Apellido\" " +
                        "FROM \"Paquete\" p, \"Envio\" e, \"Veh-Rut\" vr, \"Cliente\" c, " +
                        "\"Cliente\" c2, \"Empleado\" em, \"Traslado\" t " +
                        "Where em.\"CI\"= e.\"FK-EmpleadoE\" and e.\"COD\"= p.\"FK-EnvioP\" and " +
                        "t.\"CODEnvio\"=e.\"COD\" and t.\"CODVeh-Rut\"=vr.\"COD\" and c.\"CI\" = p.\"FK-Cliente2\" and " +
                        "c2.\"CI\" = p.\"FK-Cliente1\" and e.\"COD\" = " + cod + " ; ";
                cmd = new NpgsqlCommand(sql, conn);
                dr = cmd.ExecuteReader();

                data = new Envio();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.cod = Int32.Parse(dr[0].ToString());
                    data.NombreEmpleadoE = dr[1].ToString();
                    data.codPaquete = Int32.Parse(dr[2].ToString());
                    data.codPago = 0;
                    data.codVehiculo = dr[3].ToString();
                    if (data.codVehiculo == "")
                    {
                        data.codVehiculo = dr[4].ToString();
                    }
                    if (data.codVehiculo == "")
                    {
                        data.codVehiculo = dr[5].ToString();
                    }
                    data.codRuta = dr[6].ToString();
                    data.nombreClienteO = dr[7].ToString();
                    data.nombreClienteD = dr[8].ToString();
                }
                dr.Close();
            }
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
        //ELIMINAR Envio
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
        //ELIMINAR Traslado
        public int eliminarTraslado(int cod)
        {
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();

            String sql2 = "SELECT  e.\"CODVeh-Rut\" " +
                          "FROM \"Traslado\" e " +
                          "WHERE \"CODEnvio\" = " + cod + " ";
            NpgsqlCommand cmd2 = new NpgsqlCommand(sql2, conn);
            NpgsqlDataReader dr = cmd2.ExecuteReader();

            Envio data = new Envio();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.cod = Int32.Parse(dr[0].ToString());
            }
            dr.Close();


            String sql = "DELETE FROM \"Traslado\" WHERE \"CODEnvio\" = " + cod + ";" +
                         "DELETE FROM \"Veh-Rut\" WHERE \"COD\" = " + data.cod + ";";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            
            conn.Close();

            return resp;
        }
        //INSERTAR VEH-RUT Terrestre
        public int insertarTerrRut(string transporte, int duracion, int codRuta)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Veh-Rut\" (\"COD\", \"PlacaT\", \"Duracion\", \"CODRuta\") " +
                "VALUES ((SELECT NEXTVAL('seq')), '" + transporte + "', " + duracion + ", " + codRuta + ")";
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
        //INSERTAR VEH-RUT Barco
        public int insertarBarRut(string transporte, int duracion, int codRuta)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Veh-Rut\" (\"COD\", \"PlacaB\", \"Duracion\", \"CODRuta\") " +
                "VALUES ((SELECT NEXTVAL('seq')), '" + transporte + "', " + duracion + ", " + codRuta + ")";
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
        //INSERTAR VEH-RUT Avion
        public int insertarAviRut(string transporte, int duracion, int codRuta)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Veh-Rut\" (\"COD\", \"PlacaA\", \"Duracion\", \"CODRuta\") " +
                "VALUES ((SELECT NEXTVAL('seq')), '" + transporte + "', " + duracion + ", " + codRuta + ")";
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
        //BUSCAR ULTIMO VEH-RUT
        public Envio buscarUltimoVehRut()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT  e.\"COD\" " +
                          "FROM \"Veh-Rut\" e " +
                          "Order by \"COD\" DESC " +
                          "LIMIT 1 ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Envio data = new Envio();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.cod = Int32.Parse(dr[0].ToString());
            }
            dr.Close();
            conn.Close();
            return data;
        }
        //INSERTAR TRASLADO
        public int insertarTraslado(int codVR, int codE, int precioV, int precioR)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Traslado\" (\"COD\", \"CODVeh-Rut\", \"CODEnvio\", \"PrecioVeh\", \"PrecioRuta\") " +
                "VALUES ((SELECT NEXTVAL('seq')), " + codVR + ", " + codE + ", " + precioV + ", " + precioR + ")";
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
        //REPORTE 4 DE LOS REQUERIMIENTOS
        public List<Envio> obtenerReporte4R()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select Count(EXTRACT(MONTH FROM \"FechaInicio\"))as conteo_envio, EXTRACT(MONTH FROM \"FechaInicio\") as mes_utilizado " +
                "from \"Envio\" e " +
                "Group by mes_utilizado " +
                "Order by conteo_envio DESC " +
                "limit 1";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Envio> data = new List<Envio>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                    data.Add(new Envio()
                    {
                        contEnvios = Int32.Parse(dr[0].ToString()),
                        mes = dr[1].ToString(),
                    });
            }
            dr.Close();
            conn.Close();
            return data;
        }
    }
}