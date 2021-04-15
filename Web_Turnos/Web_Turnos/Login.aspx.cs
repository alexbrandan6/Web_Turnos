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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NombreUsuario"] != null)
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnLog_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new DataSet();
                Usuario usuario = new Usuario();
                UsuarioRepositorio usuarioRepo = new UsuarioRepositorio();

                LlenarDatos(usuario);
                ds = usuarioRepo.UsuarioLogear(usuario);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    string msj = ds.Tables[0].Rows[0]["msj"].ToString();

                    if (msj == "OK")
                    {
                        GuardarSession(ds);
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error','" + msj + "', 'error');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error','No se pudo logear', 'error');", true);
                }
            }
            catch(Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error','" + ex.ToString() + "', 'error');", true);
            }
        }
        protected Usuario LlenarDatos(Usuario usuario)
        {
            usuario.setNombreUsuario(txtUsuario.Text);
            usuario.setContrasenia(txtContra.Text);

            return usuario;
        }
        protected void GuardarSession(DataSet ds)
        {
            Session["NombreUsuario"] = ds.Tables[0].Rows[0]["NombreUsuario"].ToString();
            Session["Perfil"] = ds.Tables[0].Rows[0]["Perfil"].ToString();
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}