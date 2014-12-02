function Coordinate (result, inputDate) {
  this.latitude = result.geometry.location.lat().toFixed(2);
  this.longitude = result.geometry.location.lng().toFixed(2);
  this.address = result.formatted_address;
  this.date = inputDate;
}

$(function(){
  $("#geocomplete").geocomplete({
    detailsAttribute: "data-geo"
  });

  $('.new-location').submit(function(e){
    e.preventDefault();
    var $form = $(e.target);
    var inputDate = $("#geocomplete_date").val();

    $("#geocomplete").trigger("geocode").bind('geocode:result', function(e, result){

      $(".banner").remove();
      $(".search_area").remove();

      var coordinate = new Coordinate(result, inputDate);

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
