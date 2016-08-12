using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita.Paginas
{
    public partial class cliente_cambiarClave : System.Web.UI.Page
    {
        Usuario miUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            miUser = (Usuario)Session["userRut"];

            if (Session["userRut"] == null)
            {
                Response.Redirect("laveguita.aspx");
            }
            else
            {
                lblRut.Text = miUser.Rut;
            }
        }

        protected void btnCambiarClave_Click(object sender, EventArgs e)
        {
            miUser = (Usuario)Session["userRut"];
            Usuario user = new Usuario();
            bool estado = false;
            if (txtCClaveNueva.Text.Equals(txtClaveNueva.Text))
            {
                string n_clave = txtClaveNueva.Text;
                string clave = txtClave.Text;
                string rut = lblRut.Text;
                estado = user.modificarClave(n_clave, clave, rut);
                if (estado == true)
                {
                    lblMsj.Text = "<label style='color: green'>Clave Modificada</label>";
                }
                else
                {
                    lblMsj.Text = "<label style='color: red'>Error al modificar la clave</label>";
                }
            }
            else
            {
                lblMsj.Text = "<label style='color: red'>Las claves no coinciden</label>";
            }
        }
    }
}