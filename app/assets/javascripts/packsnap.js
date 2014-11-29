$(function(){
  $("#geocomplete").geocomplete({
    map: ".map_canvas",
    details: "#map_info",
    detailsAttribute: "data-geo"
  });

 


  $('.new-location').submit(function(e){
    e.preventDefault();
    $("#geocomplete").trigger("geocode");
    

    console.log('Hello');
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
