$(document).on('click', '.btn-cancelar', function(){
  $('#comprovante_modal').closeModal();
})

$(document).on('click', "input[id^='comprovante_id_']", function(){
  $(this).parent().parent().parent().parent().toggleClass('secondary-color-lighten-3');

  if ($("input[id^='comprovante_id_']:checked").length > 0) {
    $('#btn-imprimir').removeClass('disabled')
  } else {
    $('#btn-imprimir').addClass('disabled')
  }
})

// $('#btn-imprimir')
// $("input[id^='comprovante_id_']:checked").length
