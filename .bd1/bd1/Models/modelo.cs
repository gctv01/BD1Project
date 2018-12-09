using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bd1.Models
{
    public class ModeloRegistro
    {
        public int Cedula { get; set; }
        public string Usuario { get; set; }
        public int Edad { get; set; }
        public string Genero { get; set; }
        public int Contrasena { get; set; }
    }

    public class ModeloLogIn
    {

        public string Usuario { get; set; }
        public int Contrasena { get; set; }
    }
}