using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using BibliotecaADO;
namespace BiblitecaClases
{
    public class Direccion
    {
        #region Accesadores y mutadores
            private int _idDireccion;

            public int IdDireccion
            {
                get { return _idDireccion; }
                set { _idDireccion = value; }
            }
            private string _direccion;

            public string Direccion1
            {
                get { return _direccion; }
                set { _direccion = value; }
            }
            private string _comuna;

            public string Comuna
            {
                get { return _comuna; }
                set { _comuna = value; }
            }
            private string _provincia;

            public string Provincia
            {
                get { return _provincia; }
                set { _provincia = value; }
            }
            private string _region;

            public string Region
            {
                get { return _region; }
                set { _region = value; }
            }
            private String _rut;

            public String Rut
            {
                get { return _rut; }
                set { _rut = value; }
            }
        #endregion

        #region Constructor
            public Direccion() { }
        #endregion

        #region Metodos
            //---------------------------------------------AGREGAR----------------------------------------------//
            public bool agregarDireccion(string direccion, string comuna, string provincia, string region, string rut)
            {
                bool estado = false;
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                OracleCommand comando = new OracleCommand();
                comando.Connection = conn;
                comando.CommandText = "ingresar_direccion";
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.Parameters.Add("v_direccion", direccion);
                comando.Parameters.Add("v_comuna", comuna);
                comando.Parameters.Add("v_provincia", provincia);
                comando.Parameters.Add("v_region", region);
                comando.Parameters.Add("v_rut", rut);
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

            //--------------------------------------------MODIFICAR-------------------------------------------------//
            public bool modificarDireccion(int id_direccion, string direccion, string comuna, string provincia, string region, string rut)
            {
                bool estado = false;
                try
                {
                    Conexion conexion = new Conexion();
                    OracleConnection conn = new OracleConnection();
                    conn = conexion.CConexion();
                    conn.Open();
                    OracleCommand comando = new OracleCommand();
                    comando.Connection = conn;
                    comando.CommandText = "modificar_direccion";
                    comando.CommandType = System.Data.CommandType.StoredProcedure;
                    comando.Parameters.Add("v_id_direccion", id_direccion);
                    comando.Parameters.Add("v_direccion", direccion);
                    comando.Parameters.Add("v_comuna", comuna);
                    comando.Parameters.Add("v_provincia", provincia);
                    comando.Parameters.Add("v_region", region);
                    comando.Parameters.Add("v_rut", rut);
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
            public bool eliminarDireccion(int idDireccion)
            {
                bool estado = false;
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                OracleCommand comando = new OracleCommand();
                comando.Connection = conn;
                comando.CommandText = "DELETE FROM DIRECCION WHERE = " + idDireccion + ";";
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
            //-----------------------------------LISTAR-----------------------------------//
            public List<Direccion> listarDireccion()
            {
                List<Direccion> lista = new List<Direccion>();
                Direccion direccion = new Direccion();
                try
                {
                    Conexion conexion = new Conexion();
                    OracleConnection conn = new OracleConnection();
                    conn = conexion.CConexion();
                    conn.Open();

                    OracleCommand comando = new OracleCommand();
                    comando.CommandText = "select * from direccion ";
                    comando.Connection = conn;
                    OracleDataReader reader = comando.ExecuteReader();

                    while (reader.Read())
                    {
                        direccion._idDireccion = reader.GetInt32(0);
                        direccion.Direccion1 = reader.GetString(1);
                        direccion.Comuna = reader.GetString(2);
                        direccion.Provincia = reader.GetString(3);
                        direccion.Region = reader.GetString(4);
                        direccion.Rut = reader.GetString(5);

                        lista.Add(direccion);
                    }
                    conn.Close();
                }
                catch (Exception s)
                {
                    Console.Write("ocurrio una execepcion " + s.Message);
                }
                return lista;
            }
        #endregion
    }
}
