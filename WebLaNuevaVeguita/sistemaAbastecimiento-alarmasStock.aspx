<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="sistemaAbastecimiento-alarmasStock.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.sistemaAbastecimiento_alarmasStock" %>
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
    
    
    <div class="container-fluid col-md-8" style="border: 2px solid #00695C; background: white">
        <div class="form-group">
            <div class="row">
                <div class="col-xs-12">
                    <asp:GridView ID="GVAlarmasStock" runat="server" BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        Width="100%">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <asp:Label ID="lblRut" runat="server" Text="Label"></asp:Label>
</div>
</asp:Content>
