<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="cliente-misPedidos.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.cliente_misPedidos" %>
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
    
    <hr />
    <asp:Label ID="lblRut" runat="server"></asp:Label>
    <br />Mis Compras<br />

    <div id="movieForm">
        <div class="form-group">
            <div class="row">
                <div class="col-xs-12">
                    <asp:GridView ID="GVVenta" runat="server" BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        Width="50%" onselectedindexchanged="GVVenta_SelectedIndexChanged" 
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:CommandField SelectText="Seleccionar Venta" ShowSelectButton="True" />
                            <asp:BoundField DataField="id_venta" HeaderText="id Venta" />
                            <asp:BoundField DataField="FECHA" HeaderText="Fecha Venta" />
                            <asp:BoundField DataField="TOTAL" HeaderText="Total" />
                        </Columns>
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
                    <br />
                </div>
                <div class="col-xs-12">
                    <label class="control-label">Mis Pedidos</label>
                    <asp:GridView ID="GVMisPedidos" runat="server" Width="100%" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        DataKeyNames="ID_PEDIDO">
                        <Columns>
                            <asp:TemplateField HeaderText="Producto" SortExpression="ID_PRODUCTO">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("ID_PRODUCTO") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" 
                                        ImageUrl='<%# Eval("ID_PRODUCTO", "imagenes/productos/{0}.jpg") %>' 
                                        Width="75px" />
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID_PRODUCTO") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="id Venta" SortExpression="ID_VENTA">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("ID_VENTA") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblidVenta" runat="server" Text='<%# Eval("ID_VENTA") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total" SortExpression="TOTAL">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("TOTAL") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Text='<%# Eval("TOTAL") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cant" SortExpression="CANT_PRODUCTOS">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("CANT_PRODUCTOS") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCant" runat="server" Text='<%# Eval("CANT_PRODUCTOS") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha Pedido" SortExpression="FECHA_PEDIDO">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("FECHA_PEDIDO") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFechaPedido" runat="server" 
                                        Text='<%# Eval("FECHA_PEDIDO") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="id Pedido" SortExpression="ID_PEDIDO">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID_PEDIDO") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="idPedido" runat="server" Text='<%# Eval("ID_PEDIDO") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                        SelectCommand="SELECT &quot;ID_PRODUCTO&quot;, &quot;ID_VENTA&quot;, &quot;TOTAL&quot;, &quot;CANT_PRODUCTOS&quot;, &quot;FECHA_PEDIDO&quot;, &quot;ID_PEDIDO&quot; FROM &quot;PEDIDO&quot; WHERE (&quot;RUT&quot; = :RUT)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblRut" Name="RUT" PropertyName="Text" 
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    <hr />
</div>
</div>
</asp:Content>
