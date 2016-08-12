using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita
{
    public partial class Plantilla : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario miUser = null;
            string rol = "";
            string ctrlUser = "";
            if (Session["userNombre"] != null)
            {
                
                miUser = (Usuario)Session["userNombre"];
                miUser = (Usuario)Session["userMail"];
                miUser = (Usuario)Session["userRut"];
                miUser = (Usuario)Session["userIdTipoU"];
                
                if (miUser.IdTipoUsuario == 1)
                {
                    rol = "Administrador";
                    ctrlUser = "<li role='separator' class='divider'></li>"+
                               "<li><a href='administrador-crearUsuario.aspx'>Crear Usuario</a></li>" +
                               "<li><a href='administrador-modificarUsuario.aspx'>Control de Usuarios</a></li>";
                }
                else if (miUser.IdTipoUsuario == 2)
                {
                    rol = "Cliente";
                    lblBodega.Text = "<li><a href='producto-catalogo.aspx'>Productos</a></li>";
                    ctrlUser = "<li><a href='cliente-misPedidos.aspx'>Mis Pedidos</a></li>"+
                        "<li><a href='cliente-misPedidos.aspx'>Historial Pedidos</a></li>" +
                        "<li><a href='cliente-cambiarClave.aspx'>Cambiar Clave</a></li>" +
                        "<li><a href='cliente-anular.aspx'>Anular Pedidos</a></li>";
                }
                else if (miUser.IdTipoUsuario == 3)
                {
                    rol = "Cajero Virtual";
                }
                else if (miUser.IdTipoUsuario == 4)
                {
                    rol = "Encargado Bodega";
                    lblBodega.Text = "<li><a href='sistemaAbastecimiento-alarmasStock.aspx'></a></li><li><a href='encargadoBodega-obtenerDespacho.aspx'>Orden Despacho</a></li><li><a href='encargadoBodega-crearProducto.aspx'>Agregar Productos</a></li><li><a href='encargadoBodega-modElimProducto.aspx'>Modificar Productos</a></li>";
                    
                }
                else if (miUser.IdTipoUsuario == 5)
                {
                    rol = "Jefe Operaciones";
                    ctrlUser = "<li><a href='jefeOperaciones-reporteVentas.aspx'>Reporte de ventas</a></li>"+
                        "<li><a href='jefeOperaciones-anularVenta.aspx'>Anulacion de ventas</a></li>";
                }
                else 
                {
                    lblBodega.Text = "<li><a href='producto-catalogo.aspx'>Productos</a></li>";
                }
                lblSesion.Text =
                "<li class='dropdown'><a href='#' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>"
                + miUser.Nombre + " <span class='caret'></span></a><ul class='dropdown-menu'>"+
                //-----------------------CONTROL USUARIO--------------------------//
                "<li><a href='cliente-modificar.aspx'>Modificar Usuario</a></li>" +
                "<li><a href='cliente-direccion.aspx'>Agregar Direccion</a></li>" +
                ctrlUser+
                
                //---------------------FIN CONTROL USUARIO------------------------//
                "<li role='separator' class='divider'></li><li><a href='#'>" + miUser.Email + "</a></li><li><a href='#'>" + rol + "</a></li><li role='separator' class='divider'></li><li><a href='exit-laveguita.aspx'>Cerrar Sesion</a></li></ul></li>";
            }
            else 
            {
                lblSesion.Text = "Mi Cuenta";
            }

            if (HttpContext.Current.Request.Url.AbsolutePath != "/laveguita.aspx")
            {
                lblIndex.Text = "";
            }
        }
        //--------------------FIN PAGE LOAD---------------------//
        }
    
}