using Microsoft.AspNetCore.Mvc;
using Sistema_de_Permisos.Models;
using Sistema_de_Permisos.Conector.Datos;
using Dapper;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using System.Data;

namespace Sistema_de_Permisos.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PermisosController : ControllerBase
    {        
        [HttpGet]
        [Route("CrearTablas")]
        public IActionResult CrearTablas()
        {
            try
            {
                using (var db = Conexion.Instancia().GetConnection())
                {
                    db.Open();
                    string sql = "EXEC spCrearTablas";
                    string? resultado = db.Query<string>(sql).FirstOrDefault();
                    // Obtener el valor de salida
                    return StatusCode(StatusCodes.Status200OK, new { mensaje = resultado });
                } 
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { mensaje = ex.Message });
            }
        }

        [HttpGet]
        [Route("EliminarTablas")]
        public IActionResult EliminarTablas()
        {
            try
            {
                using (var db = Conexion.Instancia().GetConnection())
                {
                    db.Open();
                    string sql = "EXEC spEliminarTablas";
                    string? resultado = db.Query<string>(sql).FirstOrDefault();
                    // Obtener el valor de salida
                    return StatusCode(StatusCodes.Status200OK, new { mensaje = resultado });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { mensaje = ex.Message });
            }
        }

        [HttpGet]
        [Route("InsertarRegistros")]
        public IActionResult InsertarRegistros()
        {
            try
            {
                using (var db = Conexion.Instancia().GetConnection())
                {
                    db.Open();
                    string sql = "EXEC spInsertarRegistros";
                    string? resultado = db.Query<string>(sql).FirstOrDefault();
                    // Obtener el valor de salida
                    return StatusCode(StatusCodes.Status200OK, new { mensaje = resultado });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { mensaje = ex.Message });
            }
        }

        [HttpPost]
        [Route("ObtenerPermisosDeUsuario")]
        public IActionResult ObtenerPermisosDeUsuario(int Entidad, long UsuarioId)
        {
            try
            {
                using (var db = Conexion.Instancia().GetConnection())
                {
                    db.Open();
                    var Parametros = new DynamicParameters();
                    Parametros.Add("@Entidad", Entidad);
                    Parametros.Add("@UsuarioId", UsuarioId);
                    string sql = "EXEC spGetUserPermission @EntityCatalogID = @Entidad, @UserID = @UsuarioId ";
                    List<dynamic> resultado = db.Query<dynamic>(sql, Parametros).ToList();
                    // Obtener el valor de salida
                    return StatusCode(StatusCodes.Status200OK, new { mensaje = resultado });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { mensaje = ex.Message });
            }
        }

        [HttpGet]
        [Route("ObtenerUsuarios")]
        public IActionResult ObtenerUsuarios()
        {
            try
            {
                using (var db = Conexion.Instancia().GetConnection())
                {
                    db.Open();

                    string sql = "SELECT id_user [ID], user_username [Nombre Usuario] FROM [User]  ";
                    List<dynamic> resultado = db.Query<dynamic>(sql).ToList();
                    // Obtener el valor de salida
                    return StatusCode(StatusCodes.Status200OK, new { mensaje = resultado });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { mensaje = ex.Message });
            }
        }
        [HttpGet]
        [Route("ObtenerEntidades")]
        public IActionResult ObtenerEntidades()
        {
            try
            {
                using (var db = Conexion.Instancia().GetConnection())
                {
                    db.Open();

                    string sql = "select id_entit [Id Entidad], entit_name [Nombre Entidad], entit_descrip [Descripción] from EntityCatalog";
                    List<dynamic> resultado = db.Query<dynamic>(sql).ToList();
                    // Obtener el valor de salida
                    return StatusCode(StatusCodes.Status200OK, new { mensaje = resultado });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { mensaje = ex.Message });
            }
        }
    }
}
