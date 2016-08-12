using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita
{
    public partial class cliente_direccion : System.Web.UI.Page
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
                string rut = miUser.Rut;
                //Cargar
                lblRut.Text = rut;
            }
        }

        protected void btnAgregarDir_Click(object sender, EventArgs e)
        {
            agregarDireccion();
        }

        public bool agregarDireccion()
        {
            bool estado = false;
            //int id_direccion = 1;
            string calle = txtCalle.Text + " #" + txtNroCasa.Text;
            string comuna = ddlComuna.SelectedValue;
            string provincia = ddlProvincia.SelectedValue;
            string region = ddlRegion.SelectedValue;
            string run = lblRut.Text;
            Direccion direccion = new Direccion();
            estado = /*servicio*/direccion.agregarDireccion(calle, comuna, provincia, region, run);

            if (estado == true)
            {
                lblMensaje.Text = "<label style='color:green'>Direccion Agregada</label>";
            }
            else
            {
                lblMensaje.Text = "<label style='color:red'>No se pudo agregar la direccion</label>";
            }
            return estado;
        }
    }
}