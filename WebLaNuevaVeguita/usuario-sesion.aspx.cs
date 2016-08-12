using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita.Paginas
{
    public partial class cliente_sesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userNombre"] != null)
            {
                Response.Redirect("laveguita.aspx");
            }
            else
            {
                
            }
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Usuario user = new Usuario();
            Usuario uu = new Usuario();
            string email = txtSesionEmail.Text;
            string clave = txtSesionClave.Text;
            string encriptada = user.GetMD5(clave);
            uu = user.validarUsuario(encriptada, email);
            if (uu.Email != null)
            {
                Session["userNombre"] = uu;
                Session["userMail"] = uu;
                Session["userRut"] = uu;
                Session["userIdTipoU"] = uu;
                Response.Redirect("laveguita.aspx");
            }
            else
            {
                Mensaje.Text = "Usuario no existe";
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            agregarUsuario();
        }

        public bool agregarUsuario()
        {
            bool estado = false;
            string nombre = txtNombre.Text;
            string apellido = txtApellidos.Text;
            string rut = txtRut.Text;
            string email = txtEmail.Text;
            string clave = txtClave.Text;
            DateTime nacimiento = new DateTime(1950, 01, 01);
            string sexo = "Masculino";
            int id = 2;
            int telefono = 0;
            Usuario user = new Usuario();
            estado = /*servicio*/user.agregarUsuario(rut, nombre, apellido, clave, email, nacimiento, sexo, telefono, id);
            if (estado == true)
            {
                lblResultado.Text = "<label style='color:green'>Se agrego a la persona correctamente</label>";
            }
            else
            {
                lblResultado.Text = "<label style='color:red'>No se pudo agregar el usuario</label>";
            }
            return estado;
        }
    }
}