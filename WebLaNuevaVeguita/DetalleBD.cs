using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace WebLaNuevaVeguita
{
    public class DetalleBD
    {
        private DataTable registro;

        public DataTable getRegistro
        {
            get { return registro; }
        }

        //Constructor vacio
        public DetalleBD() { }

        //Constructor con parámetros que reciba el contenido del carrito
        public DetalleBD(DataTable carrito)
        {
            this.registro = carrito;

        }

        //Método que agrega un registro al carrito y retorna la confirmacion del proceso
        public String agregar(int id_producto, string descripcion, decimal precio, int stock, int stockMin, string proveedor, int cantidad)
        {
            string msj = "";

            //Buscar el registro por su codigo
            DataRow fila = registro.Rows.Find(id_producto);

            if (fila != null)
            {
                msj = "<label style='color: red'>Ya existe en el carrito</label>";
            }
            else
            {
                fila = registro.NewRow(); //Nueva Fila
                //Agregar
                fila[0] = id_producto;
                fila[1] = descripcion;
                fila[2] = precio;
                fila[3] = stock;
                fila[4] = stockMin;
                fila[5] = proveedor;
                fila[6] = cantidad;
                //Agregamos fila al registro
                registro.Rows.Add(fila);
                msj = "<label style='color: green'>Agregado al carrito</label>";
            }
            return msj;
        }

        public decimal totalizar()
        {
            decimal t = 0;
            if (registro.Rows.Count > 0)
            {
                t = (decimal)registro.Compute("Sum(total)", "");
            }
            return t;
        }
    }
}