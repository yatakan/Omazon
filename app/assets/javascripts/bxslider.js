$(document).on('turbolinks:load', function(){
  console.log('よんでるの？');
  $('.bxslider').bxSlider({
    auto: true,
    minSlides: 3
  });
});