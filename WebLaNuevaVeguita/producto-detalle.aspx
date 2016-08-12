<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="producto-detalle.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.producto_detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="border: 2px solid #00695C; background: white">
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-6" style="width: 400px">
                            <asp:Image ID="imgPro" runat="server" Width="100%" />
                        </div>
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-xs-12">
                                    <label>PRODUCTO:</label>
                                    <asp:Label ID="lblDescripcion" runat="server"></asp:Label>
                                </div>
                                <div class="col-xs-12">
                                    <label>SKU:</label>
                                    <asp:Label ID="lblIdProducto" runat="server"></asp:Label>
                                </div>
                                <div class="col-xs-12">
                                    <label>STOCK:</label>
                                    <asp:Label ID="lblStock" runat="server"></asp:Label>
                                </div>
                                <div class="col-xs-12">
                                    <label>PRECIO:</label>
                                    <asp:Label ID="lblPrecio" runat="server"></asp:Label>
                                </div>
                                <div class="col-xs-12">
                                    <label>PROVEEDOR:</label>
                                    <asp:Label ID="lblProveedor" runat="server"></asp:Label>
                                </div>
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <asp:TextBox ID="txtCantidad" runat="server" min=1 
                                                class="form-control bfh-number" MaxLength="2" TextMode="Number" 
                                                Width="100%">1</asp:TextBox>
                                        </div>
                                        <div class="col-xs-6">
                                            <asp:Button ID="btnAgregar" runat="server" Text="Agregar al Carrito" 
                                                class="btn btn-success" Width="100%" onclick="btnAgregar_Click"/>
                                        </div>
                                    </div>
                                </div><br />
                                <div class="col-xs-12">
                                <br />
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <asp:Button ID="btnComprar" runat="server" Text="Ir al Carrito" 
                                                class="btn btn-warning" onclick="btnComprar_Click"/>
                                        </div>
                                        <div class="col-xs-6">
                                            <asp:Button ID="btnCancelar" runat="server" Text="Seguir Comprando" 
                                                class="btn btn-danger" onclick="btnCancelar_Click"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-8">

                        </div>
                    </div>
                </div>

                <asp:Label ID="lblStockMin" runat="server" Visible="False"></asp:Label>
                
                <asp:Label ID="lblImagen" runat="server"></asp:Label>
                
                

                

                
            </div>
</asp:Content>
