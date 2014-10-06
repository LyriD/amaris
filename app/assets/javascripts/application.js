//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require fotorama
//= require_tree .

$(function(){
    var $fotoramaDiv = $('#fotorama').fotorama();
    var fotorama = $fotoramaDiv.data('fotorama');

    $('span.left').click(function(e){
        e.preventDefault;
        fotorama.show('<');
    });
    $('span.right').click(function(e){
        e.preventDefault;
        fotorama.show('>');
    });

    $('a.submit').click(function(){
        $('form').submit();
    });
    $('a.attach').click(function(){
        $('input[type="file"]').click();
    });


});

