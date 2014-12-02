function Coordinate (result, inputDate) {
  this.latitude = result.geometry.location.lat().toFixed(2);
  this.longitude = result.geometry.location.lng().toFixed(2);
  this.address = result.formatted_address;
  this.date = inputDate;
}

function updateWidget (coordinate) {
  $("#forecast_embed").attr('src', ("http://forecast.io/embed/#lat=" + coordinate.latitude + "&lon=" + coordinate.longitude + "&name=" + coordinate.address+ "&color=#00aaff&font=Georgia&units=us"));
}

function appendToFront (selector, partial) {
  $(selector).empty();
  $(selector).append(partial);
}

$(function(){

  $("#geocomplete").geocomplete({
    detailsAttribute: "data-geo"
  });

  $('body').on("submit", ".new-location", function(e){
    e.preventDefault();
    var $form = $(this);
    var inputDate = $("#geocomplete_date").val();

    $("#geocomplete").trigger("geocode").bind('geocode:result', function(e, result){

      var coordinate = new Coordinate(result, inputDate);

      $.ajax({
         url: $form.attr('action'),
         type: $form.attr('method'),
         dateType: 'html',
         data: {coordinate: coordinate}
       })
        .done(function(response){
          appendToFront("#append", response);
          updateWidget(coordinate);
        });
    });
  });

new CBPGridGallery( document.getElementById( 'grid-gallery' ) );

});
