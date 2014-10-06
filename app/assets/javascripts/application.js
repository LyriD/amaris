//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require fotorama
//= require_tree .

var $fotorama = 0;
$(function(){
    var $fotoramaDiv = $('#fotorama').fotorama();
    $fotorama = $fotoramaDiv.data('fotorama');
    $('[data-page]').hide();
    $('[data-page='+$fotorama.activeIndex+']').show();

    $('span.left').click(function(e){
        e.preventDefault;
        $fotorama.show('<');
        $('[data-page]').hide();
        $('[data-page='+$fotorama.activeIndex+']').show();

    });
    $('span.right').click(function(e){
        e.preventDefault;
        $fotorama.show('>');
        $('[data-page]').hide();
        $('[data-page='+$fotorama.activeIndex+']').show();
    });

    $('a.submit').click(function(){
        $('form').submit();
    });
    $('a.attach').click(function(){
        $('input[type="file"]').click();
    });



});

