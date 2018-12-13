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
        public DateTime fechaNac { get; set; }
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
            string correoEmp, string horarioAsig, int salarioAsig, string fechaContratado, string fechaFinal)
        {
            NpgsqlConnection conn = DAOCliente.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Empleado\" (\"CI\", \"Nombre\", \"Apellido\", \"FechaNac\", " +
                " \"Correo\", \"NivelAca\", \"Profesion\", \"EstadoCivil\", \"CantHijos\", \"CorreoEmpresa\", " +
                " \"SalarioAsig\", \"FechaContratado\", \"FechaFinal\") " +
                "VALUES (" + ci + ",'" + nombre + "','" + apellido + "',TO_DATE('" + fechaNac + "', 'YYYY-MM-DD'), " +
                " '"+ correo + "', '" + nivelAca + "', '" + profesion + "','" + estCivil + "', '" + cantHijos + "', " +
                " '" + correoEmp + "', '" + salarioAsig + "', TO_DATE('" + fechaContratado + "', 'YYYY-MM-DD')," +
                "  TO_DATE('" + fechaFinal + "', 'YYYY-MM-DD'))";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
    }
}