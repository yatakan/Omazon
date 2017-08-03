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
      if (data.sum === null) {
        window.alert("在庫が足りません")
        location.reload();
      } else {
      $(".cart-price").text(data.sum);
      }
    })
    .fail(function(data){
      console.log('失敗');
    })
    return false
  });
});
