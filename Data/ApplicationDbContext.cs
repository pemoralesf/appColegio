using Microsoft.EntityFrameworkCore;
using Models.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {


        }

        public DbSet<Materia> Materias { get; set; }
        public DbSet<Alumno> Alumnos { get; set; }
        public DbSet<Docente> Docentes { get; set; }
        public DbSet<AlumnoMateria> AlumnoMaterias { get; set; }
        public DbSet<Nota> Notas { get; set; }
        public DbSet<NotasRango> NotasRango { get; set; }

        public DbSet<ResultadosCalificaciones> ResultadosCalificaciones { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
            modelBuilder.Entity<NotasRango>(a => a.HasNoKey());
            modelBuilder.Entity<ResultadosCalificaciones>(a => a.HasNoKey());
        }

    }
}

