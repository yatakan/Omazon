const API_KEY = '7ad16ee22be60863e7669ebd71c0ddb1'
const ABS_TMP_DIFF = 273;


$(document).on('turbolinks:load', function() {
  $('#weather-form').on('submit', function(e) {
    e.preventDefault();
    var cityName = $(this).find('#weather-form-city').prop('value');
    $.ajax('http://api.openweathermap.org/data/2.5/weather?APPID=' + API_KEY + '&q=' + cityName)
    .done(function(data) {
      $('#result-city-name').text(data.name);
      $('#result-temp').text(Math.round(data.main.temp - ABS_TMP_DIFF));
      $('#result-weather').text(data.weather[0].main);
      $('#result-datetime').text(Date(data.dt));
    })
    .fail(function(data) {
      alert('天気情報の取得に失敗しました')
    })
  });
});
