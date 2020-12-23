//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery_ujs

$(function(){
$("#password-field").click(function() {
  // iconの切り替え
  $(this).toggleClass("fa-eye fa-eye-slash");

  // 入力フォームの取得
  var input = $(this).parent().prev("input");
  // type切替
  if (input.attr("type") == "password") {
    input.attr("type", "text");
  } else {
    input.attr("type", "password");
  }
});
});