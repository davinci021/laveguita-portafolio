<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="encargadoBodega-modElimProducto.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.encargadoBodega" %>
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
                <div class="col-xs-8">
                    <label class="control-label">Codigo de Producto</label>
                    <asp:TextBox ID="txtBuscarIdPorducto" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-xs-4">
                    <asp:Button ID="btnBuscarProducto" runat="server" Text="Buscar Producto" 
                    onclick="btnBuscarProducto_Click" class="btn btn-info"/>
                </div>
                <div class="col-xs-4">
                    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-xs-4">
                    <asp:Button ID="btnCargar" runat="server" Text="Cargar Abajo" class="btn btn-success"/>
                </div>
            </div>
        </div>
        
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
                    <label class="control-label">Stock</label>
                    <asp:TextBox ID="txtStock" runat="server" class="form-control" 
                        ontextchanged="txtStock_TextChanged"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <label class="control-label">Precio</label>
                    <asp:TextBox ID="txtPrecio" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <label class="control-label">Stock Minimo</label>
                    <asp:TextBox ID="txtStockMin" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-xs-6">
                    <label class="control-label">Proveedor</label>
                    <asp:TextBox ID="txtProveedor" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-6">
                    <label class="control-label">Id. Producto</label>
                    <asp:TextBox ID="txtIdProducto" runat="server" Disable="true" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
        <div class="form-group">
            <div class="row">
                <div class="col-xs-4">
                    <asp:Button ID="btnModificarProducto" runat="server" 
                    Text="Modificar Producto" onclick="btnModificarProducto_Click" class="btn btn-primary"/>
                </div>
                <div class="col-xs-4">
                    <asp:Button ID="btnEliminarProducto" runat="server" 
                    Text="Eliminar Producto" onclick="btnEliminarProducto_Click" class="btn btn-warning"/>
                </div>
                <div class="col-xs-4">
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar Editar" 
                    onclick="btnCancelar_Click" class="btn btn-danger"/>
                </div>
            </div>
        </div>
                
                
                <asp:Label ID="lblMsjMod" runat="server" ForeColor="Red"></asp:Label>
    </div>
    <br /><br />

</asp:Content>
