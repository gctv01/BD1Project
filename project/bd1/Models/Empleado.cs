using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Empleado
    {
        public int CI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string fechaNac { get; set; }
        public string correo { get; set; }
        public string nivelAca { get; set; }
        public string profesion { get; set; }
        public string estCivil { get; set; }
        public string cantHijos { get; set; }
        public string correoEmp { get; set; }
        public string horarioAsig { get; set; }
        public int salarioAsig { get; set; }
        public string fechaContratado { get; set; }
        //Atributos relacionados con otras tablas
        public string gastos { get; set; }
        public string horario { get; set; }
        public string perteneceOficina { get; set; }
        public string comandaOficina { get; set; }
        public string telefono { get; set; }
        //PARA REPORTES

    }
    public class DAOEmpleado : DAO
    {

        private static DAOEmpleado c = null;

        public static DAOEmpleado getInstance()
        {
            if (DAOEmpleado.c != null)
            {
                return c;
            }
            else
            {
                c = new DAOEmpleado();
                return c;
            }
        }
        public int insertarEmpleado(int ci, string nombre, string apellido, string fechaNac, 
            string correo, string nivelAca, string profesion, string estCivil, int cantHijos, 
            string correoEmp, int salarioAsig, string fechaContratado, int sucursal,
            string horarioI)
        {
            NpgsqlConnection conn = DAOEmpleado.getInstanceDAO();
            conn.Open();
            int fkgastos = 4;

            String sql = "INSERT INTO \"Empleado\" (\"CI\", \"Nombre\", \"Apellido\", \"FechaNac\", " +
                " \"Correo\", \"NivelAca\", \"Profesion\", \"EstadoCivil\", \"CantHijos\", \"CorreoEmpresa\", " +
                " \"SalarioAsig\", \"FechaContratado\", \"FK-GastosE\", \"FK-SucursalEmp\", \"FK-HorarioEmp\") " +
                " VALUES (" + ci + ",'" + nombre + "','" + apellido + "',TO_DATE('" + fechaNac + "', 'YYYY-MM-DD'), " +
                " '"+ correo + "', '" + nivelAca + "', '" + profesion + "','" + estCivil + "', " + cantHijos + ", " +
                " '" + correoEmp + "', " + salarioAsig + ", TO_DATE('" + fechaContratado + "', 'YYYY-MM-DD'), " +
                " " + fkgastos + ", " + sucursal + "," + horarioI + ");";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.ToString());
                conn.Close();
                return 0;
            }
        }
        public List<Empleado> obtenerEmpleado()
        {
            List<Empleado> data = null;
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"CI\", \"Nombre\", \"Apellido\", TO_CHAR(\"FechaNac\",'YYYY-MM-DD'), " +
                " \"Correo\", \"NivelAca\", \"Profesion\", \"EstadoCivil\", \"CantHijos\", \"CorreoEmpresa\", " +
                " \"SalarioAsig\", TO_CHAR(\"FechaContratado\",'YYYY-MM-DD') " +
                "FROM \"Empleado\"" +
                "Order by \"Nombre\", \"Apellido\"";
            //CONSULTA PARA MOSTRAR EL EMPLEADO CON SU SUCURSAL
            //Select e."Nombre", e."Apellido", s."Nombre"
            //From "Empleado" e, "Sucursal" s
            //Where "FK-SucursalEmp" = s."COD"
            try
            {
                NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = cmd.ExecuteReader();

                data = new List<Empleado>();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.Add(new Empleado()
                    {
                        CI = Int32.Parse(dr[0].ToString()),
                        Nombre = dr[1].ToString(),
                        Apellido = dr[2].ToString(),
                        fechaNac = dr[3].ToString(),
                        correo = dr[4].ToString(),
                        nivelAca = dr[5].ToString(),
                        profesion = dr[6].ToString(),
                        estCivil = dr[7].ToString(),
                        cantHijos = dr[8].ToString(),
                        correoEmp = dr[9].ToString(),
                        salarioAsig = Int32.Parse(dr[10].ToString()),
                        fechaContratado = dr[11].ToString(),
                    });
                }
                dr.Close();
            }catch(Exception e)
            {
                conn.Close();
            }
            conn.Close();
            return data;
        }

        //BUSCAR A UNO
        public Empleado buscarEmpleado(int cod)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"CI\", \"Nombre\", \"Apellido\", \"FechaNac\", " +
                " \"Correo\", \"NivelAca\", \"Profesion\", \"EstadoCivil\", \"CantHijos\", \"CorreoEmpresa\", " +
                " \"SalarioAsig\", \"FechaContratado\" " +
                "FROM \"Empleado\" " +
                "WHERE \"CI\" = " + cod + ";";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Empleado data = new Empleado();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.CI = Int32.Parse(dr[0].ToString());
                data.Nombre = dr[1].ToString();
                data.Apellido = dr[2].ToString();
                data.fechaNac = dr[3].ToString();
                data.correo = dr[4].ToString();
                data.nivelAca = dr[5].ToString();
                data.profesion = dr[6].ToString();
                data.estCivil = dr[7].ToString();
                data.cantHijos = dr[8].ToString();
                data.correoEmp = dr[9].ToString();
                data.salarioAsig = Int32.Parse(dr[10].ToString());
                data.fechaContratado = dr[11].ToString();
                //data.telefono = dr[12].ToString();
            }
            dr.Close();
            conn.Close();
            return data;

        }
        //ELIMINAR
        public int eliminarEmpleado(int cod)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Empleado\" WHERE \"CI\" = " + cod + "";
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
        //MODIFICAR
        public int modificarEmpleado(int ci, string nombre, string apellido, string fechaNac,
            string correo, string nivelAca, string profesion, string estCivil, int cantHijos,
            string correoEmp, int salarioAsig, string fechaContratado, string fechaFinal)
        {
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Empleado\" SET \"Nombre\"='" + nombre + "', \"Apellido\"='" + apellido + "', " +
                            "\"FechaNac\"= TO_DATE('" + fechaNac + "', 'YYYY-MM-DD')," +
                            "\"Correo\"='" + correo + "', \"NivelAca\"='" + nivelAca + "'," +
                            "\"Profesion\"='" + profesion + "',\"EstadoCivil\"='" + estCivil + "', \"CantHijos\"='" + cantHijos + "'," +
                            "\"CorreoEmpresa\"='" + correoEmp + "', \"SalarioAsig\"='" + salarioAsig + "'," +
                            "\"FechaContratado\"= TO_DATE('" + fechaContratado + "', 'YYYY-MM-DD')," +
                            " WHERE \"CI\"= " + ci + "";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.ToString());
                conn.Close();
                return 0;
            }
        }
        //REPORTE 7 DE LOS REQUERIMIENTOS
        public List<Empleado> obtenerReporte7R()
        {
            List<Empleado> data = null;
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select e.\"CI\", e.\"Nombre\"||' '||e.\"Apellido\", to_char(a.\"Fecha\", 'DD-MM-YYYY') " +
                "from \"Empleado\" e, \"Asistencia\" a " +
                "where a.\"CIEmpleado\"=e.\"CI\" " +
                "order by e.\"Nombre\", e.\"Apellido\", a.\"Fecha\"";
            try
            {
                NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = cmd.ExecuteReader();

                data = new List<Empleado>();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.Add(new Empleado()
                    {
                        CI = Int32.Parse(dr[0].ToString()),
                        Nombre = dr[1].ToString(),
                        horario = dr[2].ToString(),
                    });
                }
                dr.Close();
            }
            catch (Exception e)
            {
                conn.Close();
            }
            conn.Close();
            return data;
        }
        //REPORTE 8 DE LOS REQUERIMIENTOS
        public List<Empleado> obtenerReporte8R()
        {
            List<Empleado> data = null;
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select e.\"CI\", e.\"Nombre\"||' '||e.\"Apellido\", to_char(a.\"Fecha\", 'DD-MM-YYYY'), " +
                "'De '||to_char(h.\"HorarioInicio\", 'hh24:mm:ss')||' a '||to_char( h.\"HorarioFinal\", 'hh24:mm:ss')" +
                "from \"Empleado\" e, \"Asistencia\" a, \"Horario\" h " +
                "where a.\"CIEmpleado\"=e.\"CI\" and e.\"FK-HorarioEmp\"=h.\"COD\" " +
                "order by e.\"Nombre\", e.\"Apellido\", a.\"Fecha\" ";
            try
            {
                NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = cmd.ExecuteReader();

                data = new List<Empleado>();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.Add(new Empleado()
                    {
                        CI = Int32.Parse(dr[0].ToString()),
                        Nombre = dr[1].ToString(),
                        horario = dr[2].ToString(),
                        horarioAsig = dr[3].ToString(),
                    });
                }
                dr.Close();
            }
            catch (Exception e)
            {
                conn.Close();
            }
            conn.Close();
            return data;
        }
        //REPORTE 6 DE LOS REQUERIMIENTOS
        public List<Empleado> obtenerReporte6R()
        {
            List<Empleado> data = null;
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select e.\"CI\", e.\"Nombre\"||' '||e.\"Apellido\", e.\"SalarioAsig\" " +
                "from \"Empleado\" e ";
            try
            {
                NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = cmd.ExecuteReader();

                data = new List<Empleado>();
                Random r = new Random();
                int i = 1;
                while (dr.Read())
                {
                    r = new Random();
                    i = r.Next(1,3);
                    if(i == 1)                       
                    {
                        System.Diagnostics.Debug.WriteLine("connection established");
                        data.Add(new Empleado()
                        {
                            CI = Int32.Parse(dr[0].ToString()),
                            Nombre = dr[1].ToString(),
                            salarioAsig = Int32.Parse(dr[2].ToString()),
                            gastos = "Pagado"
                        });
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine("connection established");
                        data.Add(new Empleado()
                        {
                            CI = Int32.Parse(dr[0].ToString()),
                            Nombre = dr[1].ToString(),
                            salarioAsig = Int32.Parse(dr[2].ToString()),
                            gastos = "Por pagar"
                        });
                    }
                    
                }
                dr.Close();
            }
            catch (Exception e)
            {
                conn.Close();
            }
            conn.Close();
            return data;
        }
        //REPORTE 6 DE LOS REQUERIMIENTOS
        public List<Empleado> obtenerReporte4E(string fecha1, string fecha2)
        {
            List<Empleado> data = null;
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select \"CI\", \"Nombre\"||' '||\"Apellido\", to_char(\"FechaNac\",'DD-MM-YYYY'), \"CantHijos\", " +
                "\"Profesion\", to_char(\"FechaContratado\",'DD-MM-YYYY') " +               
                "from \"Empleado\" " +
                "where \"FechaContratado\" between '" + fecha1 + "' and '" + fecha2 + "' " +
                "order by \"FechaContratado\" ";
            try
            {
                NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
                NpgsqlDataReader dr = cmd.ExecuteReader();

                data = new List<Empleado>();

                while (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("connection established");
                    data.Add(new Empleado()
                    {
                        CI = Int32.Parse(dr[0].ToString()),
                        Nombre = dr[1].ToString(),
                        fechaNac = dr[2].ToString(),
                        cantHijos = dr[3].ToString(),
                        profesion = dr[4].ToString(),
                        fechaContratado = dr[5].ToString(),
                    });        
                }
                dr.Close();
            }
            catch (Exception e)
            {
                conn.Close();
            }
            conn.Close();
            return data;
        }
        public Empleado obtenerReporte4E_cont(string fecha1, string fecha2)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select Count(x.*)" +
                "From (Select \"CI\", \"Nombre\"||' '||\"Apellido\", to_char(\"FechaNac\",'DD-MM-YYYY'), \"CantHijos\", " +
                "\"Profesion\", to_char(\"FechaContratado\",'DD-MM-YYYY') " +
                "from \"Empleado\" " +
                "where \"FechaContratado\" between '" + fecha1 + "' and '" + fecha2 + "' " +
                "order by \"FechaContratado\") x";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Empleado data = new Empleado();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.gastos = dr[0].ToString();
            }
            dr.Close();
            conn.Close();
            return data;
        }
    }
}