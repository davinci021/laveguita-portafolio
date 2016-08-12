<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="usuario-sesion.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.cliente_sesion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="CSS/estilos.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url('imagenes/supermarkets_fruit2.jpg'); background-size: 100%;">
    <form id="form1" runat="server">
    <div class="contenedor" style="background-image: url('imagenes/confectionary.png');
    background-repeat: repeat; ">
        <a href="laveguita.aspx"><h1 align="center">LaVeguita</h1></a>
        <div class="sesion left">
            <div><h3 align="center">Ya estoy registrado</h3>
            <p>Inicia sesión para continuar con la compra</p></div>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr><td><asp:Label ID="lblSesionEmail" runat="server" Text="Email"></asp:Label></td></tr>
                <tr><td class="style1"><asp:TextBox ID="txtSesionEmail" runat="server" class="inpForm"></asp:TextBox></td></tr>
                <tr><td><asp:Label ID="lblSesionClave" runat="server" Text="Contraseña"></asp:Label></td></tr>
                <tr><td><asp:TextBox ID="txtSesionClave" runat="server" class="inpForm" 
                        TextMode="Password"></asp:TextBox></td></tr>
                <tr><td>
                    <asp:Button ID="btnIniciarSesion" runat="server" Text="Ingresar" 
                        class="btn-sesion" onclick="btnIniciarSesion_Click" />
                    </td></tr>
                <tr><td>
                    <asp:Label ID="Mensaje" runat="server"></asp:Label>
                    </td></tr>
            </table>
        </div>

        <div class="sesion right">
            <div><h3 align="center">¿No estás Registrado?</h3>
            <p>Disfruta de una compra rápida y personalizada, aprovecha nuestros descuentos y promociones especiales para ti.</p></div>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr><td><asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label></td></tr>
                <tr><td><asp:TextBox ID="txtNombre" runat="server" class="inpForm" placeholder="Ingresa tu nombre"></asp:TextBox></td></tr>
                <tr><td><asp:Label ID="lblApellidos" runat="server" Text="Apellidos"></asp:Label></td></tr>
                <tr><td><asp:TextBox ID="txtApellidos" runat="server" class="inpForm" placeholder="Ingresa tus Apellidos"></asp:TextBox></td></tr>
                <tr><td><asp:Label ID="lblRut" runat="server" Text="Rut"></asp:Label></td></tr>
                <tr><td><asp:TextBox ID="txtRut" runat="server" class="inpForm" placeholder="Ingresa tu RUT sin puntos ni guión"></asp:TextBox></td></tr>
                <tr><td><asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></td></tr>
                <tr><td><asp:TextBox ID="txtEmail" runat="server" TextMode="Email" class="inpForm" placeholder="Ingrese tu e-mail"></asp:TextBox></td></tr>
                <tr><td><asp:Label ID="lblClave" runat="server" Text="Clave"></asp:Label></td></tr>
                <tr><td><asp:TextBox ID="txtClave" runat="server" TextMode="Password" class="inpForm" placeholder="Escribe tu clave"></asp:TextBox></td></tr>
                <tr><td>
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" 
                        class="btn-sesion" onclick="btnRegistrar_Click"/></td></tr>
                <tr><td>
                    <asp:Label ID="lblResultado" runat="server" ForeColor="Red" Height="15px"></asp:Label></td></tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
