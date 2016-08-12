using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using BibliotecaADO;
using System.Data;
namespace BiblitecaClases
{
    public class Anulacion
    {
        #region Accesadores y Mutadores
        private int _idAnulacion;

        public int IdAnulacion
        {
            get { return _idAnulacion; }
            set { _idAnulacion = value; }
        }
        private DateTime _fechaAnulacion;

        public DateTime FechaAnulacion
        {
            get { return _fechaAnulacion; }
            set { _fechaAnulacion = value; }
        }
        private string _motivo;

        public string Motivo
        {
            get { return _motivo; }
            set { _motivo = value; }
        }
        private int _idVenta;

        public int IdVenta
        {
            get { return _idVenta; }
            set { _idVenta = value; }
        }
        #endregion
        //--------------------------------------------------------------------------------//
        #region Constructor
            public Anulacion() { }
        #endregion
        //--------------------------------------------------------------------------------//
        #region metodos
        //---------------------------------------------AGREGAR----------------------------------------------//
        public bool agregarAnulacion(string motivo, int idVenta)
        {
            bool estado = false;
            Conexion conexion = new Conexion();
            OracleConnection conn = new OracleConnection();
            conn = conexion.CConexion();
            OracleCommand comando = new OracleCommand();
            comando.Connection = conn;
            comando.CommandText = "ingresar_anulacion";
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.Add("v_motivo", motivo);
            comando.Parameters.Add("v_id_venta", idVenta);
            try
            {
                conn.Open();
                if (comando.ExecuteNonQuery() > 0)
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

        //--------------------------------------------------------------------------------//
        public DataTable modificarAnular()
        {
            DataTable tab = new DataTable();
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "SELECT * FROM v_modificar_anulacion";
                comando.Connection = conn;
                OracleDataReader reader = comando.ExecuteReader();
                tab.Load(reader);
                conn.Close();
            }
            catch (Exception s)
            {
                Console.Write("ocurrio una execepcion " + s.Message);
            }
            return tab;
        }
        #endregion
        //--------------------------------------------------------------------//
        public bool modificarAnulacion(int venta, string esta)
        {
            bool estado = false;
            Conexion conexion = new Conexion();
            OracleConnection conn = new OracleConnection();
            conn = conexion.CConexion();
            OracleCommand comando = new OracleCommand();
            comando.Connection = conn;
            comando.CommandText = "proce_anular_pedido";
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.Add("v_id_venta", venta);
            comando.Parameters.Add("v_estado", esta);
            try
            {
                conn.Open();
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
        
        //--------------------------------------------------------------------------------//
    }
}
