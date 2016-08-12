$(document).ready(function(){
    var estado = false;
    $('#btn-toggle').on('click',function(){
      $('.seccionToggle').slideToggle();
      
      if (estado == true) {
        $(this).text("Información");
        $('body').css({"overflow": "auto"});
        estado = false;
      }else{
        $(this).text("Volver a la página");
        $('body').css({"overflow": "hidden"});
        estado = true;
      }
    });

    function validar(){
      clave1 = document.formulario.clave1.value;
      clave2 = document.formulario.clave2.value;

      if (clave1 == clave2) {
          document.formulario.submit(); 
      }else{ 
          alert("Las dos claves son distintas...");
          document.formulario.nombre.focus();
        return 0;
      } 
    };

    $('.nav li a').click(function () {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
      && location.hostname == this.hostname) {
            var $target = $(this.hash);
            $target = $target.length && $target
        || $('[name=' + this.hash.slice(1) + ']');
            if ($target.length) {
                var targetOffset = $target.offset().top;
                $('html,body')
          .animate({ scrollTop: targetOffset }, 1000);
                return false;
            }
        }
    });


    
});

