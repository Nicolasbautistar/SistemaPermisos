using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.Internal;
using Sistema_de_Permisos.Models;
using Dapper;
using System;
using System.Reflection.Metadata;

namespace Sistema_de_Permisos.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PermisosController : ControllerBase
    {
        private readonly Sistema_de_PermisosContext dbConection;
        public PermisosController(Sistema_de_PermisosContext _context) 
        {
            dbConection = _context; 
        }
        [HttpPost]
        [Route("PruebaProcedimiento")]
        public IActionResult PruebaProcedimiento(string CadenaEntrada)
        {
            try
            {
                var Prueba = new SqlParameter("@Nombre", CadenaEntrada);
                //var result = dbConection.ResponseSp.FromSqlRaw("EXEC spPrueba").FirstOrDefault();
                var result = dbConection.Set<string>().FromSqlRaw("EXEC spPrueba").FirstOrDefault();
                
                //var result = dbConection.Set<string>().FromSqlRaw("EXEC spPrueba").FirstOrDefault();
                //var result = dbConection.Set<string>().FromSqlRaw("EXEC spPrueba @Nombre", Prueba).FirstOrDefault();
                return StatusCode(StatusCodes.Status200OK, new { mensaje = result });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetCompanyList")]
        public IActionResult GetCompanyList()
        {
            try
            {
                List<Company> ListCompany = dbConection.Companies.ToList();
                return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok", Response = ListCompany });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status200OK, new { mensaje = ex.Message });
            }
        }
    }
}
