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
    public partial class WebTurnos : System.Web.UI.MasterPage
    {
        AccesoDatos acc = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NombreUsuario"] != null)
            {
                ddlGenero.DataSource = acc.ObtenerTabla("tblGeneros", "SELECT * FROM tblGeneros");
                ddlGenero.DataBind();

                CargarDatosUsuario(ObtenerUsuario(Session["NombreUsuario"].ToString()));

                spnNombreUsuario.InnerText = Session["NombreUsuario"].ToString();

                liLog.Visible = false;
                liDesLog.Visible = true;
            }
            else
            {
                liLog.Visible = true;
                liDesLog.Visible = false;
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["NombreUsuario"] = null;
            Session["Perfil"] = null;
            Response.Redirect("Home.aspx");
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
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('Error','" + msj + "', 'error');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('Error','No se pudo logear', 'error');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('Error','" + ex.ToString() + "', 'error');", true);
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
        protected void CargarDatosUsuario(DataSet ds)
        {
            txtApellido.Text = ds.Tables[0].Rows[0]["Apellido"].ToString();
            txtNombre.Text = ds.Tables[0].Rows[0]["Nombre"].ToString();
            txtMail.Text = ds.Tables[0].Rows[0]["Mail"].ToString();
            txtTelefono.Text = ds.Tables[0].Rows[0]["Telefono"].ToString();
            txtFechaNacimiento.Text = ds.Tables[0].Rows[0]["FechaNacimiento"].ToString().Substring(0, 10);
            txtNombreUsuario.Text = ds.Tables[0].Rows[0]["NombreUsuario"].ToString();
            txtContrasenia.Text = ds.Tables[0].Rows[0]["Contrasenia"].ToString();
            ddlGenero.SelectedValue = ds.Tables[0].Rows[0]["Genero"].ToString();
        }
        protected DataSet ObtenerUsuario(string NombreUsuario)
        {
            DataSet ds = new DataSet();
            Usuario usuario = new Usuario();
            UsuarioRepositorio usuarioRepo = new UsuarioRepositorio();
            usuario.setNombreUsuario(NombreUsuario);
            return ds = usuarioRepo.UsuarioObtener(usuario);
        }
    }
}