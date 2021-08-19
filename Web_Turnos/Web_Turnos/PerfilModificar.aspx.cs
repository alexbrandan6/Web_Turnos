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
    public partial class PerfilModificar : System.Web.UI.Page
    {
        AccesoDatos acc = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["NombreUsuario"] != null)
            {
                if (!IsPostBack)
                {
                    ddlGenero.DataSource = acc.ObtenerTabla("tblGeneros", "SELECT * FROM tblGeneros");
                    ddlGenero.DataBind();

                    CargarDatosUsuario(ObtenerUsuario(Session["NombreUsuario"].ToString()));
                }
            }
            else
            {
                Response.Redirect("Home.aspx");
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new DataSet();
                Usuario usuario = new Usuario();
                UsuarioRepositorio usuarioRepo = new UsuarioRepositorio();

                LlenarDatos(usuario);
                ds = usuarioRepo.UsuarioActualizar(usuario, Session["NombreUsuario"].ToString());

                if (ds.Tables[0].Rows.Count > 0)
                {
                    string msj = ds.Tables[0].Rows[0]["msj"].ToString();

                    if (msj == "OK")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('Hecho', 'El usuario se actualizó exitosamente', 'success');", true);
                        btnCancelar.Text = "Volver";
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('Error','" + msj + "', 'error');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('Error','No se pudo actualizar', 'error');", true);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected Usuario LlenarDatos(Usuario usuario)
        {
            usuario.setNombreUsuario(txtNombreUsuario.Text);
            usuario.setContrasenia(txtContrasenia.Text);
            usuario.setApellido(txtApellido.Text);
            usuario.setNombre(txtNombre.Text);
            usuario.setTelefono(txtTelefono.Text);
            usuario.setMail(txtMail.Text);
            usuario.setGenero(int.Parse(ddlGenero.SelectedValue));
            usuario.setFechaNacimiento(DateTime.Parse(txtFechaNacimiento.Text));

            return usuario;
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

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Turnos.aspx");
        }

        protected void LimpiarControles()
        {
            foreach (var control in form1.Controls.OfType<TextBox>())
            {
                control.Text = "";
            }
            foreach (var control in form1.Controls.OfType<DropDownList>())
            {
                control.SelectedIndex = 0;
            }
        }
    }
}