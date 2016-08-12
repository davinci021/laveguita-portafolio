using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiblitecaClases;
namespace WebLaNuevaVeguita.Paginas
{
    public partial class cliente_modificar : System.Web.UI.Page
    {
        Usuario miUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            miUser = (Usuario)Session["userRut"];
            miUser = (Usuario)Session["userNombre"];
            miUser = (Usuario)Session["userMail"];
            miUser = (Usuario)Session["userIdTipoU"];
            if (Session["userRut"] == null)
            {
                Response.Redirect("laveguita.aspx");
            }
            else
            {
                string rut = miUser.Rut;
                string correo = miUser.Email;
                string nombre = miUser.Nombre;
                //Cargar
                lblRut.Text = rut;
                txtCEmail.Text = correo;
                txtEmail.Text = correo;
                txtNombre.Text = nombre;
                Usuario user = new Usuario();
                Usuario getUser = new Usuario();
                getUser = null;
                getUser = user.valiUsuario(correo, rut);
                //ddlSexo.SelectedValue = u.Sexo;
                txtCelular.Text = getUser.NTelefono.ToString();
                txtApellido.Text = getUser.Apellido.ToString();


                txtYear.Text = getUser.FNacimiento.ToString("yyyy");
                txtMes.Text = getUser.FNacimiento.ToString("MM");
                txtDia.Text = getUser.FNacimiento.ToString("dd");
                string genero = getUser.Sexo.ToString();
                if (genero == "Masculino")
                {
                    ddlSexo.SelectedValue = "Masculino";
                }
                else
                {
                    ddlSexo.SelectedValue = "Femenino";
                }
            }
        }

        protected void btnModUserAdmin_Click(object sender, EventArgs e)
        {
            modificar();
        }

        public void modificar()
        {
            if (txtEmail.Text.Equals(txtCEmail.Text))
            {
                miUser = (Usuario)Session["userRut"];
                string rutS = miUser.Rut;
                string rut = rutS;
                string nombre = txtNombre.Text;
                string apellido = txtApellido.Text;
                string email = txtEmail.Text;
                DateTime nacimiento = new DateTime(int.Parse(txtYear.Text), int.Parse(txtMes.Text), int.Parse(txtDia.Text));
                string sexo = ddlSexo.SelectedValue;
                int telefono = int.Parse(txtCelular.Text);
                int idUser = miUser.IdTipoUsuario; ;
                Usuario user = new Usuario();
                //bool estado = /*servicio*/user.modificarUsuario(rut, nombre, apellido, email, nacimiento, sexo, telefono, idUser);
                bool estado = user.modificarUsuario(nombre, apellido, email, nacimiento, sexo, telefono, idUser, rut);
                if (estado == true)
                {
                    lblMsjMod.Text = "<label style='color:green'>Se modifico con exito!</label>";
                }
                else
                {
                    lblMsjMod.Text = "<label style='color:red'>Error no se pudo modificar!</label>";
                }
            }
            else
            {
                lblMsjMod.Text = "<label style='color:red>Correos no coinciden!</label>";
            }
        }
    }
}