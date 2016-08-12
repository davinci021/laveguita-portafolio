using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using BibliotecaADO;
namespace BiblitecaClases
{
    public class Pedido
    {
        #region Accesadores y mutadores
        private int _idPedido;

        public int IdPedido
        {
            get { return _idPedido; }
            set { _idPedido = value; }
        }
        private DateTime _fechaPedido;

        public DateTime FechaPedido
        {
            get { return _fechaPedido; }
            set { _fechaPedido = value; }
        }
        private int _cantProductos;

        public int CantProductos
        {
            get { return _cantProductos; }
            set { _cantProductos = value; }
        }
        private int _total;

        public int Total
        {
            get { return _total; }
            set { _total = value; }
        }
        private string _rut;

        public string Rut
        {
            get { return _rut; }
            set { _rut = value; }
        }
        private int _idProducto;

        public int IdProducto
        {
            get { return _idProducto; }
            set { _idProducto = value; }
        }
        private int _idVenta;

        public int IdVenta
        {
            get { return _idVenta; }
            set { _idVenta = value; }
        }

        
        #endregion

        #region Constructor
        public Pedido() { }
        #endregion

        #region Metodos
        //---------------------------------------------AGREGAR----------------------------------------------//
        public bool agregarAnulacion(DateTime fechaPedido, int cantProductos, int total, string rut, int idProducto)
        {
            bool estado = false;
            Conexion conexion = new Conexion();
            OracleConnection conn = new OracleConnection();
            conn = conexion.CConexion();
            OracleCommand comando = new OracleCommand();
            comando.Connection = conn;
            comando.CommandText = "INSERT INTO anulacion VALUES ( '" + fechaPedido + "', " + cantProductos + ", " + total + ", " + rut + ", " + idProducto + " )";
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

        //--------------------------------------------MODIFICAR-------------------------------------------------//
        public bool modificarAnulacion(DateTime fechaPedido, int cantProductos, int total, string rut, int idProducto)
        {
            bool estado = false;
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();

                OracleCommand comando = new OracleCommand();
                comando.CommandText = "UPDATE PEDIDO SET FECHA_PEDIDO ='" + fechaPedido + "', CANT_PRODUCTOS = " + cantProductos + ", TOTAL = " + total + ", RUT = '" + rut + "', ID_PRODUCTO = " + idProducto + " WHERE ID_PEDIDO = " + IdPedido + " ";
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


        //-----------------------------------ELIMINAR-----------------------------------//
        public bool eliminarPedido(int idPedido)
        {
            bool estado = false;
            Conexion conexion = new Conexion();
            OracleConnection conn = new OracleConnection();
            conn = conexion.CConexion();
            OracleCommand comando = new OracleCommand();
            comando.Connection = conn;
            comando.CommandText = "DELETE FROM PEDIDO WHERE ID_PEDIDO = " + idPedido + ";";
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
        //-----------------------------------Insertar Pedido-----------------------------------//
        public bool insertarPedidos(string rut, int cantidad, int total, int id_producto)
        {
            bool estado = false;
            try
            {
                Producto clase = new Producto();
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                OracleCommand comando = new OracleCommand();
                comando.Connection = conn;
                conn.Open();
                    comando.CommandText = "ingresar_pedido";
                    comando.CommandType = System.Data.CommandType.StoredProcedure;
                    comando.Parameters.Add("v_cant_producto", cantidad);
                    comando.Parameters.Add("v_total_pedido", total);
                    comando.Parameters.Add("v_rut", rut);
                    comando.Parameters.Add("v_id_producto", id_producto);
                    if (comando.ExecuteNonQuery() < 0)
                    {
                        estado = true;
                    } conn.Close();
            }
            catch (Exception s)
            {
                Console.Write("Ocurrio un error");
            }
            return estado;
        }


        /*---------------Listar Pedido-------------*/
        public List<Pedido> ListarPrueba(DataTable lista)
        {
            List<Pedido> lista1 = new List<Pedido>();
            try
            {
                Producto clase = new Producto();
              
                for (int i = 0; i < lista.Rows.Count; i++)
                {
                    DataRow fila = lista.Rows[i];
                    int id_producto = int.Parse(fila["id_producto"].ToString());
                    int total = int.Parse(fila["total"].ToString());
                    int cantidad = int.Parse(fila["cantidad"].ToString());
                    Pedido clasePedido = new Pedido();
                    clasePedido.IdProducto = id_producto;
                    clasePedido.Total = total;
                    clasePedido.CantProductos = cantidad;
                    lista1.Add(clasePedido);
                }
            }
            catch (Exception s)
            {
                Console.Write("Ocurrio un error");
            }
            return lista1;
        }
        /**/
        #endregion
    }
}
