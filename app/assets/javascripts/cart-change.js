$(document).on('turbolinks:load', function() {
  $('[name="shopping[quantity]"]').change(function(){
    console.log("発火");
    var number = 0
    for (var i = 1; i <= parseInt($("table").attr("id")) ; i++) {
      if ($(".item-number-" + i).length) {
        calc = parseInt($(".select" + i).val()) * parseInt($(".item-number-" + i).text());
        number = number + calc
      }
    }
    $(".cart-price").text(number);
  });
});
