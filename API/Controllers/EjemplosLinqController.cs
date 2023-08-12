using Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Models.Dtos;
using Models.Entidades;
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

    }
}
