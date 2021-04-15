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
    public partial class AltaUsuarios : System.Web.UI.Page
    {
        AccesoDatos acc = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlGenero.DataSource = acc.ObtenerTabla("tblGeneros", "SELECT * FROM tblGeneros");
                ddlGenero.DataBind();
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
                ds = usuarioRepo.UsuarioGuardar(usuario);

                if(ds.Tables[0].Rows.Count > 0)
                {
                    string msj = ds.Tables[0].Rows[0]["msj"].ToString();

                    if (msj == "OK")
                    {
                        LimpiarControles();
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Hecho', 'El usuario se registro exitosamente', 'success');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error','"+ msj + "', 'error');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error','No se pudo guardar', 'error');", true);
                }
            }
            catch(Exception ex)
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
            usuario.setGenero(ddlGenero.SelectedItem.Text);
            usuario.setFechaNacimiento(DateTime.Parse(txtFechaNacimiento.Text));

            return usuario;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
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