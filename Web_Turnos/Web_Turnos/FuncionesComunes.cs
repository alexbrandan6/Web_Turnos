using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Turnos
{
    public class FuncionesComunes
    {
        public string FechaAAAAMMDD(string fecha)
        {
            string fechaNueva = fecha.Split(char.Parse("/"))[2];
            fechaNueva += fecha.Split(char.Parse("/"))[1];
            fechaNueva += fecha.Split(char.Parse("/"))[0];

            return fechaNueva;
        }
    }
}