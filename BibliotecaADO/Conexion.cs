using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.DataAccess.Client;
namespace BibliotecaADO
{
    public class Conexion
    {
        public OracleConnection m;
        private static OracleConnection conexion1 = new OracleConnection();

        public static OracleConnection Conexion2
        {
            get { return Conexion.conexion1; }
            set { Conexion.conexion1 = value; }
        }

        public OracleConnection CConexion()
        {
            OracleConnection cn = new OracleConnection("Data Source=" + "DESKTOP-GVTK485" + "; User Id=" + "LAVEGUITA" + "; Password=" + "123456" + ";");
            return cn;
        }

        public static void rutaConexion()
        {
            Conexion2.ConnectionString = "Data Source=" + "DESKTOP-GVTK485" + "; User Id=" + "LAVEGUITA" + "; Password=" + "123456" + ";";
        }

        public bool OpenConnection(string Servidor, string usuario, string pass)
        {
            try
            {
                m = new OracleConnection("Data Source=" + "DESKTOP-GVTK485" + "; User Id=" + "LAVEGUITA" + "; Password=" + "123456" + ";");
                m.Open();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool closeConnection()
        {
            try
            {
                m.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
