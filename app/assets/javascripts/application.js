// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap_sb_admin_base_v2
//= require bootstrap-select
//= require sweetalert
//= require maskedinput
//= require jquery-ui/widgets/datepicker
//= require jquery-ui/i18n/datepicker-pt-BR
//= require filterrific/filterrific-jquery


/* bootstrap-datepicker */
$(function() {
  $('.datepicker').datepicker();
});


/* maskedinput */
jQuery(function($){
   $(".phone").mask("(99) ?99999-9999");
   $(".cpf").mask("999.999.999-99");
   $(".cnpj").mask("99.999.999/9999-99");

});

/* Sobrescreve da-confirm do Rails */

$.rails.allowAction = function(element){
    var message = element.attr('data-confirm');
    if (!message) { return true; }

   swal({
        title: "Cuidado está operação não poderá ser desfeita?",
        text: message,
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sim, desejo apagar!",
        cancelButtonText: "Não, cancelar essa ação!",
        closeOnConfirm: false
    },
    function(){
        element.removeAttr('data-confirm');
        element.trigger('click.rails');
    });

    return false;
}


