using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita.Paginas
{
    public partial class encargadoBodega_crearProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario miUser = null;
            if (Session["userNombre"] != null)
            {

                miUser = (Usuario)Session["userNombre"];
                miUser = (Usuario)Session["userMail"];
                miUser = (Usuario)Session["userRut"];
                miUser = (Usuario)Session["userIdTipoU"];

                if (miUser.IdTipoUsuario == 4)
                {

                }
                else
                {
                    Response.Redirect("laveguita.aspx");
                }
            }
            else
            {
                Response.Redirect("laveguita.aspx");
            }
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            string descripcion = txtDescripcion.Text;
            int stock = int.Parse(txtStock.Text);
            int precio = int.Parse(txtPrecio.Text);
            int stockMin = int.Parse(txtStockMin.Text);
            string proveedor = txtProveedor.Text;
            Producto producto = new Producto();
            if (/*servicio*/producto.agregarProducto(descripcion, stock, precio, stockMin, proveedor))
            {
                lblMensaje.Text = "<label style='color:green'>Producto Agregado</label>";
            }
            else
            {
                lblMensaje.Text = "<label style='color:red'>No se pudo agregar el Producto</label>";
            }
        }

        
            
    }
}