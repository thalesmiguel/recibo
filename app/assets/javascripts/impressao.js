//= require jquery
//= require jquery_ujs
//= require extenso

$(document).ready(function(){
  $('.valor-extenso').text(function(){
    $(this).text($(this).text().extenso('cur'))
  })
})
