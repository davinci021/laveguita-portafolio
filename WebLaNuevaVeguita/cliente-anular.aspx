<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="cliente-anular.aspx.cs" Inherits="WebLaNuevaVeguita.clienteAnular" %>
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
    <div class="container-fluid col-md-8" style="border: 2px solid #00695C; background: white">
    <asp:Label ID="Label1" runat="server" Text="Libreta de direcciones"></asp:Label>
    <table style="width: 100%;">
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Label ID="lblRut" runat="server"></asp:Label>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;
                &nbsp;
                &nbsp;
            </td>
        </tr>
        </table>
        <hr />
    <br />Pedidos<br />
<div id="movieForm">
    <div class="form-group">
        <div class="row">
            <div class="col-xs-12">
                <asp:GridView ID="GVAnul" runat="server" 
                    onselectedindexchanged="GVAnul_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField SelectText="Anular" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</div>
    <div class="container-fluid col-md-8" style="border: 2px solid #00695C; background: white">
        <!--Fomrgroup-->
        <div class="form-group">
            <div class="row">
                <div class="col-sm-3">
                    <label class="control-label">Rut Usuario</label>
                    <asp:Label ID="lbl_IdVenta" runat="server"></asp:Label>
                </div>
                <div class="col-xs-4">
                    <asp:Button ID="btnAnular" runat="server" Text="Anular" class="btn btn-default" 
                        onclick="btnAnular_Click"/>
                </div>
                <div class="col-xs-4">
                    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                </div>
            </div>
            <div class="row">
                    <div class="col-sm-12">
                    <label class="control-label">Motivo</label>
                    <asp:TextBox ID="txtMotivo" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
            </div>
        </div>
        <!--Fomrgroup-->
    </div>
    <hr />
</div>
</asp:Content>
