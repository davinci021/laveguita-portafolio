<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="producto-catalogo.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.producto_catalogo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
    <table style="width:90%;">
    <tr>
        <td colspan="2">
            Listado Productos</td>
    </tr>
    <tr>
        <td class="style1">
            &nbsp;</td>
        <td rowspan="2">

            <asp:GridView ID="GVProducto" runat="server"  AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="ID_PRODUCTO" 
                DataSourceID="SqlDataSource2" BackColor="White" 
                BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                GridLines="Horizontal" RowHeaderColumn="4" Visible="False" 
                AllowSorting="True" HorizontalAlign="Left" Width="100%">
                <AlternatingRowStyle HorizontalAlign="Left" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:TemplateField HeaderText="PRODUCTO">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageAlign="Left" 
                                ImageUrl='<%# Eval("ID_PRODUCTO", "imagenes/productos/{0}.jpg") %>' class="img-thumbnail" alt="Thumbnail Image"/>
                            <br />
                            Codigo:
                            <asp:Label ID="lblCodProducto" runat="server" Text='<%# Eval("ID_PRODUCTO") %>'></asp:Label>
                            <br />
                            Descripcion:<asp:Label ID="lblDescripcion" runat="server" 
                                Text='<%# Eval("DESCRIPCION") %>'></asp:Label>
                            <br />
                            Stock:<asp:Label ID="lblStock" runat="server" Text='<%# Eval("STOCK") %>'></asp:Label>
                            <br />
                            Precio:<asp:Label ID="lblPrecio" runat="server" 
                                Text='<%# Eval("PRECIO") %>'></asp:Label>
                            <br />
                            Stock Minimo:<asp:Label ID="lblStockMin" runat="server" 
                                Text='<%# Eval("STOCK_MINIMO") %>'></asp:Label>
                            <br />
                            Proveedor:<asp:Label ID="lblProveedor" runat="server" 
                                Text='<%# Eval("PROVEEDOR") %>'></asp:Label>
                            <br />
                            <asp:Button ID="btnSeleccionar" runat="server" class="btn btn-success" 
                                Text="Ver Producto" onclick="btnSeleccionar_Click" />
                            <br />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle HorizontalAlign="Left" />
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;ID_PRODUCTO&quot;, &quot;DESCRIPCION&quot;, &quot;STOCK&quot;, &quot;PRECIO&quot;, &quot;STOCK_MINIMO&quot;, &quot;PROVEEDOR&quot; FROM &quot;PRODUCTO&quot;">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;PRODUCTO&quot; WHERE &quot;ID_PRODUCTO&quot; = :original_ID_PRODUCTO AND &quot;DESCRIPCION&quot; = :original_DESCRIPCION AND &quot;STOCK&quot; = :original_STOCK AND &quot;PRECIO&quot; = :original_PRECIO AND &quot;STOCK_MINIMO&quot; = :original_STOCK_MINIMO AND &quot;PROVEEDOR&quot; = :original_PROVEEDOR AND &quot;IMAGEN&quot; = :original_IMAGEN" 
                InsertCommand="INSERT INTO &quot;PRODUCTO&quot; (&quot;ID_PRODUCTO&quot;, &quot;DESCRIPCION&quot;, &quot;STOCK&quot;, &quot;PRECIO&quot;, &quot;STOCK_MINIMO&quot;, &quot;PROVEEDOR&quot;, &quot;IMAGEN&quot;) VALUES (:ID_PRODUCTO, :DESCRIPCION, :STOCK, :PRECIO, :STOCK_MINIMO, :PROVEEDOR, :IMAGEN)" 
                OldValuesParameterFormatString="original_{0}" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM &quot;PRODUCTO&quot;" 
                UpdateCommand="UPDATE &quot;PRODUCTO&quot; SET &quot;DESCRIPCION&quot; = :DESCRIPCION, &quot;STOCK&quot; = :STOCK, &quot;PRECIO&quot; = :PRECIO, &quot;STOCK_MINIMO&quot; = :STOCK_MINIMO, &quot;PROVEEDOR&quot; = :PROVEEDOR, &quot;IMAGEN&quot; = :IMAGEN WHERE &quot;ID_PRODUCTO&quot; = :original_ID_PRODUCTO AND &quot;DESCRIPCION&quot; = :original_DESCRIPCION AND &quot;STOCK&quot; = :original_STOCK AND &quot;PRECIO&quot; = :original_PRECIO AND &quot;STOCK_MINIMO&quot; = :original_STOCK_MINIMO AND &quot;PROVEEDOR&quot; = :original_PROVEEDOR AND &quot;IMAGEN&quot; = :original_IMAGEN">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID_PRODUCTO" Type="Decimal" />
                    <asp:Parameter Name="original_DESCRIPCION" Type="String" />
                    <asp:Parameter Name="original_STOCK" Type="Decimal" />
                    <asp:Parameter Name="original_PRECIO" Type="Decimal" />
                    <asp:Parameter Name="original_STOCK_MINIMO" Type="Decimal" />
                    <asp:Parameter Name="original_PROVEEDOR" Type="String" />
                    <asp:Parameter Name="original_IMAGEN" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID_PRODUCTO" Type="Decimal" />
                    <asp:Parameter Name="DESCRIPCION" Type="String" />
                    <asp:Parameter Name="STOCK" Type="Decimal" />
                    <asp:Parameter Name="PRECIO" Type="Decimal" />
                    <asp:Parameter Name="STOCK_MINIMO" Type="Decimal" />
                    <asp:Parameter Name="PROVEEDOR" Type="String" />
                    <asp:Parameter Name="IMAGEN" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DESCRIPCION" Type="String" />
                    <asp:Parameter Name="STOCK" Type="Decimal" />
                    <asp:Parameter Name="PRECIO" Type="Decimal" />
                    <asp:Parameter Name="STOCK_MINIMO" Type="Decimal" />
                    <asp:Parameter Name="PROVEEDOR" Type="String" />
                    <asp:Parameter Name="IMAGEN" Type="Decimal" />
                    <asp:Parameter Name="original_ID_PRODUCTO" Type="Decimal" />
                    <asp:Parameter Name="original_DESCRIPCION" Type="String" />
                    <asp:Parameter Name="original_STOCK" Type="Decimal" />
                    <asp:Parameter Name="original_PRECIO" Type="Decimal" />
                    <asp:Parameter Name="original_STOCK_MINIMO" Type="Decimal" />
                    <asp:Parameter Name="original_PROVEEDOR" Type="String" />
                    <asp:Parameter Name="original_IMAGEN" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            
        </td>
    </tr>
    <tr>
        <td class="style1">
            
        </td>
    </tr>
    </table>
