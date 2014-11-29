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
           dateType: 'html',
           data: {geoInfo: geoInfo}
        })
      .done(function(response){
        console.log(response);
        $('body').append(response);
      });
    });
  });

  var unslider = $('.banner').unslider(),
  data = unslider.data('unslider');
  window.onload = function () {  data.move(0); };

});