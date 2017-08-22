$(document).on('turbolinks:load', function(){
  $('.bxslider.bx1').bxSlider({
    auto: true,
    minSlides: 3,
    infiniteLoop: true,
    pager: false,
    prevText: '＜',
    nextText: '＞',
  });
  $('.bxslider.bx2').bxSlider({
  auto: true,//自動切り替えの有無
  pause:6000,//停止時間※デフォルトは4000
  speed:1000,//動くスピード※デフォルトは500
  minSlides: 3,//一度に表示させる画像の最小値
  maxSlides: 6,//一度に表示させる画像の数
  slideWidth: 160,
  slideMargin: 10,
  pager: true,
  prevText: '＜',
  nextText: '＞',
});
});
