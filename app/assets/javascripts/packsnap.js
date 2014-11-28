$(function(){

  $("#geocomplete").geocomplete({
    map: ".map_canvas",
    details: "#map_info",
    detailsAttribute: "data-geo"
  });

  $('body').on('click', '#find', function(e) {
    e.preventDefault();
    $("#geocomplete").trigger("geocode")
    .bind('geocode:result', function(e, result) {
      console.log(e.target);
      console.log(result.geometry.location.lat());
      console.log(result.geometry.location.lng());
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
  window.onload = function () {  data.move(0); };
});
