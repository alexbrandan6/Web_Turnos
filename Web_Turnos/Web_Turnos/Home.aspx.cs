using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Turnos.Modelo;
using Web_Turnos.Repositorio;

namespace Web_Turnos
{
    public partial class Home : System.Web.UI.Page
    {
        AccesoDatos acc = new AccesoDatos();
        FuncionesComunes fun = new FuncionesComunes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ddlDia.DataSource = acc.EjecutarScript("EXEC SP_Calendario");
                    ddlDia.DataBind();
                }
                catch(Exception ex)
                {
                    throw;
                }
            }
        }

        protected void ddlDia_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if(ddlDia.SelectedValue != "-1")
                {
                    String fecha = ddlDia.SelectedValue.Substring(0, 10);
                    fecha = fun.FechaAAAAMMDD(fecha);

                    ddlHorario.Items.Clear();
                    ddlHorario.DataSource = acc.EjecutarScript("EXEC SP_Horarios_Obtener '" + fecha + "'");
                    ddlHorario.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected void btnReservar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["NombreUsuario"] != null)
                {
                    DataSet ds = new DataSet();
                    Turno turno = new Turno();
                    TurnoRepositorio turnoRepo = new TurnoRepositorio();

                    LlenarDatos(turno);

                    ds = turnoRepo.TurnoGuardar(turno);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string msj = ds.Tables[0].Rows[0]["msj"].ToString();

                        if (msj == "OK")
                        {
                            LimpiarControles();
                            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Hecho', 'El turno se registro exitosamente', 'success');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error','" + msj + "', 'error');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error','No se pudo guardar', 'error');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Atención','Debe iniciar sesión para reservar turno', 'warning');", true);
                }
            }
            catch(Exception ex)
            {
                throw;
            }
        }
        protected Turno LlenarDatos(Turno turno)
        {
            turno.setIdHorario(int.Parse(ddlHorario.SelectedValue));
            turno.setUsuario(Session["NombreUsuario"].ToString());
            turno.setFecha(DateTime.Parse(ddlDia.SelectedValue.Substring(0, 10).Replace("/", "-")));

            return turno;
        }
        protected void LimpiarControles()
        {
            ddlDia.SelectedValue = "-1";
            ddlHorario.Items.Clear();
        }
    }
}