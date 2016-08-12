using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Security.Cryptography;
using BibliotecaADO;
using System.Net.Mail;
using System.Net;
namespace BiblitecaClases
{
    public  class Usuario
    {
        #region Accesadores y mutadores
        private string _rut;

        public string Rut
        {
            get { return _rut; }
            set { _rut = value; }
        }
        private string _nombre;

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }
        private string _apellido;

        public string Apellido
        {
            get { return _apellido; }
            set { _apellido = value; }
        }
        private string _clave;

        public string Clave
        {
            get { return _clave; }
            set { _clave = value; }
        }
        private string _email;

        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }
        private DateTime _fNacimiento;

        public DateTime FNacimiento
        {
            get { return _fNacimiento; }
            set { _fNacimiento = value; }
        }
        private string _sexo;

        public string Sexo
        {
            get { return _sexo; }
            set { _sexo = value; }
        }
        private int _nTelefono;

        public int NTelefono
        {
            get { return _nTelefono; }
            set { _nTelefono = value; }
        }
        private int _idTipoUsuario;

        public int IdTipoUsuario
        {
            get { return _idTipoUsuario; }
            set { _idTipoUsuario = value; }
        }

        #endregion

        #region Constructor

        public Usuario() { }

        #endregion

        #region Metodos
        //-----------------------------------AGREGAR----------------------------------------//
        public bool agregarUsuario(string rut, string nombre, string apellido, string clave, string email, DateTime nacimiento, string sexo, int telefono, int id_tipo)
        {
            bool estado = false;
            Conexion conexionclass = new Conexion();
            OracleConnection conn = new OracleConnection();
            conn = conexionclass.CConexion();
            OracleCommand comando = new OracleCommand();
            conn.Open();
            comando.Connection = conn;
            string encriptado = GetMD5(clave);
            comando.CommandText = "ingresar_usuario";
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.Add("v_rut", rut);
            comando.Parameters.Add("v_nombre", nombre);
            comando.Parameters.Add("v_apellido", apellido);
            comando.Parameters.Add("v_contrasena", encriptado);
            comando.Parameters.Add("v_email", email);
            comando.Parameters.Add("v_nacimiento", nacimiento);
            comando.Parameters.Add("v_sexo", sexo);
            comando.Parameters.Add("v_telefono", telefono);
            comando.Parameters.Add("v_id_tipo_usuario", id_tipo);
            try
            {
                if (comando.ExecuteNonQuery() <= 0)
                {
                    estado = true;
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("ocurrio una exepcion : " + ex.Message);
            }
            return estado;
        }
        //-------------------------------------ELIMINAR----------------------------------//
        public bool eliminarUsuario(string rut)
        {
            bool estado = false;
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "DELETE FROM USUARIO WHERE rut = '" + rut + "';";
                comando.Connection = conn;
                if (comando.ExecuteNonQuery() < 0)
                {
                    estado = true;
                }
            }
            catch (Exception e)
            {
                Console.Write("ocurrio una excepcion : " + e.Message);
            }
            return estado;
        }
        //-----------------------------------MODIFICAR------------------------------//
        public bool modificarUsuario(string nombre, string apellido, string email, DateTime fNacimiento, string sexo, int telefono, int idTipoUsuario, string rut)
        {
            bool estado = false;
            try
            {
                Producto clase = new Producto();
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                //comando.CommandText = " UPDATE USUARIO SET NOMBRE ='" + nombre + "' ,  APELLIDO = '" + apellido + "', CLAVE ='" + clave + "', EMAIL = '" + email + "', F_NACIMIENTO = to_data(" + fNacimiento + ",'YYYYMMDD'), SEXO = '" + sexo + "', N_TELEFONO = " + telefono + ", ID_TIPO_USUARIO = " + idTipoUsuario + " WHERE rut = " + rut + ";";
                comando.Connection = conn;
                comando.CommandText = "modificar_usuario";
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.Parameters.Add("v_nombre", nombre);
                comando.Parameters.Add("v_apellido", apellido);
                comando.Parameters.Add("v_email", email);
                comando.Parameters.Add("v_nacimiento", fNacimiento);
                comando.Parameters.Add("v_sexo", sexo);
                comando.Parameters.Add("v_telefono", telefono);
                comando.Parameters.Add("v_id_tipo_usuario", idTipoUsuario);
                comando.Parameters.Add("v_rut", rut);
                if (comando.ExecuteNonQuery() < 0)
                {
                    estado = true;
                }
            }
            catch (Exception s)
            {
                Console.Write("ocurrio una excepcion : " + s.Message);
            }
            return estado;
        }
        //----------------------------------VALIDAR------------------------------------//
        public Usuario validarUsuario(String clave, String correo)
        {
            Usuario usuario = new Usuario();
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "SELECT nombre, email, rut, id_tipo_usuario FROM Usuario WHERE email ='" + correo + "' AND contrasena='" + clave + "' ";
                comando.Connection = conn;
                OracleDataReader reader = comando.ExecuteReader();
                if (reader != null)
                {
                    while (reader.Read())
                    {
                        usuario._nombre = reader.GetString(0);
                        usuario._email = reader.GetString(1);
                        usuario._rut = reader.GetString(2);
                        usuario._idTipoUsuario = reader.GetInt32(3);
                    }
                    return usuario;
                }
                else
                {
                    usuario = null;
                }
                conn.Close();
            }
            catch (Exception s)
            {
                //Console.Write("Ocurrio una excepcion aqui" + s.Message); ;
            }
            return usuario;
        }

        //----------------------------------VALIDAR------------------------------------//
        public Usuario valiUsuario(String correo, String rut)
        {
            Usuario usuario = new Usuario();
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "SELECT nombre, apellido, email, rut, n_telefono, sexo, f_nacimiento, id_tipo_usuario FROM Usuario WHERE email ='" + correo + "' AND RUT='" + rut + "' ";
                comando.Connection = conn;
                OracleDataReader reader = comando.ExecuteReader();
                if (reader != null)
                {
                    while (reader.Read())
                    {
                        usuario._nombre = reader.GetString(0);
                        usuario._apellido = reader.GetString(1);
                        usuario._email = reader.GetString(2);
                        usuario._rut = reader.GetString(3);
                        usuario._nTelefono = reader.GetInt32(4);
                        usuario._sexo = reader.GetString(5);
                        usuario._fNacimiento = reader.GetDateTime(6);
                        usuario._idTipoUsuario = reader.GetInt32(7);
                    }
                    return usuario;
                }
                else
                {
                    usuario = null;
                }
                conn.Close();
            }
            catch (Exception s)
            {
                //Console.Write("Ocurrio una excepcion aqui" + s.Message); ;
            }
            return usuario;
        }

        //----------------------------------BUSCAR-USUARIO------------------------------------//
        public Usuario buscarUsuario(String rut)
        {
            Usuario usuario = new Usuario();
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "SELECT nombre, apellido, contrasena, email FROM usuario WHERE rut = '" + rut + "';";
                comando.Connection = conn;
                OracleDataReader reader = comando.ExecuteReader();
                if (reader != null)
                {
                    while (reader.Read())
                    {
                        usuario._nombre = reader.GetString(0);
                        usuario._apellido = reader.GetString(1);
                        usuario._clave = reader.GetString(2);
                        usuario._email = reader.GetString(3);
                    }
                    conn.Close();
                }
                else
                {
                    usuario = null;
                }
                conn.Close();
            }
            catch (Exception e)
            {
                Console.Write("ocurrio una excepcion : " + e.Message);
            }
            return usuario;
        }
        //------------------------------CAMBIAR CONTRASEÑA----------------------------------//
        public bool modificarClave(string nuevaClave, string clave, string rut)
        {
            bool estado = false;
            try
            {
                string encriptada_uno = GetMD5(nuevaClave);
                string encriptada_dos = GetMD5(clave);
                Producto clase = new Producto();
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.Connection = conn;
                comando.CommandText = "modificar_clave";
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.Parameters.Add("v_NClave", encriptada_uno);
                comando.Parameters.Add("v_Clave", encriptada_dos);
                comando.Parameters.Add("v_rut", rut);
                if (comando.ExecuteNonQuery() < 0)
                {
                    estado = true;
                }
            }
            catch (Exception s)
            {
                Console.Write("ocurrio una excepcion : " + s.Message);
            }
            return estado;
        }

        //------------------------------Enviar Correo----------------------------------//
        public void enviarCorreo(string correo, string id_boleta, int total) 
        {
            using (var client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential("davi.zamorano@alumnos.duoc.cl", "unus.97183584"),
                EnableSsl = true
            })
            {
                client.Send("davi.zamorano@alumnos.duoc.cl", correo, "Boleta", "Su compra ha sido un exito Codigo:"+ id_boleta +"\nTotal:"+total+"");
            }
        }
        //------------------------------ENCRIPTAR CONTRASEÑA----------------------------------//
        public string GetMD5(string str)
        {
            MD5 md5 = MD5CryptoServiceProvider.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = md5.ComputeHash(encoding.GetBytes(str));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }
        #endregion
    }
}
