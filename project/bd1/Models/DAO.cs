using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;

namespace bd1.Models
{
    public class DAO
    {
        public const string connString = "Server=localhost;Port=5432;" +
                    "User Id=postgres;Password=123;Database=LogUcab;";

        private static NpgsqlConnection connS = null;

        public static NpgsqlConnection getInstanceDAO()
        {
            if (DAO.connS != null)
            {
                return connS;
            }
            else
            {
                connS = new NpgsqlConnection(connString);
                return connS;
            }
        }
    }
}
