$(function(){
  var manhattan = [40.706496,-74.009113];
  $("#geocomplete").geocomplete({
    map: ".map_canvas",
    location: manhattan,
    details: "#map_info",
    detailsAttribute: "data-geo"
  });

  $('.new-location').submit(function(e){

    var $form = $(e.target);
    e.preventDefault();

    $("#geocomplete").trigger("geocode").bind('geocode:result', function(e, result){

      $(".banner").remove();
      $(".search_area").remove();
<<<<<<< HEAD
=======
      $('nav').css('background-color', 'black')
      $('nav').css('display', 'fixed')
>>>>>>> b4edf3337d24e7ab2131ab7ac9c13550e7701c3e

      var coordinate = {};
      coordinate.latitude = result.geometry.location.lat().toFixed(2);
      coordinate.longitude = result.geometry.location.lng().toFixed(2);
      coordinate.address = result.formatted_address;

      $.ajax({
         url: $form.attr('action'),
         type: $form.attr('method'),
         dateType: 'html',
         data: {coordinate: coordinate}
       })
        .done(function(response){
          $("#append").empty();
          $('#append').append(response);
          $("#forecast_embed").attr('src', ("http://forecast.io/embed/#lat=" + coordinate.latitude + "&lon=" + coordinate.longitude + "&name=" + coordinate.address+ "&color=#00aaff&font=Georgia&units=us"));

        });
    });
  });

  $('.banner').unslider({
    speed: 1200,
    keys: true,
    fluid: true
  });

  var unslider = $('.banner').unslider(),
  data = unslider.data('unslider');
  window.onload = function () {  data.move(0); };

});
