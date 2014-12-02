function Location (result, inputDate) {
  this.latitude = result.geometry.location.lat().toFixed(2);
  this.longitude = result.geometry.location.lng().toFixed(2);
  this.address = result.formatted_address;
  this.date = inputDate;
}

function updateWidget (location) {
  $("#forecast_embed").attr('src', ("http://forecast.io/embed/#lat=" + location.latitude + "&lon=" + location.longitude + "&name=" + location.address+ "&color=#00aaff&font=Georgia&units=us"));
}

function appendToFront (selector, partial) {
  $(selector).empty();
  $(selector).append(partial);
}

function findPos(tag) {
    var curtop = 0;
    console.log(curtop);
    if (tag.offsetParent) {
        do {
            curtop += tag.offsetTop;
        } while (tag = tag.offsetParent);
    return [curtop];
    }
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

      var location = new Location(result, inputDate);

      $.ajax({
         url: $form.attr('action'),
         type: $form.attr('method'),
         dateType: 'html',
         data: {location: location}
       })
        .done(function(response){
          appendToFront("#append", response);
          console.log(findPos(document.getElementById("append")))
          window.scroll(0,(findPos(document.getElementById("append")))-100);
          updateWidget(location);
          new CBPGridGallery(document.getElementById('grid-gallery'));

        });
         $("#geocomplete").unbind('geocode:result');

    });
  });

});
