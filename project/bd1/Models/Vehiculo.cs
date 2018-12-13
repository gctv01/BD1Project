using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Vehiculo
    {
        public string placa { get; set; }
        public int serialMotor { get; set; }
        public int capacidad { get; set; }
        public int peso { get; set; }
        public string descripcion { get; set; }
        public int serialCarroceria { get; set; }
        public string fechaCreacion { get; set; }       
    }
    //BARCOS
    public class Barco : Vehiculo
    {
        public string nombre { get; set; }
    }
    public class DAOBarco : DAO
    {
        private static DAOBarco c = null;

        public static DAOBarco getInstance()
        {
            if (DAOBarco.c != null)
            {
                return c;
            }
            else
            {
                c = new DAOBarco();
                return c;
            }
        }
        public int insertarBarco(string placa, int serialMotor, int capacidad, int peso, string descripcion,
            int serialCarroceria, string fechaCreacion, string nombre)
        {
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Barco\" (\"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Nombre\") " +
                "VALUES ('" + placa + "','" + serialMotor + "','" + capacidad + "','" + peso + "'," +
                "'" + descripcion + "','" + serialCarroceria + "',TO_DATE('" + fechaCreacion + "', 'YYYY-MM-DD'), '" + nombre + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        public List<Barco> obtenerBarcos()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Nombre\"" +
                "FROM \"Barco\" ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Barco> data = new List<Barco>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Barco()
                {
                    placa = dr[0].ToString(),
                    serialMotor = Int32.Parse(dr[1].ToString()),
                    capacidad = Int32.Parse(dr[2].ToString()),
                    peso = Int32.Parse(dr[3].ToString()),
                    descripcion = dr[4].ToString(),
                    serialCarroceria = Int32.Parse(dr[5].ToString()),
                    fechaCreacion = dr[6].ToString(),
                    nombre = dr[7].ToString(),

                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //ELIMINAR Barco
        public int eliminarBarco(string placa)
        {
            NpgsqlConnection conn = DAOBarco.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Barco\" WHERE \"Placa\" = '" + placa + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        //MODIFICAR Barco
        public int modificarBarco(string placa, int serialMotor, int capacidad, int peso, string descripcion,
            int serialCarroceria, string fechaCreacion, string nombre)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Barco\" SET \"SerialMotor\"='" + serialMotor + "', \"Capacidad\"='" + capacidad + "', " +
                            "\"Peso\"='" + peso + "' ,\"Descripcion\"='" + descripcion + "'," +
                            "\"SerialCarroceria\"='" + serialCarroceria + "', \"FechaCreacion\"= TO_DATE('" + fechaCreacion + "', 'YYYY-MM-DD')," +
                            "\"Nombre\"='" + nombre + "'" +
                            "WHERE \"Placa\"='" + placa + "'";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        //BUSCAR A UNO Barco
        public Barco buscarBarco(string placa)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Nombre\"" +
                "FROM \"Barco\" WHERE \"Placa\"='" + placa + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Barco data = new Barco();

            while (dr.Read())
            {
                data.placa = dr[0].ToString();
                data.serialMotor = Int32.Parse(dr[1].ToString());
                data.capacidad = Int32.Parse(dr[2].ToString());
                data.peso = Int32.Parse(dr[3].ToString());
                data.descripcion = dr[4].ToString();
                data.serialCarroceria = Int32.Parse(dr[5].ToString());
                data.fechaCreacion = dr[6].ToString();
                data.nombre = dr[7].ToString();

            }
            dr.Close();
            conn.Close();

            return data;

        }
    }
    //AVIONES
    public class Avion : Vehiculo
    {
        public int longitud { get; set; }
        public int pesoVacio { get; set; }
        public int envergadura { get; set; }
        public int pesoMax { get; set; }
        public int altura { get; set; }
        public int anchoCabina { get; set; }
        public int capacidadCombustible { get; set; }
        public int carreraDespegue { get; set; }
        public int diametroFuselaje { get; set; }
    }
    //VEHICULOS TERRESTRES
    public class Terrestre : Vehiculo
    {
        public string tipo { get; set; }
    }

    public class DAOTerrestre : DAO
    {
        private static DAOTerrestre c = null;

        public static DAOTerrestre getInstance()
        {
            if (DAOTerrestre.c != null)
            {
                return c;
            }
            else
            {
                c = new DAOTerrestre();
                return c;
            }
        }
        public int insertarTerrestres(string placa, int serialMotor, int capacidad, int peso, string descripcion,
            int serialCarroceria, string fechaCreacion, string tipo)
        {
            NpgsqlConnection conn = DAOTerrestre.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Terrestre\" (\"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Tipo\") " +
                "VALUES ('" + placa +"','" + serialMotor + "','" + capacidad + "','" + peso + "'," +
                "'" + descripcion + "','" + serialCarroceria + "',TO_DATE('" + fechaCreacion + "', 'YYYY-MM-DD'), '" + tipo + "')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        public List<Terrestre> obtenerTerrestres()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Tipo\"" +
                "FROM \"Terrestre\" ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Terrestre> data = new List<Terrestre>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Terrestre()
                {
                    placa = dr[0].ToString(),
                    serialMotor = Int32.Parse(dr[1].ToString()),
                    capacidad = Int32.Parse(dr[2].ToString()),
                    peso = Int32.Parse(dr[3].ToString()),
                    descripcion = dr[4].ToString(),
                    serialCarroceria = Int32.Parse(dr[5].ToString()),
                    fechaCreacion = dr[6].ToString(),
                    tipo = dr[7].ToString(),

                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //ELIMINAR
        public int eliminarTerrestre(string placa)
        {
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Terrestre\" WHERE \"Placa\" = '" + placa + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        //MODIFICAR
        public int modificarTerrestre(string placa, int serialMotor, int capacidad, int peso, string descripcion,
            int serialCarroceria, string fechaCreacion, string tipo)
        {
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Terrestre\" SET \"SerialMotor\"='" + serialMotor + "', \"Capacidad\"='" + capacidad + "', " +
                            "\"Peso\"='" + peso + "' ,\"Descripcion\"='" + descripcion + "'," +
                            "\"SerialCarroceria\"='" + serialCarroceria + "', \"FechaCreacion\"= TO_DATE('" + fechaCreacion + "', 'YYYY-MM-DD')," +
                            "\"Tipo\"='" + tipo + "'" +
                            "WHERE \"Placa\"='"+ placa +"'";
           
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
            conn.Close();

            return resp;
        }
        //BUSCAR A UNO
        public Terrestre buscarTerrestre(string placa)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Tipo\"" +
                "FROM \"Terrestre\" WHERE \"Placa\"='"+ placa +"'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Terrestre data = new Terrestre();

            while (dr.Read())
            {
                data.placa = dr[0].ToString();
                data.serialMotor = Int32.Parse(dr[1].ToString());
                data.capacidad = Int32.Parse(dr[2].ToString());
                data.peso = Int32.Parse(dr[3].ToString());
                data.descripcion = dr[4].ToString();
                data.serialCarroceria = Int32.Parse(dr[5].ToString());
                data.fechaCreacion = dr[6].ToString();
                data.tipo = dr[7].ToString();

            }
            dr.Close();
            conn.Close();

            return data;

        }
    }
}