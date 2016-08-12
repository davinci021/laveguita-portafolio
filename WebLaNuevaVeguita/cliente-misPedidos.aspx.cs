using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BiblitecaClases;
namespace WebLaNuevaVeguita.Paginas
{
    public partial class cliente_misPedidos : System.Web.UI.Page
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
                string rut = miUser.Rut;
                //Cargar
                lblRut.Text = rut;
                GVVenta.DataSource = venta.listarVentasA(rut);
                GVVenta.DataBind();
            }
        }

        protected void btnVer_Click(object sender, EventArgs e)
        {

        }

        protected void GVVenta_SelectedIndexChanged(object sender, EventArgs e)
        {
            Venta venta = new Venta();
            int f = GVVenta.SelectedIndex;
            int id = int.Parse(GVVenta.Rows[f].Cells[1].Text);
            GVMisPedidos.DataSource = venta.listarPedidosA(id);
            GVMisPedidos.DataBind();

        }
    }
}