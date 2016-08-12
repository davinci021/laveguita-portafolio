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
    public class Boleta
    {
        #region Accesadores y Mutadores
        private int _idBoleta;

        public int IdBoleta
        {
            get { return _idBoleta; }
            set { _idBoleta = value; }
        }
        private DateTime _fechaBoleta;

        public DateTime FechaBoleta
        {
            get { return _fechaBoleta; }
            set { _fechaBoleta = value; }
        }
        private int _total;

        public int Total
        {
            get { return _total; }
            set { _total = value; }
        }
        #endregion

        #region Constructor
        public Boleta() { }
        #endregion

        #region Metodos

        //SELECT * FROM v_boleta where ID_BOLETA = '24';
        public String ultimaBoleta()
        {
            String id = "";
            try
            {
                Conexion conexion = new Conexion();
                OracleConnection conn = new OracleConnection();
                conn = conexion.CConexion();
                conn.Open();
                OracleCommand comando = new OracleCommand();
                comando.CommandText = " SELECT max(id_boleta) FROM BOLETA ";
                comando.Connection = conn;
                OracleDataReader reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    id = reader.GetInt32(0).ToString();
                }
                conn.Close();
            }
            catch (Exception s)
            {
                Console.Write("ocurrio una execepcion " + s.Message.ToString());
            }
            return id;
        }
        #endregion
    }
}
