using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BiblitecaClases;
namespace AplicacionPruebas
{
    class Program
    {
        static void Main(string[] args)
        {
            Usuario user = new Usuario();
            String clave = "123456";
            String encriptada = user.GetMD5(clave);
            Console.WriteLine("Clave encriptada: " + encriptada.ToString());

            Venta v = new Venta();
           
            Boleta v1 = new Boleta();
            Console.Write("numero de venta : "+v1.ultimaBoleta());

          
            Console.ReadKey();
        }
    }
}
