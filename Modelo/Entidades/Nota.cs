using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Schema;

namespace Models.Entidades
{
    [Table("Nota")]
    public class Nota
    {
        [Key]
        public int NotaId { get; set; }
        public int AlumnoId { get; set; }
        [ForeignKey("AlumnoId")]
        public Alumno Alumno { get; set; }
        public int MateriaId { get; set; }
        [ForeignKey("MateriaId")]
        public Materia Materia { get; set; }

        [Column("Nota")]
        public decimal Notas { get; set; }
    }
}
