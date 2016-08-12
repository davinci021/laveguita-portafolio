<%@ Page Title="" Language="C#" MasterPageFile="~/Plantilla.Master" AutoEventWireup="true" CodeBehind="laveguita.aspx.cs" Inherits="WebLaNuevaVeguita.Paginas.laveguita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <section id="1" class="slider-container" style="min-height:800px; ">
    <ul id="slider" class="slider-wrapper">
      <li class="slide-current">
        <img src="../imagenes/5.jpg" alt="Slider Imagen 1">
        <div class="caption">
          <h3 class="caption-title">Leche Soprole 1LT.</h3>
          <p>Leche larga vida entera, descremada o semi descremada 1Lt.</p>
        </div>
      </li>
        
      <li>
        <img src="../imagenes/6.jpg" alt="Slider Imagen 1">
        <div class="caption">
          <h3 class="caption-title">Coca-Cola 1LT.</h3>
          <p>Coca-Cola normal</p>
        </div>
      </li>

      <li>
        <img src="../imagenes/7.jpg" alt="Slider Imagen 1">
        <div class="caption">
          <h3 class="caption-title">Queso Mantecoso 1/4 KG.</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis, ea.</p>
        </div>
      </li>

      <li>
        <img src="../imagenes/8.jpg" alt="Slider Imagen 1">
        <div class="caption">
          <h3 class="caption-title">Papel Higiénico 8 UN. X 100 MT."</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis, ea.</p>
        </div>
      </li>
    </ul>

    <!-- Controles -->
    <ul id="slider-controls" class="slider-controls"></ul>

    <!-- Autores de las Imagenes -->
    <p class="adv">* Descuento ya aplicado a precio Internet. | ** Sólo productos seleccionados. <br></p>
  </section>
  <div id="2" style="min-height:800px; margin: 0 -20px; background-image: url('../imagenes/paisley.png');background-repeat: repeat; ">
    <asp:Label ID="lblVariable" runat="server" Text="Label"></asp:Label>
  </div>
  <div id="3" style="min-height:800px; margin: 0 -20px; background-image: url('../imagenes/congruent_pentagon.png');background-repeat: repeat; ">
  
  </div>
  <div id="4" style="min-height:800px; margin: 0 -20px; background-image: url('../imagenes/symphony.png');background-repeat: repeat; ">
  
  </div>
</asp:Content>
