<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="cliente-cambiarClave.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.cliente_cambiarClave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid col-md-4">
    <ul>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="administrador-crear-usuario.aspx">Agregar Usuario</a>
        </li>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="administrador-usuario.aspx">Modificar Usuario</a>
        </li>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="administrador-usuario.aspx">Eliminar Usuario</a>
        </li>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="administrador-usuario-listar.aspx">Listar Usuario</a>
        </li>
    </ul>
    </div>

    <div class="container-fluid col-md-8" style="border: 2px solid #00695C; background: white">
        <!--Fomrgroup-->
        <div class="form-group">
            <div class="row">
                <div class="col-xs-4">
                    <label class="control-label">Ingresar Clave Nueva</label>
                    <asp:TextBox ID="txtClaveNueva" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <label class="control-label">Confirmar Clave Nueva</label>
                    <asp:TextBox ID="txtCClaveNueva" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <label class="control-label">Clave Antigua</label>
                    <asp:TextBox ID="txtClave" runat="server" Width="208px" TextMode="Password" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <!--Fomrgroup-->
        <div class="form-group">
            <div class="row">
                <div class="col-sm-12">
                    <label class="control-label">Rut Usuario</label>
                    <asp:Label ID="lblRut" runat="server"></asp:Label>
                </div>
            </div>
        </div>
        <!--Fomrgroup-->
        <!--Fomrgroup-->
        <hr />
        <div class="form-group">
            <div class="row">
                <div class="col-xs-4">
                    <asp:Button ID="btnCambiarClave" runat="server" Text="Cambiar Clave" 
                        class="btn btn-success" onclick="btnCambiarClave_Click" />
                </div>
                <div class="col-xs-4">
                    <asp:Label ID="lblMsj" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-xs-4">

                </div>
            </div>
        </div>

        </div>
</asp:Content>
