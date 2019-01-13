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
        public string modelo { get; set; }
        //PARA REPORTES
        public int codMantenimiento { get; set; }
        public string tipo { get; set; }
        public string nombreTaller { get; set; }
        public string duracion { get; set; }
    }
    public class DAOVehiculo : DAO
    {
        private static DAOVehiculo c = null;

        public static DAOVehiculo getInstance()
        {
            if (DAOVehiculo.c != null)
            {
                return c;
            }
            else
            {
                c = new DAOVehiculo();
                return c;
            }
        }
        //BUSCAR A UNO PARA DETALLE DE LOS ENVIOS
        //Terrestre
        public Vehiculo buscarDetalleTerrestre(string placa)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Placa\", \"SerialMotor\", \"Capacidad\", \"Peso\", \"Descripcion\", " +
                        "\"SerialCarroceria\", to_char(\"FechaCreacion\", 'DD-MM-YYYY'), ma.\"Nombre\"||', '|| mo.\"Nombre\"  " +
                        "FROM \"Terrestre\" t, \"Modelo\" mo, \"Marca\" ma " +
                        "WHERE \"Placa\"='" + placa + "' and \"FK-ModeloT\"=mo.\"COD\" and mo.\"FK-MarcaM\"=ma.\"COD\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Vehiculo data = new Vehiculo();

            while (dr.Read())
            {
                data.placa = dr[0].ToString();
                data.serialMotor = Int32.Parse(dr[1].ToString());
                data.capacidad = Int32.Parse(dr[2].ToString());
                data.peso = Int32.Parse(dr[3].ToString());
                data.descripcion = dr[4].ToString();
                data.serialCarroceria = Int32.Parse(dr[5].ToString());
                data.fechaCreacion = dr[6].ToString();
                data.modelo = dr[7].ToString();
            }
            dr.Close();
            conn.Close();
            return data;
        }
        //Barco
        public Vehiculo buscarDetalleBarco(string placa)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Placa\", \"SerialMotor\", \"Capacidad\", \"Peso\", \"Descripcion\", " +
                        "\"SerialCarroceria\", to_char(\"FechaCreacion\", 'DD-MM-YYYY'), ma.\"Nombre\"||', '|| mo.\"Nombre\"  " +
                        "FROM \"Barco\" t, \"Modelo\" mo, \"Marca\" ma " +
                        "WHERE \"Placa\"='" + placa + "' and \"FK-ModeloB\"=mo.\"COD\" and mo.\"FK-MarcaM\"=ma.\"COD\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Vehiculo data = new Vehiculo();

            while (dr.Read())
            {
                data.placa = dr[0].ToString();
                data.serialMotor = Int32.Parse(dr[1].ToString());
                data.capacidad = Int32.Parse(dr[2].ToString());
                data.peso = Int32.Parse(dr[3].ToString());
                data.descripcion = dr[4].ToString();
                data.serialCarroceria = Int32.Parse(dr[5].ToString());
                data.fechaCreacion = dr[6].ToString();
                data.modelo = dr[7].ToString();
            }
            dr.Close();
            conn.Close();
            return data;
        }
        //Avion
        public Vehiculo buscarDetalleAvion(string placa)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Placa\", \"SerialMotor\", \"Capacidad\", \"Peso\", \"Descripcion\", " +
                        "\"SerialCarroceria\", to_char(\"FechaCreacion\", 'DD-MM-YYYY'), ma.\"Nombre\"||', '|| mo.\"Nombre\"  " +
                        "FROM \"Avion\" t, \"Modelo\" mo, \"Marca\" ma " +
                        "WHERE \"Placa\"='" + placa + "' and \"FK-ModeloA\"=mo.\"COD\" and mo.\"FK-MarcaM\"=ma.\"COD\"";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Vehiculo data = new Vehiculo();

            while (dr.Read())
            {
                data.placa = dr[0].ToString();
                data.serialMotor = Int32.Parse(dr[1].ToString());
                data.capacidad = Int32.Parse(dr[2].ToString());
                data.peso = Int32.Parse(dr[3].ToString());
                data.descripcion = dr[4].ToString();
                data.serialCarroceria = Int32.Parse(dr[5].ToString());
                data.fechaCreacion = dr[6].ToString();
                data.modelo = dr[7].ToString();
            }
            dr.Close();
            conn.Close();
            return data;
        }
        //REPORTE 13 DE LOS REQUERIMIENTOS
        public List<Vehiculo> obtenerReporte13R()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select m.\"COD\",t.\"Nombre\", \"PlacaB\" as Placa, \"Descripcion\", " +
                "('Desde ' ||to_char(\"FechaIni\", 'DD-MM-YYYY')||' hasta '||to_char(\"FechaFinal\", 'DD-MM-YYYY')) as Duracion, 'Barco' as tipo " +
                "From \"Mantenimiento\" m, \"Taller\" t " +
                "Where \"PlacaB\" is not null and t.\"COD\"=\"CODTaller\" " +
                "Union " +
                "Select m.\"COD\",t.\"Nombre\", \"PlacaA\" as Placa, \"Descripcion\", " +
                "('Desde ' ||to_char(\"FechaIni\", 'DD-MM-YYYY')||' hasta '||to_char(\"FechaFinal\", 'DD-MM-YYYY')) as Duracion, 'Avion' as tipo  " +
                "From \"Mantenimiento\" m, \"Taller\" t " +
                "Where \"PlacaA\" is not null and t.\"COD\"=\"CODTaller\" " +
                "Union " +
                "Select m.\"COD\",t.\"Nombre\", \"PlacaT\" as Placa, \"Descripcion\", " +
                "('Desde ' ||to_char(\"FechaIni\", 'DD-MM-YYYY')||' hasta '||to_char(\"FechaFinal\", 'DD-MM-YYYY')) as Duracion, 'Terrestre' as tipo  " +
                "From \"Mantenimiento\" m, \"Taller\" t " +
                "Where \"PlacaT\" is not null and t.\"COD\"=\"CODTaller\" " +
                "order by tipo, Placa ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Vehiculo> data = new List<Vehiculo>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Vehiculo()
                {
                    codMantenimiento = Int32.Parse(dr[0].ToString()),
                    nombreTaller = dr[1].ToString(),
                    placa = dr[2].ToString(),
                    descripcion = dr[3].ToString(),
                    duracion = dr[4].ToString(),
                    tipo = dr[5].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 2 DE LOS ENUNCIADOS
        public List<Vehiculo> obtenerReporte2E()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select \"Placa\" as Placa, ma.\"Nombre\"||', '||mo.\"Nombre\", to_char(\"FechaCreacion\",'DD-MM-YYYY'), " +
                "'Barco' as tipo " +
                "From \"Barco\", \"Marca\" ma, \"Modelo\" mo " +
                "where \"FK-ModeloB\"=mo.\"COD\" and mo.\"FK-MarcaM\"=ma.\"COD\" " +
                "Union " +
                "Select \"Placa\" as Placa, ma.\"Nombre\"||', '||mo.\"Nombre\", to_char(\"FechaCreacion\",'DD-MM-YYYY'), " +
                "'Avion' as tipo " +
                "From \"Avion\", \"Marca\" ma, \"Modelo\" mo " +
                "where \"FK-ModeloA\"=mo.\"COD\" and mo.\"FK-MarcaM\"=ma.\"COD\" " +
                "Union " +
                "Select \"Placa\" as Placa, ma.\"Nombre\"||', '||mo.\"Nombre\", to_char(\"FechaCreacion\",'DD-MM-YYYY'), " +
                "'Terrestre' as tipo " +
                "From \"Terrestre\", \"Marca\" ma, \"Modelo\" mo " +
                "where \"FK-ModeloT\"=mo.\"COD\" and mo.\"FK-MarcaM\"=ma.\"COD\" " +
                "order by tipo, Placa ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Vehiculo> data = new List<Vehiculo>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Vehiculo()
                {
                    placa = dr[0].ToString(),
                    modelo = dr[1].ToString(),
                    fechaCreacion = dr[2].ToString(),
                    tipo = dr[3].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 6 DE LOS ENUNCIADOS
        public List<Vehiculo> obtenerReporte6E()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select Count(vr.\"PlacaB\") as cant_usado, 'Barco' as tipo " +
                "from \"Veh-Rut\" vr, \"Traslado\" t, \"Envio\" e " +
                "where vr.\"COD\"=t.\"CODVeh-Rut\" and t.\"CODEnvio\"=e.\"COD\" " +
                "group by tipo " +
                "Union " +
                "Select Count(vr.\"PlacaA\") as cant_usado, 'Avion' as tipo " +
                "from \"Veh-Rut\" vr, \"Traslado\" t, \"Envio\" e " +
                "where vr.\"COD\"=t.\"CODVeh-Rut\" and t.\"CODEnvio\"=e.\"COD\" " +
                "group by tipo " +
                "Union " +
                "Select Count(vr.\"PlacaT\") as cant_usado, 'Terrestre' as tipo " +
                "from \"Veh-Rut\" vr, \"Traslado\" t, \"Envio\" e " +
                "where vr.\"COD\"=t.\"CODVeh-Rut\" and t.\"CODEnvio\"=e.\"COD\" " +
                "group by tipo " +
                "order by cant_usado DESC " +
                "limit 1 ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Vehiculo> data = new List<Vehiculo>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Vehiculo()
                {
                    duracion = dr[0].ToString(),
                    tipo = dr[1].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //REPORTE 7 DE LOS ENUNCIADOS
        public List<Vehiculo> obtenerReporte7E(string fecha1, string fecha2)
        {
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "Select ((x.cant_usado*100)/x.envios) as porcentaje, x.tipo  " +
                "from(Select Count(vr.\"PlacaB\") as cant_usado, COUNT(t.*) as envios, 'Barco' as tipo " +
                    "from \"Veh-Rut\" vr, \"Traslado\" t, \"Envio\" e " +
                    "where vr.\"COD\"=t.\"CODVeh-Rut\" and t.\"CODEnvio\"=e.\"COD\" and " +
                    "e.\"FechaInicio\" between '"+ fecha1 + "' and '" + fecha2 + "' " +
                    "group by tipo) x " +
                    "Union " +
                    "Select((x.cant_usado * 100) / x.envios) as porcentaje, x.tipo " +
                    "from(Select Count(vr.\"PlacaA\") as cant_usado, COUNT(t.*) as envios, 'Avion' as tipo " +
                    "from \"Veh-Rut\" vr, \"Traslado\" t, \"Envio\" e  " +
                    "where vr.\"COD\"=t.\"CODVeh-Rut\" and t.\"CODEnvio\"=e.\"COD\" and " +
                    "e.\"FechaInicio\" between '" + fecha1 + "' and '" + fecha2 + "' " +
                    "group by tipo) x " +
                    "Union " +
                    "Select((x.cant_usado * 100) / x.envios) as porcentaje, x.tipo " +
                    "from(Select Count(vr.\"PlacaT\") as cant_usado, COUNT(t.*) as envios, 'Terrestre' as tipo " +
                    "from \"Veh-Rut\" vr, \"Traslado\" t, \"Envio\" e " +
                    "where vr.\"COD\"=t.\"CODVeh-Rut\" and t.\"CODEnvio\"=e.\"COD\" and " +
                    "e.\"FechaInicio\" between '" + fecha1 + "' and '" + fecha2 + "' " +
                    "group by tipo) x " +
                    "order by porcentaje ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Vehiculo> data = new List<Vehiculo>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Vehiculo()
                {
                    duracion = dr[0].ToString(),
                    tipo = dr[1].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
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
            int serialCarroceria, string fechaCreacion, string nombre, int fkModelo, int fkPuerto)
        {
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Barco\" (\"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Nombre\", " +
                "\"FK-ModeloB\", \"FK-PuertoB\" ) " +
                "VALUES ('" + placa + "','" + serialMotor + "','" + capacidad + "','" + peso + "'," +
                "'" + descripcion + "','" + serialCarroceria + "',TO_DATE('" + fechaCreacion + "', 'YYYY-MM-DD'), '" + nombre + "', " +
                ""+ fkModelo +", "+ fkPuerto +")";
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
        public List<Barco> obtenerBarcos()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\", \"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", b.\"Nombre\", mo.\"Nombre\"||', '||ma.\"Nombre\" " +
                "FROM \"Barco\" b, \"Modelo\" mo, \"Marca\" ma " +
                "WHERE b.\"FK-ModeloB\"=mo.\"COD\" and mo.\"FK-MarcaM\"=ma.\"COD\" ";
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
                    modelo = dr[8].ToString(),

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
            int serialCarroceria, string fechaCreacion, string nombre, int fkModelo, int fkPuerto)
        {
            NpgsqlConnection conn = OficinaDAO.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Barco\" SET \"SerialMotor\"='" + serialMotor + "', \"Capacidad\"='" + capacidad + "', " +
                            "\"Peso\"='" + peso + "' ,\"Descripcion\"='" + descripcion + "'," +
                            "\"SerialCarroceria\"='" + serialCarroceria + "', \"FechaCreacion\"= TO_DATE('" + fechaCreacion + "', 'YYYY-MM-DD')," +
                            "\"Nombre\"='" + nombre + "', \"FK-ModeloB\" = "+ fkModelo +", \"FK-PuertoB\" = "+ fkPuerto +" " +
                            "WHERE \"Placa\"='" + placa + "'";

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
    public class DAOAvion : DAO
    {
        private static DAOAvion c = null;

        public static DAOAvion getInstance()
        {
            if (DAOAvion.c != null)
            {
                return c;
            }
            else
            {
                c = new DAOAvion();
                return c;
            }
        }
        public int insertarAvion(string placa, int serialMotor, int capacidad, int peso, string descripcion,
            int serialCarroceria, string fechaCreacion, int longitud, int pesoVacio, int envergadura, 
            int pesoMax, int altura, int anchoCabina, int capacidadCombustible, int carreraDespegue, int diametroFuselaje, 
            int fkModelo, int fkAeropuerto)
        {
            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Avion\" (\"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Longitud\"," +
                "\"PesoVacio\",\"Envergadura\",\"PesoMax\",\"Altura\", \"AnchoCabina\",\"CapacidadCombustible\"," +
                "\"CarreraDespegue\", \"DiametroFuselaje\", \"FK-ModeloA\",\"FK-Aeropuerto\") " +
                "VALUES ('" + placa + "','" + serialMotor + "','" + capacidad + "','" + peso + "'," +
                "'" + descripcion + "','" + serialCarroceria + "',TO_DATE('" + fechaCreacion + "', 'YYYY-MM-DD'), " +
                "'" + longitud + "','" + pesoVacio + "', '" + envergadura + "', '" + pesoMax + "'," +
                "'" + altura + "','" + anchoCabina + "','" + capacidadCombustible + "','" + carreraDespegue + "'," +
                "'" + diametroFuselaje + "', " + fkModelo + ", " + fkAeropuerto + ")";
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
        public List<Avion> obtenerAviones()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Longitud\"," +
                "\"PesoVacio\",\"Envergadura\",\"PesoMax\",\"Altura\", \"AnchoCabina\",\"CapacidadCombustible\"," +
                "\"CarreraDespegue\", \"DiametroFuselaje\", mo.\"Nombre\"||', '||ma.\"Nombre\"  " +
                "FROM \"Avion\" a, \"Modelo\" mo, \"Marca\" ma " +
                "WHERE a.\"FK-ModeloA\"=mo.\"COD\" and mo.\"FK-MarcaM\"=ma.\"COD\" ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            List<Avion> data = new List<Avion>();

            while (dr.Read())
            {
                System.Diagnostics.Debug.WriteLine("connection established");
                data.Add(new Avion()
                {
                    placa = dr[0].ToString(),
                    serialMotor = Int32.Parse(dr[1].ToString()),
                    capacidad = Int32.Parse(dr[2].ToString()),
                    peso = Int32.Parse(dr[3].ToString()),
                    descripcion = dr[4].ToString(),
                    serialCarroceria = Int32.Parse(dr[5].ToString()),
                    fechaCreacion = dr[6].ToString(),
                    longitud = Int32.Parse(dr[7].ToString()),
                    pesoVacio = Int32.Parse(dr[8].ToString()),
                    envergadura = Int32.Parse(dr[9].ToString()),
                    pesoMax = Int32.Parse(dr[10].ToString()),
                    altura = Int32.Parse(dr[11].ToString()),
                    anchoCabina = Int32.Parse(dr[12].ToString()),
                    capacidadCombustible = Int32.Parse(dr[13].ToString()),
                    carreraDespegue = Int32.Parse(dr[14].ToString()),
                    diametroFuselaje = Int32.Parse(dr[15].ToString()),
                    modelo = dr[16].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //ELIMINAR Avion
        public int eliminarAvion(string placa)
        {
            NpgsqlConnection conn = DAOAvion.getInstanceDAO();
            conn.Open();

            String sql = "DELETE FROM \"Avion\" WHERE \"Placa\" = '" + placa + "'";
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
        //MODIFICAR Avion
        public int modificarAvion(string placa, int serialMotor, int capacidad, int peso, string descripcion,
            int serialCarroceria, string fechaCreacion, int longitud, int pesoVacio, int envergadura,
            int pesoMax, int altura, int anchoCabina, int capacidadCombustible, int carreraDespegue, int diametroFuselaje, 
            int fkModelo, int fkAeropuerto)
        {
            NpgsqlConnection conn = DAOAvion.getInstanceDAO();
            conn.Open();

            String sql = "UPDATE \"Avion\" SET \"SerialMotor\"='" + serialMotor + "', \"Capacidad\"='" + capacidad + "', " +
            "\"Peso\"='" + peso + "' ,\"Descripcion\"='" + descripcion + "'," +
            "\"SerialCarroceria\"='" + serialCarroceria + "', \"FechaCreacion\"= TO_DATE('" + fechaCreacion + "', 'YYYY-MM-DD')," +
            "\"Longitud\"='" + longitud + "',\"PesoVacio\"='" + pesoVacio + "'," +
            "\"Envergadura\"='" + envergadura + "',\"PesoMax\"='" + pesoMax + "'," +
            "\"CapacidadCombustible\"='" + capacidadCombustible + "',\"CarreraDespegue\"='" + carreraDespegue + "'," +
            "\"DiametroFuselaje\"='" + diametroFuselaje + "', \"FK-ModeloA\"=" + fkModelo + ", " +
            "\"FK-Aeropuerto\"=" + fkAeropuerto + " " +
            "WHERE \"Placa\"='" + placa + "'";

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
        //BUSCAR A UNO Avion
        public Avion buscarAvion(string placa)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Longitud\"," +
                "\"PesoVacio\",\"Envergadura\",\"PesoMax\",\"Altura\", \"AnchoCabina\",\"CapacidadCombustible\"," +
                "\"CarreraDespegue\", \"DiametroFuselaje\" " +
                "FROM \"Avion\" WHERE \"Placa\"='" + placa + "'";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlDataReader dr = cmd.ExecuteReader();

            Avion data = new Avion();

            while (dr.Read())
            {
                data.placa = dr[0].ToString();
                data.serialMotor = Int32.Parse(dr[1].ToString());
                data.capacidad = Int32.Parse(dr[2].ToString());
                data.peso = Int32.Parse(dr[3].ToString());
                data.descripcion = dr[4].ToString();
                data.serialCarroceria = Int32.Parse(dr[5].ToString());
                data.fechaCreacion = dr[6].ToString();
                data.longitud = Int32.Parse(dr[7].ToString());
                data.pesoVacio = Int32.Parse(dr[8].ToString());
                data.envergadura = Int32.Parse(dr[9].ToString());
                data.pesoMax = Int32.Parse(dr[10].ToString());
                data.altura = Int32.Parse(dr[11].ToString());
                data.anchoCabina = Int32.Parse(dr[12].ToString());
                data.capacidadCombustible = Int32.Parse(dr[13].ToString());
                data.carreraDespegue = Int32.Parse(dr[14].ToString());
                data.diametroFuselaje = Int32.Parse(dr[15].ToString());


            }
            dr.Close();
            conn.Close();

            return data;

        }
    }
    //VEHICULOS TERRESTRES
    public class Terrestre : Vehiculo
    {
        public string tipoT { get; set; }
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
            int serialCarroceria, string fechaCreacion, string tipo, int fkSucursal, int fkModelo)
        {
            NpgsqlConnection conn = DAOTerrestre.getInstanceDAO();
            conn.Open();

            String sql = "INSERT INTO \"Terrestre\" (\"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Tipo\", " +
                " \"FK-SucursalT\", \"FK-ModeloT\") " +
                "VALUES ('" + placa +"','" + serialMotor + "','" + capacidad + "','" + peso + "'," +
                "'" + descripcion + "','" + serialCarroceria + "',TO_DATE('" + fechaCreacion + "', 'YYYY-MM-DD'), '" + tipo + "'," +
                " " + fkSucursal + ", " + fkModelo + ")";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            try
            {
                int resp = cmd.ExecuteNonQuery(); //CONTROLAR EXCEPTION DE UNIQUE
                conn.Close();
                return resp;
            }
            catch(Exception e)
            {
                conn.Close();
                return 0;
            }
        }
        public List<Terrestre> obtenerTerrestres()
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Tipo\", mo.\"Nombre\"||', '||ma.\"Nombre\" " +
                "FROM \"Terrestre\" a, \"Modelo\" mo, \"Marca\" ma " +
                "WHERE a.\"FK-ModeloT\"=mo.\"COD\" and mo.\"FK-MarcaM\"=ma.\"COD\" ";
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
                    tipoT = dr[7].ToString(),
                    modelo = dr[8].ToString(),
                });
            }
            dr.Close();
            conn.Close();

            return data;
        }
        //PARA ENVIOS
        public List<Terrestre> obtenerTerrestresEnvio(int fkS)
        {

            NpgsqlConnection conn = DAO.getInstanceDAO();
            conn.Open();
            string sql = "SELECT \"Placa\", \"SerialMotor\", \"Capacidad\", " +
                "\"Peso\" ,\"Descripcion\", \"SerialCarroceria\", \"FechaCreacion\", \"Tipo\", mo.\"Nombre\"||', '||ma.\"Nombre\" " +
                "FROM \"Terrestre\" a, \"Modelo\" mo, \"Marca\" ma " +
                "WHERE a.\"FK-ModeloT\"=mo.\"COD\" and mo.\"FK-MarcaM\"=ma.\"COD\" and \"FK-SucursalT\"="+ fkS +" ";
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
                    tipoT = dr[7].ToString(),
                    modelo = dr[8].ToString(),
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
        //BUSCAR A UNO Terrestre
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
                data.tipoT = dr[7].ToString();

            }
            dr.Close();
            conn.Close();

            return data;

        }        
    }
}