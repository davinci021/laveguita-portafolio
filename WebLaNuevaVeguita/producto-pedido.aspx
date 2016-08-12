<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="producto-pedido.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.producto_pedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid" style="border: 2px solid #00695C; background: white">
        <div class="container-fluid col-md-8">
            
            <asp:GridView ID="GVDirecciones" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ID_DIRECCION" DataSourceID="SqlDataSource1" CellPadding="4" 
                ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID_DIRECCION" HeaderText="ID_DIRECCION" 
                        ReadOnly="True" SortExpression="ID_DIRECCION" />
                    <asp:BoundField DataField="DIRECCIÓN" HeaderText="DIRECCIÓN" 
                        SortExpression="DIRECCIÓN" />
                    <asp:BoundField DataField="COMUNA" HeaderText="COMUNA" 
                        SortExpression="COMUNA" />
                    <asp:BoundField DataField="PROVINCIA" HeaderText="PROVINCIA" 
                        SortExpression="PROVINCIA" />
                    <asp:BoundField DataField="REGION" HeaderText="REGION" 
                        SortExpression="REGION" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;ID_DIRECCION&quot;, &quot;DIRECCIÓN&quot;, &quot;COMUNA&quot;, &quot;PROVINCIA&quot;, &quot;REGION&quot; FROM &quot;DIRECCION&quot; WHERE (&quot;RUT&quot; = :RUT)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblRut" Name="RUT" PropertyName="Text" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="gv_prueba" runat="server" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
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
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Ver Detalle" class="btn btn-danger"/>
            <asp:Label ID="lbl_id_boleta" runat="server"></asp:Label>
            <asp:Label ID="lbl_msj" runat="server"></asp:Label>

            <br />
            <asp:Label ID="lblRut" runat="server" Text=""></asp:Label>
            
            <br />
            <br />

            <asp:RadioButtonList ID="rbListImages" runat="server">
                <asp:ListItem Value="1" Selected=True><img src="imagenes/pagos/webpay.gif" alt="" /></asp:ListItem>
                <asp:ListItem Value="2"><img src="imagenes/pagos/bancoestado.gif" alt="" /></asp:ListItem>
                <asp:ListItem Value="3"><img src="imagenes/pagos/ripley.gif" alt="" /></asp:ListItem>
                <asp:ListItem Value="4"><img src="imagenes/pagos/webpay.gif" alt="" /></asp:ListItem>
        </asp:RadioButtonList>
            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                Text="Comprar" class="btn btn-success"/>
        </div>
        <div class="container-fluid col-md-4" style="">
            <table style="width: 100%; border:1px solid grey">
                <tr style="background: red">
                    <td colspan="2" style="color:white; font-weight:bold">RESUMEN DEL PEDIDO</td>
                </tr>
                <tr>
                    <td>Total del producto</td>
                    <td><asp:Label ID="lblTota" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>*Envío:</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Total Pedido:</td>
                    <td>$<asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></td>
                    <td>  &nbsp;</td>
                </tr>
              
            </table>
        </div>
    </div>
</asp:Content>
