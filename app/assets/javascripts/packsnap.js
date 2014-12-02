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
    var geoDate = $("#geocomplete_date").val();

    $("#geocomplete").trigger("geocode").bind('geocode:result', function(e, result){

      $(".banner").remove();
      $(".search_area").remove();

      var coordinate = {};
      coordinate.latitude = result.geometry.location.lat().toFixed(2);
      coordinate.longitude = result.geometry.location.lng().toFixed(2);
      coordinate.address = result.formatted_address;
      coordinate.date = geoDate;

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

new CBPGridGallery( document.getElementById( 'grid-gallery' ) );

});
