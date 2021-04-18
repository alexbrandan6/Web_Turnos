using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Web_Turnos.Modelo;

namespace Web_Turnos.Repositorio
{
    
    public class UsuarioRepositorio
    {
        public DataSet UsuarioGuardar(Usuario usuario)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosUsuarioGuardar(ref datos, usuario);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Usuario_Guardar");
            }
            catch(Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosUsuarioGuardar(ref SqlCommand datos, Usuario usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@NombreUsuario", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getNombreUsuario();

            SqlParametros = datos.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getContrasenia();

            SqlParametros = datos.Parameters.Add("@Apellido", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getApellido();

            SqlParametros = datos.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getNombre();

            SqlParametros = datos.Parameters.Add("@Telefono", SqlDbType.VarChar, 20);
            SqlParametros.Value = usuario.getTelefono();

            SqlParametros = datos.Parameters.Add("@Mail", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getMail();

            SqlParametros = datos.Parameters.Add("@Genero", SqlDbType.Int);
            SqlParametros.Value = usuario.getGenero();

            SqlParametros = datos.Parameters.Add("@FechaNacimiento", SqlDbType.Date);
            SqlParametros.Value = usuario.getFechaNacimiento();
        }
        public DataSet UsuarioLogear(Usuario usuario)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosUsuarioLogear(ref datos, usuario);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Usuario_Logear");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosUsuarioLogear(ref SqlCommand datos, Usuario usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@NombreUsuario", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getNombreUsuario();

            SqlParametros = datos.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getContrasenia();
        }
        public DataSet UsuarioObtener(Usuario usuario)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosUsuarioObtener(ref datos, usuario);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Usuario_Obtener");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosUsuarioObtener(ref SqlCommand datos, Usuario usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@NombreUsuario", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getNombreUsuario();

            SqlParametros = datos.Parameters.Add("@op", SqlDbType.VarChar, 10);
            SqlParametros.Value = "USER";
        }
        public DataSet UsuarioActualizar(Usuario usuario, string NombreUsuarioActual)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosUsuarioActualizar(ref datos, usuario, NombreUsuarioActual);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Usuario_Actualizar");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosUsuarioActualizar(ref SqlCommand datos, Usuario usuario, string NombreUsuarioActual)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@NombreUsuarioActual", SqlDbType.VarChar, 50);
            SqlParametros.Value = NombreUsuarioActual;

            SqlParametros = datos.Parameters.Add("@NombreUsuario", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getNombreUsuario();

            SqlParametros = datos.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getContrasenia();

            SqlParametros = datos.Parameters.Add("@Apellido", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getApellido();

            SqlParametros = datos.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getNombre();

            SqlParametros = datos.Parameters.Add("@Telefono", SqlDbType.VarChar, 20);
            SqlParametros.Value = usuario.getTelefono();

            SqlParametros = datos.Parameters.Add("@Mail", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getMail();

            SqlParametros = datos.Parameters.Add("@Genero", SqlDbType.Int);
            SqlParametros.Value = usuario.getGenero();

            SqlParametros = datos.Parameters.Add("@FechaNacimiento", SqlDbType.Date);
            SqlParametros.Value = usuario.getFechaNacimiento();
        }
    }
}