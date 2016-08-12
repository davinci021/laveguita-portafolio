using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace WebLaNuevaVeguita
{
    public class Detalle
    {
        private DataTable tabla;

        public Detalle()
        {
            tabla = new DataTable();

            //Agregar Columnas
            tabla.Columns.Add("id_producto", Type.GetType("System.Int32"));
            tabla.Columns.Add("descripcion", Type.GetType("System.String"));
            tabla.Columns.Add("precio", Type.GetType("System.Decimal"));
            tabla.Columns.Add("stock", Type.GetType("System.Int32"));
            tabla.Columns.Add("stock_minimo", Type.GetType("System.Int32"));
            tabla.Columns.Add("proveedor", Type.GetType("System.String"));
            tabla.Columns.Add("cantidad", Type.GetType("System.Int32"));
            tabla.Columns.Add("total", Type.GetType("System.Decimal"), "precio*cantidad");

            tabla.PrimaryKey = new DataColumn[] { tabla.Columns[0] };
        }

        public DataTable getTabla
        {
            get
            {
                return tabla;
            }
        }
    }
}