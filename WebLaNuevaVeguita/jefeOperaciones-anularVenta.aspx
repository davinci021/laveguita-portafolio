<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="jefeOperaciones-anularVenta.aspx.cs" Inherits="WebLaNuevaVeguita.jefeOperaciones_anularVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid col-md-4">
    <ul>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="producto-crear.aspx">Agregar Producto</a>
        </li>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="producto-administracion.aspx">Modificar Producto</a>
        </li>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="producto-administracion.aspx">Eliminar Producto</a>
        </li>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="producto-mostrar.aspx">Mostrar Producto</a>
        </li>
    </ul>
    </div>
    <asp:Label ID="lblRut" runat="server" Text=""></asp:Label>
    
    <div class="container-fluid col-md-8" style="border: 2px solid #00695C; background: white">
        <div class="form-group">
            <div class="row">
                <div class="col-xs-12">
                    <asp:GridView ID="GVJefeAnulacion" runat="server" 
                        onselectedindexchanged="GVJefeAnulacion_SelectedIndexChanged" Width="100%">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-xs-12">
                    <asp:Label ID="lblVenta" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-xs-12">
                    <asp:DropDownList ID="ddlEstado" runat="server">
                        <asp:ListItem>Pendiente Aprobacion</asp:ListItem>
                        <asp:ListItem>Venta Anulada</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-xs-12">
                    <asp:Button ID="btnAnular" runat="server" Text="Anular Pedido" 
                        onclick="btnAnular_Click" />
                </div>
                <div class="col-xs-12">
                    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                </div>
                <div class="col-xs-12">
                
                </div>
            </div>
        </div>
    </div>
</asp:Content>
