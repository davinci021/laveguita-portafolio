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
    public class Venta
    {
        #region Accesadores y mutadores
        private int _idVenta;

        public int IdVenta
        {
            get { return _idVenta; }
            set { _idVenta = value; }
        }
        private DateTime _fechaVenta;

        public DateTime FechaVenta
        {
            get { return _fechaVenta; }
            set { _fechaVenta = value; }
        }
        private int _totalVenta;

        public int TotalVenta
        {
            get { return _totalVenta; }
            set { _totalVenta = value; }
        }
        
        private int _idBoleta;

        public int IdBoleta
        {
            get { return _idBoleta; }
            set { _idBoleta = value; }
        }
        private int _idOrden;

        public int IdOrden
        {
            get { return _idOrden; }
            set { _idOrden = value; }
        }

        #endregion

        #region Constructor
        public Venta() { }
        #endregion

        #region Metodos
        //-----------------------------------AGREGAR----------------------------------------//
        public bool agregarVenta(int total_venta)
        {
            bool estado = false;
            Conexion conexionclass = new Conexion();
            OracleConnection conn = new OracleConnection();
            conn = conexionclass.CConexion();
            OracleCommand comando = new OracleCommand();
            conn.Open();
            comando.Connection = conn;
            comando.CommandText = "INGRESAR_VENTA";
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.Add("v_total_venta", total_venta);
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
        //-------------------------------------------------------------------------------------//
        public DataTable listarVentasA(string rut)
        {
           
            DataTable tab = new DataTable();
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "SELECT DISTINCT(v.ID_VENTA), v.FECHA, v.TOTAL FROM Pedido join venta v on (v.id_venta = pedido.id_venta ) where v.FECHA >= SYSDATE-30 and RUT = '" + rut + "'";
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
        //-------------------------------------------------------------------------------------//
        public DataTable listarPedidosA(int id)
        {

            DataTable tab = new DataTable();
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "SELECT * FROM PEDIDO where ID_VENTA = '" + id + "'";
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
        //-------------------------------------------------------------------------------------//
        public DataTable reporteVentas(DateTime desde, DateTime hasta)
        {

            DataTable tab = new DataTable();
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "SELECT * FROM VENTA";
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
    }
}
