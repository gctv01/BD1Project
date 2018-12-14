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
        public string fechaFinal { get; set; }

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
            string correoEmp, int salarioAsig, string fechaContratado, string fechaFinal)
        {
            NpgsqlConnection conn = DAOEmpleado.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Empleado\" (\"CI\", \"Nombre\", \"Apellido\", \"FechaNac\", " +
                " \"Correo\", \"NivelAca\", \"Profesion\", \"EstadoCivil\", \"CantHijos\", \"CorreoEmpresa\", " +
                " \"SalarioAsig\", \"FechaContratado\", \"FechaFinal\") " +
                "VALUES (" + ci + ",'" + nombre + "','" + apellido + "',TO_DATE('" + fechaNac + "', 'YYYY-MM-DD'), " +
                " '"+ correo + "', '" + nivelAca + "', '" + profesion + "','" + estCivil + "', '" + cantHijos + "', " +
                " '" + correoEmp + "', '" + salarioAsig + "', TO_DATE('" + fechaContratado + "', 'YYYY-MM-DD')," +
                "  TO_DATE('" + fechaFinal + "', 'YYYY-MM-DD'))";
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
                " \"SalarioAsig\", TO_CHAR(\"FechaContratado\",'YYYY-MM-DD'), TO_CHAR(\"FechaFinal\",'YYYY-MM-DD') " +
                "FROM \"Empleado\"" +
                "Order by \"CI\"";
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
                        fechaFinal = dr[12].ToString()
                    });
                }
                dr.Close();
            } catch(Exception e) { conn.Close();}
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
                " \"SalarioAsig\", \"FechaContratado\", \"FechaFinal\"" +
                "FROM \"Empleado\"" +
                "WHERE \"CI\" = " + cod + "";
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
                data.fechaFinal = dr[12].ToString();
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
            catch
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
                            "\"FechaFinal\"= TO_DATE('" + fechaFinal + "', 'YYYY-MM-DD') " +
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
    }
}