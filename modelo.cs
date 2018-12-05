using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace bd1.Models
{
    public class ModeloRegistro
    {
        [Required]
        public string Cedula { get; set; }
        public string Usuario { get; set; }
        public string CedulaIdentidad { get; set; }
        public string Correoelectronico { get; set; }
        public int Telefono { get; set; }
        public int Contrasena { get; set; }
        public int ContrasenaConfirmar { get; set; }
    }

    public class ModeloLogIn
    {
        [Required]
        public string Usuario { get; set; }
        [Required]
        public int Contrasena { get; set; }
    }
    public class ModeloPaquete
    {
        public string Tipo;
        public string Nombre;
        public int Peso;
        public string Destino;
    }
}