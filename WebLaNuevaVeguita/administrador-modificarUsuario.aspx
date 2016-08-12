<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="administrador-modificarUsuario.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.administrador_modificarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid col-md-4">
    <ul>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="administrador-crear-usuario.aspx">Agregar Usuario</a>
        </li>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="administrador-usuario.aspx">Modificar Usuario</a>
        </li>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="administrador-usuario.aspx">Eliminar Usuario</a>
        </li>
        <li class="col-md-12 menu-pro" style="border: 1px solid #F5F5F5">
            <a href="administrador-usuario-listar.aspx">Listar Usuario</a>
        </li>
    </ul>
    </div>

    <div class="container-fluid col-md-8" style="border: 2px solid #00695C; background: white">
        <!--Fomrgroup-->
        <div class="form-group">
            <div class="row">
                <div class="col-sm-3">
                    <label class="control-label">Rut Usuario</label>
                    <asp:TextBox ID="txtRut" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <label class="control-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-5">
                    <label class="control-label">Apellido(s)</label>
                    <asp:TextBox ID="txtApellido" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <!--Fomrgroup-->
        <div class="form-group">
            <div class="row">
                <div class="col-xs-4 selectContainer">
                    <label class="control-label">Genero</label>
                    <asp:DropDownList ID="ddlSexo" runat="server" class="form-control input-sm">
                        <asp:ListItem>Masculino</asp:ListItem>
                        <asp:ListItem>Femenino</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-xs-4">
                    <label class="control-label">Celular</label>
                    <asp:TextBox ID="txtCelular" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                </div>
                    
                <label class="control-label">Fecha Nacimiento</label>
                            <div class="row no-gutter">
                                <div class="col-xs-1">
                                    <asp:TextBox ID="txtDia" runat="server" class="form-control" placeholder="Día"></asp:TextBox>
                                </div>
                                <div class="col-xs-1">
                                    <asp:TextBox ID="txtMes" runat="server" class="form-control" placeholder="Mes"></asp:TextBox>
                                </div>
                                <div class="col-xs-1">
                                    <asp:TextBox ID="txtYear" runat="server" class="form-control" placeholder="Año"></asp:TextBox>
                                </div>
                            </div>
            </div>
        </div>
        <!--Fomrgroup-->
        <div class="form-group">
            <div class="row">
                <div class="col-xs-4 selectContainer">
                    <label class="control-label">Tipo Usuario</label>
                    <asp:DropDownList ID="ddlTipoUser" runat="server" class="form-control input-sm" 
                        DataSourceID="SqlDataSource1" DataTextField="DESCRIPCION" 
                        DataValueField="ID_TIPO_USUARIO">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                        
                        SelectCommand="SELECT &quot;ID_TIPO_USUARIO&quot;, &quot;DESCRIPCION&quot; FROM &quot;TIPO_USUARIO&quot; ORDER BY &quot;ID_TIPO_USUARIO&quot;">
                    </asp:SqlDataSource>
                </div>
                <div class="col-xs-6">
                    <label class="control-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" class="form-control"></asp:TextBox>
                </div>
            </div>

        </div>
        <!--Fomrgroup-->
        <div class="form-group">
            <div class="row">

            </div>
        </div>
        <hr />
        <div class="form-group">
            <div class="row">
                <div class="col-xs-4">
                    <asp:Button ID="btnModificarUser" runat="server" Text="Modificar User" 
                        class="btn btn-success" onclick="btnModificarUser_Click" />
                </div>
                <div class="col-xs-4">
                    <asp:Label ID="lblMsj" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>

        </div>

        <div class="container col-md-12" style="border: 2px solid #00695C; background: white; margin-top: 50px">
        <asp:GridView ID="GVUser" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="EMAIL" DataSourceID="SqlDataSource2" Width="100%" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
                onselectedindexchanged="GVUser_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="RUT" HeaderText="RUT" SortExpression="RUT" />
                <asp:BoundField DataField="APELLIDO" HeaderText="APELLIDO" 
                    SortExpression="APELLIDO" />
                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" 
                    SortExpression="NOMBRE" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" ReadOnly="True" 
                    SortExpression="EMAIL" />
                <asp:BoundField DataField="F_NACIMIENTO" HeaderText="F_NACIMIENTO" 
                    SortExpression="F_NACIMIENTO" />
                <asp:BoundField DataField="SEXO" HeaderText="SEXO" SortExpression="SEXO" />
                <asp:BoundField DataField="N_TELEFONO" HeaderText="N_TELEFONO" 
                    SortExpression="N_TELEFONO" />
                <asp:BoundField DataField="ID_TIPO_USUARIO" HeaderText="ID_TIPO_USUARIO" 
                    SortExpression="ID_TIPO_USUARIO" />
                <asp:CommandField />
                <asp:CommandField ShowSelectButton="True" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT &quot;RUT&quot;, &quot;APELLIDO&quot;, &quot;NOMBRE&quot;, &quot;EMAIL&quot;, &quot;F_NACIMIENTO&quot;, &quot;SEXO&quot;, &quot;N_TELEFONO&quot;, &quot;ID_TIPO_USUARIO&quot; FROM &quot;USUARIO&quot; ORDER BY &quot;ID_TIPO_USUARIO&quot;, &quot;APELLIDO&quot;">
        </asp:SqlDataSource>
    </div>
</asp:Content>
