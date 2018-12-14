using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class Horario
    {
        public int cod { get; set; }
        public string horarioInicio { get; set; }
        public string horarioIFin { get; set; }
    }
    public class DAOHorario : DAO
    {
        private static DAOHorario c = null;

        public static DAOHorario getInstance()
        {
            if (DAOHorario.c != null)
            {
                return c;
            }
            else
            {
                c = new DAOHorario();
                return c;
            }
        }
        //MOSTRAR
        public List<Horario> obtenerHorarios()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"COD\", \"HorarioInicio\", \"HorarioFin\" " +
                "FROM \"Horario\"" +
                "Order by \"COD\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Horario> data = new List<Horario>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Horario()
                {
                    cod = Int32.Parse(dr[0].ToString()),
                    horarioInicio = dr[1].ToString(),
                    horarioIFin = dr[2].ToString(),


                });
            }
            dr.Close();
            conn.Close();
            return data;

        }
        ////INSERTAR
        //public int insertarOficina(string nombre, int capacidad, string correo, int almacenamiento, int lugar)
        //{
        //    NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
        //    conn.Open();

        //    String sql = "INSERT INTO \"Sucursal\" (\"COD\", \"Nombre\", \"Capacidad\", \"Correo\" ,\"Almacenamiento\", \"FK-LugarS\") " +
        //        "VALUES ((SELECT NEXTVAL('seq')),'" + nombre + "','" + capacidad + "','" + correo + "','" + almacenamiento + "', " +
        //        "'" + lugar + "')";
        //    NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
        //    try
        //    {
        //        int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
        //        conn.Close();
        //        return resp;
        //    }
        //    catch (Exception e)
        //    {
        //        System.Diagnostics.Debug.WriteLine(e.ToString());
        //        conn.Close();
        //        return 0;
        //    }
        //}
        //BUSCAR A UNO
        public Horario buscarHorario(int cod)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"COD\", \"HorarioInicio\", \"HorarioFinal\"  FROM \"Horario\"" +
                "WHERE \"COD\" = " + cod + "";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Horario data = new Horario();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.cod = Int32.Parse(dr[0].ToString());
                data.horarioInicio = dr[1].ToString();
                data.horarioIFin = dr[3].ToString();
            }
            dr.Close();
            conn.Close();

            return data;

        }
        ////ELIMINAR
        //public int eliminarOficina(int cod)
        //{
        //    NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
        //    conn.Open();

        //    String sql = "DELETE FROM \"Sucursal\" WHERE \"COD\" = " + cod + "";
        //    NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
        //    int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
        //    conn.Close();

        //    return resp;
        //}
        ////MODIFICAR
        //public int modificarOficina(int cod, string nombre, int capacidad, string correo, int almacenamiento, int lugar)
        //{
        //    NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
        //    conn.Open();

        //    String sql = "UPDATE \"Sucursal\" SET \"Nombre\"='" + nombre + "', \"Capacidad\"='" + capacidad + "', " +
        //                    "\"Correo\"='" + correo + "' ,\"Almacenamiento\"='" + almacenamiento + "' " +
        //                    "\"FK-LugarS\"='" + lugar + "'" +
        //                    "WHERE \"COD\"= " + cod + "";

        //    NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
        //    try
        //    {
        //        int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
        //        conn.Close();
        //        return resp;
        //    }
        //    catch
        //    {
        //        conn.Close();
        //        return 0;
        //    }
        //}
    }
}