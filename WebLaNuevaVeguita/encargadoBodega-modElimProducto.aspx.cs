using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita.Paginas
{
    public partial class encargadoBodega : System.Web.UI.Page
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

                if (miUser.IdTipoUsuario != 4 || Session["userNombre"] == null)
                {
                    Response.Redirect("laveguita.aspx");
                }
            }
        }
        //-------------------INICIO BOTTON CLICK-----------------------
        protected void btnBuscarProducto_Click(object sender, EventArgs e)
        {
            if (buscar() != null)
            {
                Producto p = new Producto();
                p = buscar();
                if (p.IdProducto == 0)
                {
                    lblMensaje.Text = "<label style='color: red'>Producto no encontrado!</label>";
                    return;
                }
                if (p == null)
                {
                    lblMensaje.Text = "Caja de texto nula!";
                    return;
                }
                else
                    if (p.IdProducto != 0)
                    {
                        lblMensaje.Text = "<label style='color: green'>Busqueda satisfactoria!</label>";
                        cargarDatos();

                    }
                    else
                    {
                        lblMensaje.Text = "No encuentra el producto en el sistema!";
                    }
            }
            else
            {
                lblMensaje.Text = "No encuentra el producto en el sistema!";
            }
        }

        protected void btnModificarProducto_Click(object sender, EventArgs e)
        {
            modificarProducto();
        }

        protected void btnEliminarProducto_Click(object sender, EventArgs e)
        {
            eliminarProducto();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiarCampos();
        }
        //-------------------FIN BOTTON CLICK-----------------------
        #region metodos
        //--------------------------BUSCAR--------------------------
        public Producto buscar()
        {
            Producto p = new Producto();
            try
            {
                Producto producto = new Producto();
                p = null;
                p = producto.buscarProducto(int.Parse(txtBuscarIdPorducto.Text));

            }
            catch (Exception e)
            {

                lblMensaje.Text = "Error";
            }
            return p;
        }
        //--------------------------CARGAR--------------------------
        public void cargarDatos()
        {
            int idProducto = int.Parse(txtBuscarIdPorducto.Text);
            Producto p = new Producto();

            p = p.buscarProducto(idProducto);
            if (p == null)
            {
                return;
            }
            else
            {
                //Cargar
                txtIdProducto.Text = p.IdProducto.ToString();
                txtDescripcion.Text = p.Descripcion;
                txtStock.Text = p.Stock.ToString();
                txtPrecio.Text = p.Precio.ToString();
                txtStockMin.Text = p.StockMin.ToString();
                txtProveedor.Text = p.Proveedor;

            }
        }
        //--------------------------MODIFICAR--------------------------
        public void modificarProducto()
        {
            string descripcion = txtDescripcion.Text;
            int precio = int.Parse(txtPrecio.Text);
            int stock = int.Parse(txtStock.Text);
            int stockMin = int.Parse(txtStockMin.Text);
            string proveedor = txtProveedor.Text;
            int id_producto = int.Parse(txtIdProducto.Text);
            Producto pro = new Producto();
            bool estado = /*servicio*/pro.ModificarProducto(descripcion, stock, precio, stockMin, proveedor, id_producto);
            if (estado == true)
            {
                lblMsjMod.Text = "<label style='color: green'>Se modificó con exito!</label>";
            }
            else
            {
                lblMsjMod.Text = "<label style='color: red'>Error no se pudo modificar!</label>";
            }
        }
        //--------------------------ELIMINAR--------------------------
        public void eliminarProducto()
        {
            int idProducto = int.Parse(txtIdProducto.Text);
            Producto pro = new Producto();
            bool estado = /*servicio*/pro.eliminarProducto(idProducto);
            if (estado == true)
            {
                lblMsjMod.Text = "<label style='color: green'>Producto eliminado</label>";
            }
            else
            {
                lblMsjMod.Text = "<label style='color: red'>No se pudo eliminar producto</label>";
            }
        }
        //--------------------------Desactivar Campos--------------------------
        public void desactivarCampos()
        {
            btnBuscarProducto.Visible = true;
            txtBuscarIdPorducto.Enabled = true;
            txtDescripcion.Enabled = false;
            txtPrecio.Enabled = false;
            txtProveedor.Enabled = false;
            txtStock.Enabled = false;
            txtStockMin.Enabled = false;
        }
        //--------------------------Activar Campos--------------------------
        public void activarCampos()
        {
            btnBuscarProducto.Enabled = false;
            txtBuscarIdPorducto.Enabled = false;
            txtDescripcion.Enabled = true;
            txtPrecio.Enabled = true;
            txtProveedor.Enabled = true;
            txtStock.Enabled = true;
            txtStockMin.Enabled = true;
        }
        //--------------------------Limpiar Campos--------------------------
        public void limpiarCampos()
        {
            txtDescripcion.Text = "";
            txtIdProducto.Text = "";
            txtPrecio.Text = "";
            txtProveedor.Text = "";
            txtStock.Text = "";
            txtStockMin.Text = "";
            lblMensaje.Text = "";
            lblMsjMod.Text = "";
        }
        #endregion

        protected void txtStock_TextChanged(object sender, EventArgs e)
        {













        }
    }
}