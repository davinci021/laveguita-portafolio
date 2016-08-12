using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita
{
    public partial class jefeOperaciones_anularVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Anulacion anular = new Anulacion();
            GVJefeAnulacion.DataSource = anular.modificarAnular();
            GVJefeAnulacion.DataBind();
        }

        protected void GVJefeAnulacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            int f = GVJefeAnulacion.SelectedIndex;
            string idVenta = GVJefeAnulacion.Rows[f].Cells[4].Text;
            string estado = GVJefeAnulacion.Rows[f].Cells[5].Text;
            lblVenta.Text = idVenta;
            ddlEstado.SelectedValue = estado;
        }

        protected void btnAnular_Click(object sender, EventArgs e)
        {
            bool estado = false;
            Anulacion anula = new Anulacion();
            int id_venta = int.Parse(lblVenta.Text);
            string esta = ddlEstado.SelectedValue;
            estado = anula.modificarAnulacion(id_venta, esta);
            if (estado == true)
            {
                lblMensaje.Text = "Anulacion Modificada";
            }
            else
            {
                lblMensaje.Text = "Error";
            }
        }


    }
}