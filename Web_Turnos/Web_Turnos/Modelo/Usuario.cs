using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Turnos.Modelo
{
    public class Usuario
    {
        private int idUsuario;
        private string NombreUsuario;
        private string Contrasenia;
        private DateTime FechaAlta;
        private string Apellido;
        private string Nombre;
        private string Telefono;
        private string Mail;
        private string Genero;
        private DateTime FechaNacimiento;
        private int Perfil;

        public Usuario() { }
        public Usuario(string NombreUsuario, string Contrasenia, DateTime FechaAlta)
        {
            this.NombreUsuario = NombreUsuario;
            this.Contrasenia = Contrasenia;
            this.FechaAlta = FechaAlta;
        }

        public string getNombreUsuario()
        {
            return NombreUsuario;
        }
        public void setNombreUsuario(string NombreUsuario)
        {
            this.NombreUsuario = NombreUsuario;
        }
        public string getContrasenia()
        {
            return Contrasenia;
        }
        public void setContrasenia(string Contrasenia)
        {
            this.Contrasenia = Contrasenia;
        }
        public DateTime getFechaAlta()
        {
            return FechaAlta;
        }
        public void setFechaAlta(DateTime FechaAlta)
        {
            this.FechaAlta = FechaAlta;
        }
        public string getNombre()
        {
            return Nombre;
        }
        public void setNombre(string Nombre)
        {
            this.Nombre = Nombre;
        }
        public string getApellido()
        {
            return Apellido;
        }
        public void setApellido(string Apellido)
        {
            this.Apellido = Apellido;
        }
        public string getTelefono()
        {
            return Telefono;
        }
        public void setTelefono(string Telefono)
        {
            this.Telefono = Telefono;
        }
        public string getMail ()
        {
            return Mail;
        }
        public void setMail(string Mail)
        {
            this.Mail = Mail;
        }
        public string getGenero()
        {
            return Genero;
        }
        public void setGenero(string Genero)
        {
            this.Genero = Genero;
        }
        public DateTime getFechaNacimiento()
        {
            return FechaNacimiento;
        }
        public void setFechaNacimiento(DateTime FechaNacimiento)
        {
            this.FechaNacimiento = FechaNacimiento;
        }
        public int getPerfil()
        {
            return Perfil;
        }
        public void setPerfil(int Perfil)
        {
            this.Perfil = Perfil;
        }
    }
}