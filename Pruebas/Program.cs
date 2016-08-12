using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BiblitecaClases;
using System.Security.Cryptography;
using System;
namespace Pruebas
{
    public class Program
    {
        public static void Main(string[] args) 
        {
            Program pro = new Program();
            String clave = "123456";
            String encriptada = pro.GetMD5(clave);
            Console.WriteLine("Clave encriptada: "+encriptada.ToString());
            Console.ReadKey();
        }

        public string GetMD5(string str)
        {
            MD5 md5 = MD5CryptoServiceProvider.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = md5.ComputeHash(encoding.GetBytes(str));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }
    }
}
