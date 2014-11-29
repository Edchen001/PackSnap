$(function(){
  $("#geocomplete").geocomplete({
    map: ".map_canvas",
    details: "#map_info",
    detailsAttribute: "data-geo"
  });

  $("#find").click(function(){
    $("#geocomplete").trigger("geocode");
  });

  $(".itinerary-form").submit(function(){
    console.log("YEAH MAN");

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
