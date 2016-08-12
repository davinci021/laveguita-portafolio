using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using BibliotecaADO;
namespace BiblitecaClases
{
    public class TipoUsuario
    {
        #region Accesadores y mutadores
        private int _idTipoUsuario;

        public int IdTipoUsuario
        {
            get { return _idTipoUsuario; }
            set { _idTipoUsuario = value; }
        }
        private string _descripcion;

        public string Descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }

        #endregion

        #region Constructor

        public TipoUsuario() { }

        #endregion

        #region Metodos
        //---------------------------------AGREGAR---------------------------------//
        public bool agregaTipoUsuario(String descripcion)
        {
            bool estado = false;
            Conexion conexion = new Conexion();
            OracleConnection conn = new OracleConnection();
            conn = conexion.CConexion();
            OracleCommand comando = new OracleCommand();
            comando.Connection = conn;
            comando.CommandText = "INSERT INTO TIPO_USUARIO ('" + descripcion + "')";
            try
            {
                conn.Open();
                if (comando.ExecuteNonQuery() < 0)
                {
                    estado = true;
                }
                conn.Close();
            }
            catch (Exception s)
            {
                Console.Write("ocurrio una excepcion : " + s.Message);
            }
            return estado;
        }

        //---------------------------------MODIFICAR---------------------------------//
        public bool modificarTipoUsuario(int id_tipoUsuario, String descripcion)
        {
            bool estado = false;
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();

                OracleCommand comando = new OracleCommand();
                comando.CommandText = "UPDATE tipo_usuario SET descripcion='" + descripcion + "' where id_tipo_usuario = " + id_tipoUsuario + " ";
                comando.Connection = conn;
                if (comando.ExecuteNonQuery() < 0)
                {
                    estado = true;
                }
            }
            catch (Exception s)
            {
                Console.Write("Ocurrio una excepcion : " + s.Message);
            }
            return estado;
        }
        //-------------------------------ELIMINAR--------------------------//
        public bool eliminarTipoUsuario(int id_tipoUsuario)
        {
            bool estado = false;
            try
            {
                Producto pro = new Producto();
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "DELETE FROM tipo_usuario WHERE = id_tipo_usuario " + id_tipoUsuario + " ";
                comando.Connection = conn;
                if (comando.ExecuteNonQuery() < 0)
                {
                    estado = true;
                }
            }
            catch (Exception)
            {
                throw;
            }
            return estado;
        }

        //---------------------------------LISTAR---------------------------------//
        public List<TipoUsuario> listarTipoUsuario()
        {
            List<TipoUsuario> lista = new List<TipoUsuario>();
            TipoUsuario tipo = new TipoUsuario();
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "select * from tipo_usuario ";
                comando.Connection = conn;
                OracleDataReader reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    tipo._idTipoUsuario = reader.GetInt32(0);
                    tipo._descripcion = reader.GetString(1);
                    lista.Add(tipo);
                }
                conn.Close();
            }
            catch (Exception)
            {
                throw;
            }
            return lista;
        }
        #endregion
    }
}
