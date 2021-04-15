﻿using System;
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
    public partial class Turnos : System.Web.UI.Page
    {
        AccesoDatos acc = new AccesoDatos();
        FuncionesComunes fun = new FuncionesComunes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if(Session["NombreUsuario"] != null){
                        rptTurnos.DataSource = acc.EjecutarScript("EXEC SP_Turnos_Obtener '" + Session["NombreUsuario"].ToString() + "'");
                        rptTurnos.DataBind();
                    }

                    if(Request.QueryString["idTurno"] != null)
                    {
                        ddlDia.DataSource = acc.EjecutarScript("EXEC SP_Calendario");
                        ddlDia.DataBind();

                        divDatosTurno.Visible = true;
                    }
                }
                catch(Exception ex)
                {
                    throw;
                }
            }
        }

        protected void ddlDia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDia.SelectedValue != "-1")
            {
                String fecha = ddlDia.SelectedValue.Substring(0, 10);
                fecha = fun.FechaAAAAMMDD(fecha);

                ddlHorario.Items.Clear();
                ddlHorario.DataSource = acc.EjecutarScript("EXEC SP_Horarios_Obtener '" + fecha + "'");
                ddlHorario.DataBind();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["NombreUsuario"] != null)
                {
                    DataSet ds = new DataSet();
                    Turno turno = new Turno();
                    TurnoRepositorio turnoRepo = new TurnoRepositorio();

                    LlenarDatos(turno);

                    ds = turnoRepo.TurnoActualizar(turno);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string msj = ds.Tables[0].Rows[0]["msj"].ToString();

                        if (msj == "OK")
                        {
                            LimpiarControles();
                            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Hecho', 'El turno se actualizó exitosamente', 'success').then(() =>  window.location.href = 'Turnos.aspx');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error','" + msj + "', 'error');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error','No se pudo actualizar', 'error');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Atención','Debe iniciar sesión para actualizar turno', 'warning');", true);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        protected Turno LlenarDatos(Turno turno)
        {
            turno.setIdHorario(int.Parse(ddlHorario.SelectedValue));
            turno.setIdTurno(int.Parse(Request.QueryString["idTurno"]));
            turno.setFecha(DateTime.Parse(ddlDia.SelectedValue.Substring(0, 10).Replace("/", "-")));

            return turno;
        }
        protected void LimpiarControles()
        {
            ddlDia.SelectedValue = "-1";
            ddlHorario.Items.Clear();
            divDatosTurno.Visible = false;
        }
        protected void CancelarTurno(object sender, CommandEventArgs e)
        {
            try
            {
                if (Session["NombreUsuario"] != null)
                {
                    DataSet ds = new DataSet();
                    string idTurno = e.CommandArgument.ToString();
                    TurnoRepositorio turnoRepo = new TurnoRepositorio();

                    ds = turnoRepo.TurnoCancelar(idTurno);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string msj = ds.Tables[0].Rows[0]["msj"].ToString();

                        if (msj == "OK")
                        {
                            LimpiarControles();
                            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Hecho', 'El turno se cancelo exitosamente', 'success').then(() =>  window.location.href = 'Turnos.aspx');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error','" + msj + "', 'error');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error','No se pudo cancelar', 'error');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Atención','Debe iniciar sesión para cancelar el turno', 'warning');", true);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}