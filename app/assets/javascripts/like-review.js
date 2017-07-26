$(document).on ('turbolinks:load', function() {
  function buildHTML(data) {
    return false;
  }
  $(".review-yes").on("click", function(){
    var review_number = { number: $(this).parent().attr("class") };
    $.ajax({
      url: "/review_rate",
      type: "POST",
      dataType: "json",
      data: review_number
    })
    .done(function(data){
      buildHTML(data)
      var like = ".is-this-cool-" + data.id
      $(like).html( "参考になった数" + data.like );
      console.log('呼び出し')
    })
    .fail(function(data){
      console.log("失敗");
    })
    return false;
  });
});
