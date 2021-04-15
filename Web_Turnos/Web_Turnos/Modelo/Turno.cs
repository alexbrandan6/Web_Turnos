using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Turnos.Modelo
{
    public class Turno
    {
        private int idTurno;
        private int idHorario;
        private DateTime Fecha;
        private string Usuario;

        public Turno() { }
        public Turno(int idHorario, DateTime Fecha, string Usuario)
        {
            this.idHorario = idHorario;
            this.Fecha = Fecha;
            this.Usuario = Usuario;
        }
        public int getIdTurno()
        {
            return idTurno;
        }
        public void setIdTurno(int idTurno)
        {
            this.idTurno = idTurno;
        }
        public string getUsuario()
        {
            return Usuario;
        }
        public void setUsuario(string Usuario)
        {
            this.Usuario = Usuario;
        }
        public DateTime getFecha()
        {
            return Fecha;
        }
        public void setFecha(DateTime Fecha)
        {
            this.Fecha = Fecha;
        }
        public int getIdHorario()
        {
            return idHorario;
        }
        public void setIdHorario(int idHorario)
        {
            this.idHorario = idHorario;
        }
    }
}