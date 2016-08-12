using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using BibliotecaADO;
using System.Data;
using System.IO;
namespace BiblitecaClases
{
    public class OrdenDespacho
    {
        #region Accesadores y mutadores
        private int _idOrden;

        public int IdOrden
        {
            get { return _idOrden; }
            set { _idOrden = value; }
        }
        private string _estado;

        public string Estado
        {
            get { return _estado; }
            set { _estado = value; }
        }

        #endregion

        #region Constructor
        public OrdenDespacho() 
        {
        
        }
        #endregion

        #region Metodos
        public void ordenes() 
        {
            string nombreArchivo = "C:\\Users/nsegura/Desktop/Archivo.txt";

            using (FileStream flujoArchivo = new FileStream(nombreArchivo, FileMode.Create, FileAccess.Write, FileShare.None))
            {

                using (StreamWriter escritor = new StreamWriter(flujoArchivo))
                {

                    DataSet dt = new DataSet();

                    //dt = cls_pedido.imprimir();



                    foreach (DataRow row in dt.Tables[0].Rows)
                    {

                        escritor.WriteLine(row["contenido"].ToString());
                    }

                }

            }
        }
        #endregion
    }
}
