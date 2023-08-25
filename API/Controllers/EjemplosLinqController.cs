using Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic;
using Models.Dtos;
using Models.Entidades;
using Models.Especificaciones;
using System.Net.WebSockets;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EjemplosLinqController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public EjemplosLinqController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet("GetAlumnosQuery")]
        public async Task<ActionResult<IEnumerable<Alumno>>> GetAlumnosQuery()
        { 
            var lista = await (from p in _context.Alumnos.Include(p=> p.Materia)
                               select p).ToListAsync();
            return Ok(lista);
        }

        [HttpGet("GetAlumnosMathod")]
        public async Task<ActionResult<IEnumerable<Alumno>>> GetAlumnosMathod()
        {
            var lista = await _context.Alumnos.Include(p=>p.Materia).ToListAsync();

            return Ok(lista);
        }



        [HttpGet("GetAlumnosPorNombreQuery")]
        public async Task<ActionResult<IEnumerable<Alumno>>> GetAlumnosPorNombreQuery(string nombre)
        {
            var lista = await (from q in _context.Alumnos.Include(q => q.Materia)
                               where q.Nombre == nombre
                               select q).ToListAsync();
            return Ok(lista);
        }

        [HttpGet("GetAlumnosPorNombreMathod")]
        public async Task<ActionResult<IEnumerable<Alumno>>> GetAlumnosPorNombreMathod(string nombre)
        {
            var lista = await _context.Alumnos.Include(r => r.Materia)
                         .Where(r => r.Nombre==nombre)
                        .ToListAsync();

            return Ok(lista);
        }


        [HttpGet("GetAlumnosPorLikeQuery")]
        public async Task<ActionResult<IEnumerable<Alumno>>> GetAlumnosPorLikeQuery(string filtro)
        {
            var lista = await (from q in _context.Alumnos.Include(q => q.Materia)
                               where q.Nombre.Contains(filtro)
                               select q).ToListAsync();
            return Ok(lista);
        }

        [HttpGet("GetAlumnosPorLikeMathod")]
        public async Task<ActionResult<IEnumerable<Alumno>>> GetAlumnosPorLikeMathod(string filtro)
        {
            var lista = await _context.Alumnos.Include(r => r.Materia)
                        .Where(r => r.Nombre.Contains(filtro))
                        .ToListAsync();

            return Ok(lista);
        }



        [HttpGet("GetAlumnosRelacionandoQuery")]
        public async Task<ActionResult<IEnumerable<Models.Entidades.Alumno>>> GetAlumnosRelacionandoQuery()
        {

            var lista = await (from m in _context.Alumnos.Include(m => m.Materia)
                               orderby m.Nombre, m.MateriaId
                               select new AlumnoDto
                               { Nombre = m.Nombre, nombres = m.Materia.Nombre, Direccion = m.Direccion })
                               .ToListAsync();
            return Ok(lista);
        }


        [HttpGet("GetAlumnosRelacionandoOrderByMethod")]
        public async Task<ActionResult<IEnumerable<Models.Entidades.Alumno>>> GetAlumnosRelacionandoOrderByMethod()
        {

            var lista = await _context.Alumnos.Include(m => m.Materia)
               .OrderBy(m => m.Nombre)
               .OrderBy(m => m.Direccion)
               .Select(m => new AlumnoDto { Nombre = m.Nombre, nombres = m.Materia.Nombre, Direccion = m.Direccion })
               .ToListAsync();
            return Ok(lista);
        }

        //  Tercera  Semana
        

        [HttpGet("GetAlumnoUnionQuery")]
        public async Task<ActionResult<IEnumerable<Alumno>>> GetLibrosUnionQuery()
        {
            var lista1 = await (from p in _context.Alumnos.Include(p => p.Materia)
                                where p.Nota > 4
                               select p).ToListAsync();

            var lista2 = await (from p in _context.Alumnos.Include(p => p.Materia)
                                where p.FchNacimiento.Year >= 2011
                               select p).ToListAsync();

            var listaUnion = lista1.Union(lista2);
            return Ok(listaUnion);
        }



        [HttpGet("GetAlumnoUnionMethod")]
        public async Task<ActionResult<IEnumerable<Alumno>>> GetAlumnoUnionMethod()
        {
            var lista1 = await _context.Alumnos.Include(p => p.Materia)
                .Where(p => p.Nota > 4)
                .ToListAsync();

            var lista2 = await _context.Alumnos.Include(p => p.Materia)
                .Where(p=> p.FchNacimiento.Year >= 2011)
                .ToListAsync();

            var listaUnion = lista1.Union(lista2);
            return Ok(listaUnion);
        }
        
        

        [HttpGet("GetAlumnoUnionAllQuery")]
        public async Task<ActionResult<IEnumerable<Alumno>>> GetAlumnoUnionAllQuery()
        {
            var lista1 = await (from p in _context.Alumnos.Include(p => p.Materia)
                                where p.Nota > 4
                                select p).ToListAsync();

            var lista2 = await (from p in _context.Alumnos.Include(p => p.Materia)
                                where p.FchNacimiento.Year >= 2011
                                select p).ToListAsync();

            var listaUnion = lista1.Concat(lista2);
            return Ok(listaUnion);
        }



        [HttpGet("GetAlumnoUnionAllMethod")]
        public async Task<ActionResult<IEnumerable<Alumno>>> GetAlumnoUnionAllMethod()
        {
            var lista1 = await _context.Alumnos.Include(p => p.Materia)
                .Where(p => p.Nota > 4)
                .ToListAsync();

            var lista2 = await _context.Alumnos.Include(p => p.Materia)
                .Where(p => p.FchNacimiento.Year >= 2011)
                .ToListAsync();

            var listaUnion = lista1.Concat(lista2);
            return Ok(listaUnion);
        }

        [HttpGet("GetAlumnosGroupByMaxPorMateriaQuery")]
        public async Task<ActionResult<IEnumerable<Alumno>>> GetAlumnosGroupByMaxPorMateriaQuery()
        {
            var lista = await (from m1 in _context.Alumnos.Include(m1 => m1.Materia)
                               orderby m1.Nombre
                               group m1 by m1.Materia.Nombre into temp
                               select new
                               {
                                   Categoria = temp.Key,
                                   Nota = (from temp1 in temp select temp1.Nota).Max()
                               }
                                ).ToListAsync();

            return Ok(lista);
        }

        [HttpGet("GetAlumnosGroupByMaxPorMateriaMethod")]
        public async Task<ActionResult<IEnumerable<Alumno>>> GetAlumnosGroupByMaxPorMateriaMethod()
        {
            var lista = await _context.Alumnos.Include(m1 => m1.Materia)
                                .GroupBy(m1 => m1.Materia.Nombre)
                                .Select(temp => new
                                {
                                    Categoria = temp.Key,
                                    Nota = temp.Select(temp1 => temp1.Nota).Max()
                                })
                                .ToListAsync();


            return Ok(lista);
        }

        [HttpGet("GetNotasSP")]
        public async Task<ActionResult<IEnumerable<NotasRango>>> GetNotasSP(decimal notaini, decimal notafin)
        {
            var lista = await _context.NotasRango
                                      .FromSqlRaw("NotasRangoAlumnos {0}, {1}", notaini, notafin)
                                      .ToListAsync();
            return Ok(lista);
            
        }

        // 20082023


        [HttpGet("GetCASEResultadosSP_Semana4")]
        public async Task<ActionResult<IEnumerable<ResultadosCalificaciones>>> GetCASEResultadosSP_Semana4(decimal notaini, decimal notafin)
        {
            var lista = await _context.ResultadosCalificaciones
                                      .FromSqlRaw("ResultadosCalificaciones {0}, {1}", notaini, notafin)
                                      .ToListAsync();
            return Ok(lista);

        }



        [HttpPost("AddAlumnosNotaInsertSP_Semana4")]
        public async Task<ActionResult> AddAlumnosNotaInsertSP_Semana4(ParametrosVariables t)
        {
            await _context.Database.ExecuteSqlAsync
            ($"AddAlumnosNota @notaIni= {t.notaini}, @notaFin = {t.notafin}");
            return Ok("Notas Agregadas correctamente");
        }



    }
}