</div>
<div class="container-fluid">
    <asp:DataList ID="dlProducto" runat="server" DataSourceID="SqlDataSource2" 
                RepeatColumns="4" onitemcommand="dlProducto_ItemCommand" Width="100%">
                <ItemTemplate>
                <div style="background: white" class="container-fluid">
                    <div class="row">
                        <div style="width:200px; height:200px">
                            <asp:Image ID="Image1" runat="server" ImageAlign="Left" 
                                ImageUrl='<%# Eval("ID_PRODUCTO", "imagenes/productos/{0}.jpg") %>' Width="100%" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                        <label class="control-label">Codigo:</label>
                        <span class="label label-success"><asp:Label ID="lblCodProducto" runat="server" Text='<%# Eval("ID_PRODUCTO") %>' ></asp:Label></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                        <label class="control-label">Descripcion:</label><span class="label label-primary"><asp:Label ID="lblDescripcion" runat="server" 
                                    Text='<%# Eval("DESCRIPCION") %>' ></asp:Label></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                        <label class="control-label">Stock:</label>
                        <span class="label label-info"><asp:Label ID="lblStock" runat="server" Text='<%# Eval("STOCK") %>' ></asp:Label></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                        <label class="control-label">Precio:</label>
                        <span class="label label-success"><asp:Label ID="lblPrecio" runat="server" Text='<%# Eval("PRECIO") %>' ></asp:Label></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                        <label class="control-label">Stock Minimo:</label>
                        <span class="label label-danger"><asp:Label ID="lblStockMin" runat="server" 
                                    Text='<%# Eval("STOCK_MINIMO") %>' ></asp:Label></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                        <label class="control-label">Proveedor:</label>
                        <span class="label label-warning"><asp:Label ID="lblProveedor" runat="server" 
                                    Text='<%# Eval("PROVEEDOR") %>' ></asp:Label></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                        <asp:Button ID="btnSeleccionar" runat="server" Text="Ver Producto" 
                                    class="btn btn-success" />
                        </div>
                    </div>
                    
                </div>
                </ItemTemplate>
            </asp:DataList>
</div>

</asp:Content>
