<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="administrador-crearUsuario.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.administador_crearUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
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
                <div class="col-sm-3">
                    <label class="control-label">Rut Usuario</label>
                    <asp:TextBox ID="txtRut" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <label class="control-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-5">
                    <label class="control-label">Apellido(s)</label>
                    <asp:TextBox ID="txtApellido" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <!--Fomrgroup-->
        <div class="form-group">
            <div class="row">
                <div class="col-xs-4">
                    <label class="control-label">Clave</label>
                    <asp:TextBox ID="txtClave" runat="server" Width="208px" TextMode="Password" class="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <label class="control-label">Celular</label>
                    <asp:TextBox ID="txtCelular" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                </div>
                    
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
        <!--Fomrgroup-->
        <div class="form-group">
            <div class="row">
                <div class="col-xs-4 selectContainer">
                    <label class="control-label">Tipo Usuario</label>
                    <asp:DropDownList ID="ddlTipoUser" runat="server" class="form-control input-sm" 
                        DataSourceID="SqlDataSource1" DataTextField="DESCRIPCION" 
                        DataValueField="ID_TIPO_USUARIO">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                        SelectCommand="SELECT * FROM &quot;TIPO_USUARIO&quot;">
                    </asp:SqlDataSource>
                </div>
                <div class="col-xs-6">
                    <label class="control-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" class="form-control"></asp:TextBox>
                </div>
            </div>

        </div>
        <!--Fomrgroup-->
        <div class="form-group">
            <div class="row">
                <div class="col-xs-4 selectContainer">
                    <label class="control-label">Genero</label>
                    <asp:DropDownList ID="ddlSexo" runat="server" class="form-control input-sm">
                        <asp:ListItem>Masculino</asp:ListItem>
                        <asp:ListItem>Femenino</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-xs-4">
                    <label class="control-label">Telefono</label>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <hr />
        <div class="form-group">
            <div class="row">
                <div class="col-xs-4">
                    <asp:Button ID="btnCrearUser" runat="server" Text="Crear Usuario" 
                        class="btn btn-success" onclick="btnCrearUser_Click" />
                </div>
                <div class="col-xs-4">
                    <asp:Label ID="lblMsj" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-xs-4">

                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
