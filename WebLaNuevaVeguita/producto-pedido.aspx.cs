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
    public partial class producto_pedido : System.Web.UI.Page
    {
        Usuario miUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["userRut"] != null)
            {
                Boleta boleta = new Boleta();
                miUser = (Usuario)Session["userRut"];
                string rut = miUser.Rut;
                lblRut.Text = rut;
                DetalleBD tabla = new DetalleBD((DataTable)Session["carrito"]);
                lblTotal.Text = tabla.totalizar().ToString();
                lblTota.Text = tabla.totalizar().ToString();
                string id = boleta.ultimaBoleta();
                lbl_id_boleta.Text = id;
            }
            else
            {
                Response.Redirect("laveguita.aspx");
            }
        }

        public void Cargar() {

            Pedido cl = new Pedido();
            gv_prueba.DataSource = cl.ListarPrueba((DataTable)Session["carrito"]);
            gv_prueba.DataBind();
        }

        public Boolean comprar()
        {
            bool estado = false;
            Venta claseventa = new Venta();
            Pedido pedido = new Pedido();
            try
            {
                estado = claseventa.agregarVenta(int.Parse(lblTota.Text));
                DataTable lista = ((DataTable)Session["carrito"]);

                for (int i = 0; i < lista.Rows.Count; i++)
                {
                    DataRow fila = lista.Rows[i];
                    int id_producto = int.Parse(fila["id_producto"].ToString());
                    int total = int.Parse(fila["total"].ToString());
                    int cantidad = int.Parse(fila["cantidad"].ToString());
                    pedido.insertarPedidos(lblRut.Text, cantidad, total, id_producto);
                }
            }
            catch (Exception)
            {

                throw;
            }
            return estado;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Cargar();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (comprar())
            {
                lbl_msj.Text = "<script>alert('exito');</script>";
                Boleta boleta = new Boleta();
                Usuario usuario = new Usuario();
                string id = boleta.ultimaBoleta();

                miUser = (Usuario)Session["userMail"];
                usuario.enviarCorreo(miUser.Email, id, int.Parse(lblTotal.Text));
            }
            else {
                lbl_msj.Text = "<script>alert('error');</script>";
            }

            

        }

    }
}