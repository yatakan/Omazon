$(document).on ('turbolinks:load', function() {
  $(".cart-delete").on("click", function(){
    var input = $(this).parent().attr("class");
    console.log(input)
    $.ajax({
      url: '/delete_item/' + input,
      type: 'delete',
      dataType: 'json'
    })
    .done(function(data){
      console.log("成功");
      $(".cart-item-" + data.id).remove();
      if ($(".cart-item").length === 0) {
        $("#show-cart").remove();
        $("#cart-show").html(
        `<p>まだカートに何も入っていません。</p>
         <p>商品ページから「カートに入れる」を押すと、買いたい商品を選ぶことができます。</p>
         <p> カートに入れた商品が表示され、注文画面に進むことができます。</p>
         <a href="/items">トップに戻る</a>`
         )
      }
    })
    .fail(function(data){
      console.log("失敗");
    })
  });
});
