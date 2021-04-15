using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Web_Turnos.Modelo;

namespace Web_Turnos.Repositorio
{
    
    public class TurnoRepositorio
    {
        public DataSet TurnoGuardar(Turno turno)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosTurnoGuardar(ref datos, turno);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Turnos_Guardar");
            }
            catch(Exception ex)
            {
                throw;
            }
        }
        public DataSet TurnoActualizar(Turno turno)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosTurnoActualizar(ref datos, turno);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Turnos_Actualizar");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public DataSet TurnoCancelar(string idTurno)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosTurnoCancelar(ref datos, idTurno);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Turnos_Cancelar");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosTurnoGuardar(ref SqlCommand datos, Turno turno)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@idHorario", SqlDbType.Int);
            SqlParametros.Value = turno.getIdHorario();

            SqlParametros = datos.Parameters.Add("@Fecha", SqlDbType.Date);
            SqlParametros.Value = turno.getFecha();

            SqlParametros = datos.Parameters.Add("@Usuario", SqlDbType.VarChar, 50);
            SqlParametros.Value = turno.getUsuario();
        }
        private void ArmarParametrosTurnoActualizar(ref SqlCommand datos, Turno turno)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@idHorario", SqlDbType.Int);
            SqlParametros.Value = turno.getIdHorario();

            SqlParametros = datos.Parameters.Add("@Fecha", SqlDbType.Date);
            SqlParametros.Value = turno.getFecha();

            SqlParametros = datos.Parameters.Add("@idTurno", SqlDbType.Int);
            SqlParametros.Value = turno.getIdTurno();
        }
        private void ArmarParametrosTurnoCancelar(ref SqlCommand datos, string idTurno)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@idTurno", SqlDbType.Int);
            SqlParametros.Value = idTurno;
        }
    }
}