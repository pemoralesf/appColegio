using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entidades
{
    [Table("AlumnoMateria")]
    public  class AlumnoMateria
    {
        [Key]
        [Column("AlumnoMatId")]
        public int AlumnoMatId { get; set; }

        public int AlumnoId { get; set; }
        [ForeignKey("AlumnoId")]
        public Alumno Alumno { get; set; }

       
        public int MateriaId { get; set; }
        [ForeignKey("MateriaId")]
        public Materia Materia { get; set; }
    }
}
