using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita.Paginas
{
    public partial class administrador_modificarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModificarUser_Click(object sender, EventArgs e)
        {
            modificar();
        }

        public void modificar()
        {

            string rut = txtRut.Text;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string email = txtEmail.Text;
            DateTime nacimiento = new DateTime(int.Parse(txtYear.Text), int.Parse(txtMes.Text), int.Parse(txtDia.Text));
            string sexo = ddlSexo.SelectedItem.Text;
            int telefono = int.Parse(txtCelular.Text);
            int idTipo = int.Parse(ddlTipoUser.SelectedValue);
            Usuario user = new Usuario();
            bool estado = /*servicio*/user.modificarUsuario(nombre, apellido, email, nacimiento, sexo, telefono, idTipo, rut);
            if (estado == true)
            {
                lblMsj.Text = "Se modifico con exito!";
            }
            else
            {
                lblMsj.Text = "Error no se pudo modificar!";
            }

        }

        protected void GVUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            int f = GVUser.SelectedIndex;
            string rut = GVUser.Rows[f].Cells[0].Text;
            string apellido = GVUser.Rows[f].Cells[1].Text;
            string nombre = GVUser.Rows[f].Cells[2].Text;
            string email = GVUser.Rows[f].Cells[3].Text;
            string nacimiento = GVUser.Rows[f].Cells[4].Text;
            string genero = GVUser.Rows[f].Cells[5].Text;
            string telefono = GVUser.Rows[f].Cells[6].Text;
            string idTipoUser = GVUser.Rows[f].Cells[7].Text;
            ddlSexo.SelectedValue = genero;
            txtRut.Text = rut;
            txtApellido.Text = apellido;
            txtNombre.Text = nombre;
            txtEmail.Text = email;
            txtCelular.Text = telefono;
            string nacimeinto = nacimiento.Replace("-", "");
            lblMsj.Text = nacimeinto;
            ddlTipoUser.SelectedIndex = int.Parse(idTipoUser) - 1;
        }
    }
}