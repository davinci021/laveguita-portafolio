using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebLaNuevaVeguita.Paginas
{
    public partial class producto_catalogo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            DataControlFieldCell f = (DataControlFieldCell)((Control)sender).Parent;
            string cod = (f.FindControl("lblCodProducto") as Label).Text;
            string descrip = (f.FindControl("lblDescripcion") as Label).Text;
            string stock = (f.FindControl("lblStock") as Label).Text;
            string precio = (f.FindControl("lblPrecio") as Label).Text;
            string stockMin = (f.FindControl("lblStockMin") as Label).Text;
            string proveedor = (f.FindControl("lblProveedor") as Label).Text;


            HttpCookie dato = new HttpCookie("dato");
            dato.Values["id_producto"] = cod;
            dato.Values["descripcion"] = descrip;
            dato.Values["stock"] = stock;
            dato.Values["precio"] = precio;
            dato.Values["stock_minimo"] = stockMin;
            dato.Values["proveedor"] = proveedor;


            Response.Cookies.Add(dato);
            Response.Redirect("producto-detalle.aspx");
        }

        protected void dlProducto_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataListItem f = (DataListItem)((Control)(e.CommandSource)).Parent;
            string cod = (f.FindControl("lblCodProducto") as Label).Text;
            string descrip = (f.FindControl("lblDescripcion") as Label).Text;
            string precio = (f.FindControl("lblPrecio") as Label).Text;
            string stock = (f.FindControl("lblStock") as Label).Text;
            string stockMin = (f.FindControl("lblStockMin") as Label).Text;
            string proveedor = (f.FindControl("lblProveedor") as Label).Text;


            HttpCookie dato = new HttpCookie("dato");
            dato.Values["id_producto"] = cod;
            dato.Values["descripcion"] = descrip;
            dato.Values["precio"] = precio;
            dato.Values["stock"] = stock;
            dato.Values["stock_minimo"] = stockMin;
            dato.Values["proveedor"] = proveedor;

            Response.Cookies.Add(dato);
            Response.Redirect("producto-detalle.aspx");
        }
    }
}