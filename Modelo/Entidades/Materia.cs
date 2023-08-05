using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entidades
{
    [Table("Materia")]
    public class Materia
    {
        [Key]
        [Column("MateriaId")]
        public int Id { get; set; }
        public string Nombre { get; set; }



    }
}
