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

      var coordinate = {};
      coordinate.latitude = result.geometry.location.lat().toFixed(2);
      coordinate.longitude = result.geometry.location.lng().toFixed(2);
      coordinate.formatted_address = result.formatted_address
      coordinate.address = $("#geocomplete").val();

      $.ajax({
         url: $form.attr('action'),
         type: $form.attr('method'),
         dateType: 'html',
         data: {coordinate: coordinate}
       })
        .done(function(response){
          $("#append").empty();
          $('#append').append(response);
          $("#forecast_embed").attr('src', ("http://forecast.io/embed/#lat=" + coordinate.latitude + "&lon=" + coordinate.longitude + "&name=" + coordinate.formatted_address));

        });
    });
  });

  $('.banner').unslider({
    speed: 400,
    complete: function() {},
    keys: true,
    fluid: true
  });

  var unslider = $('.banner').unslider(),
  data = unslider.data('unslider');
  window.onload = function () { data.move(0); };

});




