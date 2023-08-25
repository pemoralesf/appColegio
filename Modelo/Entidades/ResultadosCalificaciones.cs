using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entidades
{
    public  class ResultadosCalificaciones
    {
        public string nombre  { get; set; }
        public string direccion { get; set; }
        public DateTime FchNacimiento { get; set; }
        public string materia { get; set; }
        public decimal nota { get; set; }
        public string Resultado { get; set; }


    }
}
