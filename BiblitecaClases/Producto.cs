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
    public class Producto
    {
        #region Accesadores y mutadores
        private int _idProducto;

        public int IdProducto
        {
            get { return _idProducto; }
            set { _idProducto = value; }
        }
        private string _descripcion;

        public string Descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }
        private int _stock;

        public int Stock
        {
            get { return _stock; }
            set { _stock = value; }
        }
        private int _precio;

        public int Precio
        {
            get { return _precio; }
            set { _precio = value; }
        }
        private int _stockMin;

        public int StockMin
        {
            get { return _stockMin; }
            set { _stockMin = value; }
        }
        private string _proveedor;

        public string Proveedor
        {
            get { return _proveedor; }
            set { _proveedor = value; }
        }

        #endregion

        #region Constructor

        public Producto() { }

        #endregion

        #region Metodos
        //-------------------------------------AGREGAR-----------------------------//
        public bool agregarProducto(string descripcion, int stock, int precio, int stockMin, string proveedor)
        {
            bool estado = false;
            Conexion conexion = new Conexion();
            OracleConnection conn = new OracleConnection();
            conn = conexion.CConexion();
            OracleCommand comando = new OracleCommand();
            comando.Connection = conn;
            comando.CommandText = "ingresar_producto";
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.Add("v_descripcion", descripcion);
            comando.Parameters.Add("v_stock", stock);
            comando.Parameters.Add("v_precio", precio);
            comando.Parameters.Add("v_stock_minimo", stockMin);
            comando.Parameters.Add("v_proveedor", proveedor);
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

        //----------------------------------------LISTAR-------------------------------------//
        public List<Producto> listarProducto()
        {
            List<Producto> lista = new List<Producto>();
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "select ID_PRODUCTO from producto ";
                comando.Connection = conn;
                OracleDataReader reader = comando.ExecuteReader();
                while (reader.HasRows)
                {
                    Producto clase = new Producto();
                    clase.IdProducto = reader.GetInt32(0);
                    clase.Descripcion = reader.GetString(1);
                    clase.Stock = reader.GetInt32(2);
                    clase.Precio = reader.GetInt32(3);
                    clase.StockMin = reader.GetInt32(4);
                    clase.Proveedor = reader.GetString(5);
                    lista.Add(clase);
                }
                conn.Close();
            }
            catch (Exception s)
            {
                Console.Write("ocurrio una execepcion " + s.Message);
            }
            return lista;
        }
        //----------------------------------------BUSCAR CARGAR-------------------------------------//
        public Producto buscarProducto(int idProduc)
        {
            Producto clase = new Producto();
            Conexion conexion = new Conexion();
            OracleConnection conn = new OracleConnection();
            conn = conexion.CConexion();
            conn.Open();
            OracleCommand comando = new OracleCommand();
            comando.CommandText = "select * from producto where id_producto = " + idProduc + " ";
            comando.Connection = conn;
            OracleDataReader reader = comando.ExecuteReader();
            while (reader.Read())
            {
                clase.IdProducto = reader.GetInt32(0);
                clase.Descripcion = reader.GetString(1);
                clase.Stock = reader.GetInt32(2);
                clase.Precio = reader.GetInt32(3);
                clase.StockMin = reader.GetInt32(4);
                clase.Proveedor = reader.GetString(5);
            }
            conn.Close();

            return clase;
        }
        //---------------------------------------FILTRAR-----------------------------------------//
        public List<Producto> filtrarProducto(string descripcion)
        {
            List<Producto> lista = new List<Producto>();
            Producto pro = new Producto();
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "select * from producto where descripcion like '%" + descripcion + "%'";
                comando.Connection = conn;
                OracleDataReader reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    pro.IdProducto = reader.GetInt32(0);
                    pro.Descripcion = reader.GetString(1);
                    pro.Stock = reader.GetInt32(2);
                    pro.Precio = reader.GetInt32(3);
                    pro.StockMin = reader.GetInt32(4);
                    pro.Proveedor = reader.GetString(5);
                    lista.Add(pro);
                }
                conn.Close();
            }
            catch (Exception s)
            {
                Console.Write("ocurrio una execepcion " + s.Message);
            }
            return lista;
        }
        //--------------------------------------MODIFICAR----------------------------------------//
        public bool ModificarProducto(string descripcion, int stock, int precio, int stockMin, string proveedor, int idProducto)
        {

            bool estado = false;
            Conexion conexion = new Conexion();
            OracleConnection conn = new OracleConnection();
            conn = conexion.CConexion();
            OracleCommand comando = new OracleCommand();
            comando.Connection = conn;
            comando.CommandText = "modificar_producto";
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.Add("v_descripcion", descripcion);
            comando.Parameters.Add("v_stock", stock);
            comando.Parameters.Add("v_precio", precio);
            comando.Parameters.Add("v_stock_minimo", stockMin);
            comando.Parameters.Add("v_proveedor", proveedor);
            comando.Parameters.Add("v_id_producto", idProducto);
            try
            {
                conn.Open();
                if (comando.ExecuteNonQuery() < 0)
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
        //-----------------------------------------ELIMINAR-------------------------------------//
        public bool eliminarProducto(int cod_producto)
        {
            bool estado = false;
            Conexion conexion = new Conexion();
            OracleConnection conn = new OracleConnection();
            conn = conexion.CConexion();
            OracleCommand comando = new OracleCommand();
            comando.Connection = conn;
            comando.CommandText = "eliminar_producto";
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.Add("v_id_producto", cod_producto);
            try
            {
                conn.Open();
                if (comando.ExecuteNonQuery() < 0)
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

        public DataTable alarmasStock()
        {

            DataTable tab = new DataTable();
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = "select * from v_alarma_stock";
                //SELECT ID_PRODUCTO, DESCRIPCION, STOCK, STOCK_MINIMO, CASE WHEN STOCK >= STOCK_MINIMO THEN 'BUENO' ELSE 'CRITICO' END Estado FROM PRODUCTO"
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
