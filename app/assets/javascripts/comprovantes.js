$(document).on('click', '.btn-cancelar', function(){
  $('#comprovante_modal').closeModal();
})

$(document).on('click', "input[id^='comprovante_id']", function(){
  $(this).parent().parent().parent().parent().toggleClass('secondary-color-lighten-3');

  if ($("input[id^='comprovante']:checked").length > 0) {
    $('#btn-imprimir').removeClass('disabled')
    $('#btn-imprimir').addClass('waves-effect')
  } else {
    $('#btn-imprimir').addClass('disabled')
    $('#btn-imprimir').removeClass('waves-effect')
  }
})

// $('#btn-imprimir')
// $("input[id^='comprovante_id_']:checked").length
