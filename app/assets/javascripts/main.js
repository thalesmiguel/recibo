$(document).on('turbolinks:load', function(){
  // $('.modal-trigger').leanModal();
  $('select').material_select();
  $('.collapsible').collapsible();
  $(".dropdown-button").dropdown();


  $(document).ajaxStart(function() { Pace.restart(); });
  // $(".button-collapse").sideNav();
  // $("select[required]").css({display: "block", height: 0, padding: 0, width: 0, position: 'absolute'});

  // Mouse Trap
  // Mousetrap.bind(['command+p', 'ctrl+p'], function(e) {
  //   $('a[data-target="impressao_modal"]').click();
  //   return false;
  // });

  valida_formulario();
});

// Material Design Alert
$(function() {
  $.rails.allowAction = function(link) {
    if (!link.attr('data-confirm')) {
      return true;
    }
    $.rails.showConfirmDialog(link);
    return false;
  };

  $.rails.confirmed = function(link) {
    link.removeAttr('data-confirm');
    return link.trigger('click.rails');
  };

  $.rails.showConfirmDialog = function(link) {
    var html, message;
    message = link.attr('data-confirm');
    html = "<div id=\"modal1\" class=\"modal\" style=\"z-index: 1003; width: 30%; display: block; opacity: 1; transform: scaleX(1); top: 10%;\"> <div class=\"modal-content\"><h4>Atenção</h4><p>" + message + "</p></div><div class=\"modal-footer\"><a class=\"modal-action modal-close waves-effect waves-light btn secondary-color close\">Cancelar</a><a class=\"modal-action modal-close btn red darken-3 waves-effect waves-light confirm m-r-5\">Confirmar</a></div></div>";
    $('body').append(html);
    $('#modal1').openModal({
      complete: function() {
        $('#modal1').remove();
      }
    });
    return $('#modal1 .confirm').on('click', function() {
      return $.rails.confirmed(link);
    });
    return $('#modal1 .close').on('click', function() {
      return $('#modal1').closeModal();
    });
  };
});

function valida_formulario() {
  //Validação dos botôes dos formulários
  $('form').each(function(){$(this).data('serialized', $(this).serialize())})
    .on('change input', function(){
      $(this)
        .find('input:submit, button:submit, input:reset, button:reset')
        .prop('disabled', $(this).serialize() == $(this).data('serialized'));
    })
      .find('input:submit, button:submit, input:reset, button:reset')
      .prop('disabled', true);

    $('form').bind('reset', function() {
      $(this).find('input:submit, button:submit, input:reset, button:reset').prop('disabled', true);
    });
}
