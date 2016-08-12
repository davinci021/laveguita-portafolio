<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="cliente-modificar.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.cliente_modificar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid col-md-4">
    <ul>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="usuario-modificar.aspx">Modificar Usuario</a>
        </li>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="producto-administracion.aspx">Cambiar Clave</a>
        </li>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="producto-administracion.aspx">Historial de Pedidos</a>
        </li>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="usuario-direcciones.aspx">Mis Direcciones</a>
        </li>
    </ul>
    </div>
    <!------>
    <div class="container-fluid col-md-8" style="border: 2px solid #00695C; background: white">
        <div class="form-group">
            <div class="row">
                <div class="col-xs-6">
                    <label class="control-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" class="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-6">
                    <label class="control-label">Confirmar Email</label>
                    <asp:TextBox ID="txtCEmail" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <hr />
        <div class="form-group">
            <div class="row">
                <div class="col-xs-4">
                    <label class="control-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <label class="control-label">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <label class="control-label">Rut</label>
                    <asp:Label ID="lblRut" runat="server"></asp:Label>
                    
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-xs-2">
                    <label class="control-label">Nacionalidad</label>
                    <asp:TextBox ID="txtNacionalidad" runat="server" class="form-control" 
                        Text="Chilena" value="Chilena"></asp:TextBox>
                </div>
                <div class="col-xs-2 selectContainer">
                    <label class="control-label">Genero</label>
                    <asp:DropDownList ID="ddlSexo" runat="server" class="form-control input-sm">
                        <asp:ListItem>Masculino</asp:ListItem>
                        <asp:ListItem>Femenino</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-xs-4">
                    <label class="control-label">Telefono</label>
                    <asp:TextBox ID="txtCelular" runat="server" class="form-control"></asp:TextBox>
                </div>
                <!--0000000000000000000000000000000000000000000000000000000000000000000000-->
                
                        <label class="control-label">Fecha Nacimiento</label>
                            <div class="row no-gutter">
                                <div class="col-xs-1">
                                    <asp:TextBox ID="txtDia" runat="server" class="form-control" placeholder="Día"></asp:TextBox>
                                </div>

                                <div class="col-xs-1">
                                    <asp:TextBox ID="txtMes" runat="server" class="form-control" placeholder="Mes"></asp:TextBox>
                                </div>

                                <div class="col-xs-1">
                                    <asp:TextBox ID="txtYear" runat="server" class="form-control" placeholder="Año"></asp:TextBox>
                                </div>
                            </div>
            </div>
        </div>
        <hr />
        <div class="form-group">
            <div class="row">
                <div class="col-xs-6">
                    <asp:Button ID="btnModUserAdmin" runat="server" Text="Modificar Usuario" 
                    onclick="btnModUserAdmin_Click" class="btn btn-success"/>
                </div>
                <div class="col-xs-6">
                    <asp:Label ID="lblMsjMod" runat="server" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblCorreo" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>

    <asp:Label ID="Label11" runat="server" Text="Direcciones"></asp:Label>
    <asp:GridView ID="GVDireccion" runat="server">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
