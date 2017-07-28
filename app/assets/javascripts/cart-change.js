$(document).on('turbolinks:load', function() {
  $('[name="shopping[quantity]"]').change(function(){
    var input = { quantity: $(this).val() }
    var item_id = parseInt($(this).parent().attr("class"));
    $.ajax({
      url: '/update_item/' + item_id,
      type: 'post',
      dataType: 'json',
      data: input
    })
    .done(function(data){
      var number = 0
      for (var i = 1; i <= parseInt($("table").attr("id")) ; i++) {
        if ($(".item-number-" + i).length) {
          calc = parseInt($(".select" + i).val()) * parseInt($(".item-number-" + i).text());
          number = number + calc
        }
      }
      $(".cart-price").text(number);
    })
    .fail(function(data){
      console.log('失敗');
    })
    return false
  });
});
