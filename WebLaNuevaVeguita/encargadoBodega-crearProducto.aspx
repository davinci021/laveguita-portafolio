<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="encargadoBodega-crearProducto.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.encargadoBodega_crearProducto" %>
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
                    <label class="control-label">Descripción</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-xs-4">
                    <label class="control-label">Precio</label>
                    <asp:TextBox ID="txtPrecio" runat="server" class="form-control"></asp:TextBox>
                &nbsp;</div>

                <div class="col-xs-4">
                    <label class="control-label">Stock Min</label>
                    <asp:TextBox ID="txtStockMin" runat="server" class="form-control"></asp:TextBox>
                &nbsp;</div>

                <div class="col-xs-4">
                    <label class="control-label">Stock</label>
                    <asp:TextBox ID="txtStock" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
              <div class="col-xs-8">
                 <label class="control-label">Proveedor</label>
                 <asp:TextBox ID="txtProveedor" runat="server" class="form-control"></asp:TextBox>
                    &nbsp;</div>
             <div class="col-xs-4">
                    <label class="control-label">Imagen</label>
                <asp:TextBox ID="txtImagen" runat="server" class="form-control"></asp:TextBox>
                &nbsp;</div>
            </div>
            
        </div>
    <div class="form-group">
        <div class="row">
            <div class="col-xs-6">
                <asp:Button ID="btnAgregarProducto" runat="server" onclick="btnAgregarProducto_Click" Text="Agregar Producto" class="btn btn-primary" />
            </div>
            <div class="col-xs-6">
                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</div>
</asp:Content>
