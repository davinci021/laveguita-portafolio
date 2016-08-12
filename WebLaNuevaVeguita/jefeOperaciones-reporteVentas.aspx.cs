using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita
{
    public partial class jefeOperaciones_reporteVentas : System.Web.UI.Page
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
                

            }
        }

        protected void btnVerReporte_Click(object sender, EventArgs e)
        {
            Venta venta = new Venta();
            string rut = lblRut.Text;
            DateTime desde =new DateTime(int.Parse(txtYear1.Text), int.Parse(txtMes1.Text), int.Parse(txtDia1.Text));
            DateTime hasta = new DateTime(int.Parse(txtYear.Text), int.Parse(txtMes.Text), int.Parse(txtDia.Text));
            GVReporte.DataSource = venta.reporteVentas(desde, hasta);
            GVReporte.DataBind();
        }
    }
}