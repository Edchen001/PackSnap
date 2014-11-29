$(function(){
  $("#geocomplete").geocomplete({
    map: ".map_canvas",
    details: "#map_info",
    detailsAttribute: "data-geo"
  });

<<<<<<< HEAD



  $('.new-location').submit(function(e){
    var $form = $(e.target);

    e.preventDefault();
    $("#geocomplete").trigger("geocode").bind('geocode:result', function(e, result){

        var geoInfo = {};
        console.log(result.address_components);
        geoInfo.latitude = result.geometry.location.lat();
        geoInfo.longitude = result.geometry.location.lng();
        geoInfo.address = $("#geocomplete").val();
       $.ajax({
           url: $form.attr('action'),
           type: $form.attr('method'),
           data: {geoInfo: geoInfo}
         })
       .done(function(response){
         window.location.href = response.redirect;
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
  window.onload = function () {  data.move(0); };
});
