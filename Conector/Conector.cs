using System.Data;
using Microsoft.Data.SqlClient;


namespace Sistema_de_Permisos.Conector
{ 
    namespace Datos
    {
        public class Conexion
        {
            static Conexion _intancia = null;

            public static Conexion Instancia()
            {
                if (_intancia == null)
                {
                    _intancia = new Conexion();
                }
                return _intancia;
            }

            public IDbConnection GetConnection()
            {
                //IDbConnection db = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Bpm"].ConnectionString);
                string Cadena = "Server=(local); DataBase=Sistema_de_Permisos;Integrated Security=True";
                IDbConnection db = new SqlConnection(Cadena);
                return db;
            }

        }
    }
}
