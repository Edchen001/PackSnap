$(function(){
  $("#geocomplete").geocomplete({
    map: ".map_canvas",
    details: "#map_info",
    detailsAttribute: "data-geo"
  });




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
  }
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


    // {
    //   e.preventDefault();
    //   geoLocation = result
    //   console.log($(e.target));
    //   var geoInfo ={};
    //   geoInfo.lat = result.geometry.location.lat();
    //   geoInfo.lng = result.geometry.location.lng();
    //   geoInfo.city = result.address_components[2];
    //   geoInfo.country = result.address_components[5];
    //   var startDate = $form.find(".itinerary_start_date_1i").val();
    //   console.log(startDate);
    //   // console.log ($form.serialize());

    //   // console.log($.param(result));



    //   // // console.log(e.target);
    //   console.log(result.geometry.location.lat());
    //   console.log(result.geometry.location.lng());
    //   // console.log(result.address_components[0]);
    //   // console.log(result.address_components[1]);
    //   // console.log(result.address_components[2]);
    //   // console.log(result.address_components[3]);
    //   // console.log(result.address_components[4]);
