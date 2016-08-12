using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita.Paginas
{
    public partial class administador_crearUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCrearUser_Click(object sender, EventArgs e)
        {
            crearUsuario();
        }
        #region metodos
        private bool crearUsuario()
        {
            bool estado = false;
            string rut = txtRut.Text;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string clave = txtClave.Text;
            string email = txtEmail.Text;
            DateTime nacimiento = new DateTime(int.Parse(txtYear.Text), int.Parse(txtMes.Text), int.Parse(txtDia.Text));
            string sexo = ddlSexo.SelectedValue;
            int telefono = int.Parse(txtCelular.Text);
            int tipoUser = int.Parse(ddlTipoUser.SelectedValue);
            Usuario user = new Usuario();
            estado = /*servicio*/user.agregarUsuario(rut, nombre, apellido, clave, email, nacimiento, sexo, telefono, tipoUser);
            if (estado == true)
            {
                lblMsj.Text = "<label style='color:green'>se agrego al usuario correctamente</label>";
            }
            else
            {
                lblMsj.Text = "<label style='color:red'>No se pudo agregar al usuario</label> ";
            }
            return estado;
        }
        #endregion
    }
}