<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="producto-carrito.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.producto_carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-responsive">
        <asp:GridView ID="GVPedido" runat="server" AutoGenerateColumns="False" 
            Width="100%" BorderStyle="Inset" BorderColor="#E0F2F1">
            <Columns>
                <asp:TemplateField HeaderText="Articulo">
                    <ItemTemplate>
                        <asp:Panel ID="Panel1" runat="server" Width="100%">
                            <asp:Image ID="Image2" runat="server" 
                                ImageUrl='<%# Eval("ID_PRODUCTO", "imagenes/productos/{0}.jpg") %>' class="imgPedido"/>
                            <asp:Label ID="lblDescrip" runat="server" Text='<%# Eval("descripcion") %>'></asp:Label>
                        </asp:Panel>
                    </ItemTemplate>
                    <ControlStyle BackColor="#EFF8F8" />
                    <FooterStyle BackColor="Black" BorderColor="Black" ForeColor="White" />
                    <HeaderStyle BackColor="Black" ForeColor="White" BorderColor="Black" 
                        BorderStyle="None" />
                </asp:TemplateField>
<asp:TemplateField HeaderText="Precio">
    <ItemTemplate>
        <asp:Panel ID="Panel2" runat="server" Height="75px" Width="100%" 
            CssClass="panel-label">
            <asp:Label ID="lblPre" runat="server" CssClass="control-label top-label" 
                Text='<%# Eval("precio") %>'></asp:Label>
        </asp:Panel>
    </ItemTemplate>
    <ControlStyle BackColor="#DCEDC8" />
    <HeaderStyle BackColor="Black" BorderColor="Black" BorderStyle="None" 
        ForeColor="White" />
</asp:TemplateField>
                <asp:TemplateField HeaderText="Cant">
                    <ItemTemplate>
                        <asp:Panel ID="Panel3" runat="server" CssClass="panel-label" Height="75px">
                            <asp:TextBox ID="txtCant" runat="server" ReadOnly="True" style="width:60px; border-radius:3px; border-style: none; border: 1px solid #009688" class="control-label"
                                Text='<%# Eval("cantidad") %>'></asp:TextBox>
                        </asp:Panel>
                    </ItemTemplate>
                    <ControlStyle BackColor="#FFF3E0" />
                    <HeaderStyle BackColor="Black" BorderColor="Black" BorderStyle="None" 
                        ForeColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total">
                    <ItemTemplate>
                        <asp:Panel ID="Panel4" runat="server" CssClass="panel-label" Height="75px" 
                            Width="100%">
                            <asp:Label ID="lblTot" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                        </asp:Panel>
                    </ItemTemplate>
                    <ControlStyle BackColor="#EDE7F6" />
                    <HeaderStyle BackColor="Black" BorderColor="Black" BorderStyle="None" 
                        ForeColor="White" />
                </asp:TemplateField>
                <asp:BoundField >
                <HeaderStyle BackColor="Black" ForeColor="White" BorderColor="Black" 
                    BorderStyle="None" />
                </asp:BoundField>
            </Columns>

            <FooterStyle BackColor="Black" BorderStyle="None" />

        </asp:GridView>

    <table class="table" style="background: white">
        <tbody>
        <tr style="background: red; color:White;">
            <td>Ajustes</td>
            <td></td><td></td><td></td><td></td>
        </tr>
        <tr>
            <td class="text-left">
                <asp:Label ID="lblEstado" runat="server" Text="Envio:" ></asp:Label></td>
                <td></td><td></td>
            <td><asp:Label ID="lblServ" runat="server" Text="Gratis"></asp:Label></td>
        </tr>
        <tr>
            <td></td><td></td><td></td><td>Total: $<asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></td>
        </tr>
        </tbody>
      </table>
      <div class="container-fluid">
      <div class="form-group">
        <div class="row">
            <div class="col-xs-8">

            </div>
            <div class="col-xs-3">

            </div>
        </div>

            <div class="form-group">
            <div class="row">
                <div class="col-xs-6">

                </div>
                <div class="col-xs-1">
                    <asp:TextBox ID="txtCupon" runat="server" class="form-control" placeholder="Cupón" Width="87px"></asp:TextBox>
                </div>
                <div class="col-xs-5">
                    <asp:Button ID="Button1" runat="server" Text="Actualizar" 
                        class="btn btn-primary"/>
                    <asp:Button ID="btnComprar" runat="server" Text="Realizar Pedido" 
                        class="btn btn-primary" onclick="btnComprar_Click"/>
                </div>
            </div>
        </div>
            
        </div>
    </div></div>
</asp:Content>
