using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entidades
{
    [Table("Alumno")]
    public class Alumno
    {
        [Key]
        [Column("AlumnoId")]
        public int  Id { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public DateTime FchNacimiento { get; set; }
        public decimal Nota { get; set; }
        public int MateriaId { get; set; }

        [ForeignKey("MateriaId")]
        public Materia Materia { get; set; }

    }
}
