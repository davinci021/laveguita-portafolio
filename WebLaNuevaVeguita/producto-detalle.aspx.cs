using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace WebLaNuevaVeguita.Paginas
{
    public partial class producto_detalle : System.Web.UI.Page
    {
        public static String v = "hola";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["dato"] == null)
            {
                Response.Redirect("producto-catalogo.aspx");
            }
            else
            {
                //Recupero Datos
                lblIdProducto.Text = Request.Cookies["dato"].Values["id_producto"];
                lblDescripcion.Text = Request.Cookies["dato"].Values["descripcion"];
                lblPrecio.Text = Request.Cookies["dato"].Values[2];
                lblStock.Text = Request.Cookies["dato"].Values[3];
                lblStockMin.Text = Request.Cookies["dato"].Values["stock_minimo"];
                lblProveedor.Text = Request.Cookies["dato"].Values["proveedor"];
                imgPro.ImageUrl = string.Format("imagenes/productos/{0}.jpg", lblIdProducto.Text);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (int.Parse(txtCantidad.Text) <= int.Parse(lblStock.Text))
            {
                //Instanciar DetalleBD y le pasamos como parámetro la sesión
                DetalleBD tabla = new DetalleBD((DataTable)Session["carrito"]);
                //Ejecuto y muestro el mensaje
                string mensaje = tabla.agregar(int.Parse(lblIdProducto.Text), lblDescripcion.Text, int.Parse(lblPrecio.Text), int.Parse(lblStock.Text), int.Parse(lblStockMin.Text), lblProveedor.Text, int.Parse(txtCantidad.Text));

                ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=JavaScript>alert('" + mensaje + "')</script>");

                //Actualizar sesión
                Session["carrito"] = tabla.getRegistro;
            }
            else {
                ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=JavaScript>alert('No puede superar el stock');</script>");
            }
          
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            Response.Redirect("producto-carrito.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("producto-catalogo.aspx");
        }

         
    }
}