$(document).on('turbolinks:load', function() {
  var stars = $('.select-stars').val();
  console.log(stars)
  for(i = 1; i <= stars; i++){
    console.log("何回よばれた？")
    $(".star-" + i).text("★")
  }
  $(".star-1").on("click",
    function(){
     $(this).text("★");
     $(".star-2").text("☆");
     $(".star-3").text("☆");
     $(".star-4").text("☆");
     $(".star-5").text("☆");
     $('.select-stars').val(1);
    });
  $(".star-2").on("click",
    function(){
     $(this).text("★");
     $(".star-1").text("★");
     $(".star-3").text("☆");
     $(".star-4").text("☆");
     $(".star-5").text("☆");
     $('.select-stars').val(2);
  });
  $(".star-3").on("click",
    function(){
     $(this).text("★");
     $(".star-1").text("★");
     $(".star-2").text("★");
     $(".star-4").text("☆");
     $(".star-5").text("☆");
     $('.select-stars').val(3);
  });
  $(".star-4").on("click",
    function(){
      $(this).text("★");
      $(".star-1").text("★");
      $(".star-2").text("★");
      $(".star-3").text("★");
      $(".star-5").text("☆");
      $('.select-stars').val(4);
    });
  $(".star-5").on("click",
    function(){
     $(this).text("★");
     $(".star-1").text("★");
     $(".star-2").text("★");
     $(".star-3").text("★");
     $(".star-4").text("★");
     $('.select-stars').val(5);
  });
});
