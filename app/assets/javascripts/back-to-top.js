$(document).on('turbolinks:load',function() {
  $("#back-to-top").on('click',function() {
    $('body, html').animate( { scrollTop: 0 }, 500);
    $('.unko').append('<img src="assets/book1.jpg">');
    return false;
  });
});
