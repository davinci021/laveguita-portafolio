using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace WebLaNuevaVeguita.Paginas
{
    public partial class producto_carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Instanciar DetalleBD
                DetalleBD tabla = new DetalleBD((DataTable)Session["carrito"]);

                //Listar
                GVPedido.DataSource = tabla.getRegistro;
                GVPedido.DataBind();

                //Mostrar total
                lblTotal.Text = tabla.totalizar().ToString();

            }
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            Response.Redirect("producto-pedido.aspx");
        }
    }
}