<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="jefeOperaciones-reporteVentas.aspx.cs" Inherits="WebLaNuevaVeguita.jefeOperaciones_reporteVentas" %>
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
    <asp:Label ID="lblRut" runat="server" Text=""></asp:Label>
    
    <div class="container-fluid col-md-8" style="border: 2px solid #00695C; background: white">
        <div class="form-group">
            <div class="row">
                <div class="col-xs-6">
                    <asp:TextBox ID="txtDesde" runat="server" TextMode="Date"></asp:TextBox>
                </div>
            </div>
             <label class="control-label">Fecha Nacimiento</label>
                            <div class="row no-gutter">
                                <div class="col-xs-1">
                                    <asp:TextBox ID="txtDia1" runat="server" class="form-control" placeholder="Día"></asp:TextBox>
                                </div>

                                <div class="col-xs-1">
                                    <asp:TextBox ID="txtMes1" runat="server" class="form-control" placeholder="Mes"></asp:TextBox>
                                </div>

                                <div class="col-xs-1">
                                    <asp:TextBox ID="txtYear1" runat="server" class="form-control" placeholder="Año"></asp:TextBox>
                                </div>
                            </div>

                              <label class="control-label">Fecha Nacimiento<asp:Button 
                ID="btnReporte" runat="server" onclick="btnVerReporte_Click" Text="Button" />
            </label>
                            &nbsp;<div class="row no-gutter">
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
        
        
        <div class="form-group">
            <div class="row">
                <div class="col-xs-12">
                    <asp:GridView ID="GVReporte" runat="server">
                    </asp:GridView>
                </div>
            </div>
        </div>
        

</div>
</asp:Content>
