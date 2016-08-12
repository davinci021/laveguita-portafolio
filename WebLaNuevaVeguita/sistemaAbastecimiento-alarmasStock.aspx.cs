using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita.Paginas
{
    public partial class sistemaAbastecimiento_alarmasStock : System.Web.UI.Page
    {
        Usuario miUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            miUser = (Usuario)Session["userRut"];
            Producto producto = new Producto();

            if (Session["userRut"] == null)
            {
                Response.Redirect("laveguita.aspx");
            }
            else
            {
                lblRut.Text = miUser.Rut;
                GVAlarmasStock.DataSource = producto.alarmasStock();
                GVAlarmasStock.DataBind();

            }
        }
    }
}