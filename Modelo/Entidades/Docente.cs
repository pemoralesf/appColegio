using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entidades
{
    [Table("Docentes")]
    public  class Docente
    {
        [Key]
        [Column("DocenteId")]
        public int DocenteId  { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public  DateTime FchNacimiento  { get; set; }

    }
}
