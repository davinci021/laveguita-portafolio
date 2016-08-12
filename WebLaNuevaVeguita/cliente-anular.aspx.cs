using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita
{
    public partial class clienteAnular : System.Web.UI.Page
    {
        Usuario miUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            miUser = (Usuario)Session["userRut"];
            Venta venta = new Venta();

            if (Session["userRut"] == null)
            {
                Response.Redirect("laveguita.aspx");
            }
            else
            {
                lblRut.Text = miUser.Rut;
                string rut = lblRut.Text;
                GVAnul.DataSource = venta.listarVentasA(rut);
                GVAnul.DataBind();
                
            }
        }

        protected void GVAnul_SelectedIndexChanged(object sender, EventArgs e)
        {
            int f = GVAnul.SelectedIndex;
            int id_venta = int.Parse(GVAnul.Rows[f].Cells[1].Text);
            lbl_IdVenta.Text = id_venta.ToString();

        }

        protected void btnAnular_Click(object sender, EventArgs e)
        {
            bool estado = false;
            Anulacion anula = new Anulacion();
            string motivo = txtMotivo.Text;
            int id_venta = int.Parse(lbl_IdVenta.Text);
            estado = anula.agregarAnulacion(motivo, id_venta);
            if (estado == true)
            {
                lblMensaje.Text = "Anulacion ingresada";
            }
            else
            {
                lblMensaje.Text = "Anulacion ingresada";
            }
        }
        

    }
}