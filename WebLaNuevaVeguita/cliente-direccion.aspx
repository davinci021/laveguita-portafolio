<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="cliente-direccion.aspx.cs" Inherits="WebLaNuevaVeguita.cliente_direccion" %>
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
                <asp:GridView ID="GVDireccion" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID_DIRECCION" DataSourceID="SqlDataSource1" Width="100%" 
                    CellPadding="4" GridLines="Horizontal" BackColor="White" 
                    BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
                    <Columns>
                        <asp:BoundField DataField="DIRECCIÓN" HeaderText="DIRECCIÓN" 
                            SortExpression="DIRECCIÓN" />
                        <asp:BoundField DataField="COMUNA" HeaderText="COMUNA" 
                            SortExpression="COMUNA" />
                        <asp:BoundField DataField="PROVINCIA" HeaderText="PROVINCIA" 
                            SortExpression="PROVINCIA" />
                        <asp:BoundField DataField="REGION" HeaderText="REGION" 
                            SortExpression="REGION" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT &quot;ID_DIRECCION&quot;, &quot;DIRECCIÓN&quot;, &quot;COMUNA&quot;, &quot;PROVINCIA&quot;, &quot;REGION&quot; FROM &quot;DIRECCION&quot; WHERE (&quot;RUT&quot; = :RUT2)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblRut" Name="RUT2" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;
                &nbsp;
            </td>
        </tr>
        </table>
        <hr />
    <br />Agregar Direcciones<br />
<div id="movieForm">
    <div class="form-group">
        <div class="row">
            <div class="col-xs-8">
                <label class="control-label">Nombre Contacto</label>
                <asp:TextBox ID="txtNombreContacto" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-xs-4">
                <label class="control-label">Rut de Contacto</label>
                <asp:TextBox ID="txtRutContacto" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col-sm-10">
                <label class="control-label">Calle</label>
                <asp:TextBox ID="txtCalle" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-xs-2">
                <label class="control-label">Numero</label>
                <asp:TextBox ID="txtNroCasa" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
    </div>
           
    <div class="form-group">
        <div class="row">
            <div class="col-xs-4 selectContainer">
                <label >Region</label>
                <asp:DropDownList ID="ddlRegion" runat="server" class="form-control">
                    <asp:ListItem>Region Metropolitana</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-xs-4 selectContainer">
                <label>Provincia</label>
                <asp:DropDownList ID="ddlProvincia" runat="server" class="form-control">
                    <asp:ListItem>Talagante</asp:ListItem>
                    <asp:ListItem>Melipilla</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-xs-4 selectContainer">
                <label >Comuna</label>
                <asp:DropDownList ID="ddlComuna" runat="server" class="form-control">
                    <asp:ListItem Selected="true">Melipilla</asp:ListItem>
                    <asp:ListItem>Talagante</asp:ListItem>
                    <asp:ListItem>Alhué</asp:ListItem>
                    <asp:ListItem>Bollenar</asp:ListItem>
                    <asp:ListItem>San Pedro</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <asp:Button ID="btnAgregarDir" runat="server" 
                    Text="Agregar Direccion" class="btn btn-default" 
        onclick="btnAgregarDir_Click"/>
    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    <hr />
</div>

</div>
</asp:Content>
