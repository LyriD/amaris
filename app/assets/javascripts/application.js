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
    if ($('body').hasClass('gallery')) {
        $('[data-page='+$fotorama.activeIndex+']').show();  }

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


var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;

$(function(){$("#new_inquiry").submit(function(){
//    alert(1);

    var isFormValid = true;
    $("#new_inquiry .req").each(function(){ // Note the :text
//            alert(1);

        if ($.trim($(this).val()).length == 0){
            $(this).addClass("error");
            isFormValid = false;
        } else {

            if ($(this).hasClass('email')) {
                if (!pattern.test($(this).val())) {
                    isFormValid = false;
                    alert("неверно введен email");
                }
            }

            $(this).removeClass("error");
        }
    });

    if (!isFormValid) alert("Пожалуйста заполните все обязательные поля");
    if ($('#new_inquiry .email').length) {
        if (!pattern.test($('#new_inquiry .email').val())) {
            isFormValid = false;
            alert("неверно введен email");
        }  }

    return isFormValid;
});});
