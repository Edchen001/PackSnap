$(function() {
  $('body').on('submit', '#trip-form', function(e) {
    e.preventDefault();
    $form = $(this);
    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method'),
      dataType: "html",
      data: $form.serialize(),
    })
    .done(function(partial) {
      appendToPage(partial);
    });
  });

  $('body').on('click', '#new-itinerary-link', function(e) {
    e.preventDefault();
    $link = $(this);
    $.ajax({
      url: $link.attr('href'),
      type: 'get',
      dataType: 'html',
    })
    .done(function(partial) {
      appendToPage(partial);
    });
  });

  $('body').on('submit', '#itinerary-form', function(e) {
    e.preventDefault();
    $form = $(this);
    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method'),
      dataType: 'html',
      data: $form.serialize(),
    })
    .done(function(partial) {
      appendToPage(partial);
      ////
      $("#geocomplete").geocomplete({
        details: "#map_info",
        detailsAttribute: "data-geo"
      });

      $('.new-location').submit(function(e){

        var $form = $(e.target);
        e.preventDefault();

        $("#geocomplete").trigger("geocode").bind('geocode:result', function(e, result){

          var coordinate = {};
          coordinate.latitude = result.geometry.location.lat().toFixed(2);
          coordinate.longitude = result.geometry.location.lng().toFixed(2);
          coordinate.address = result.formatted_address;

          $.ajax({
             url: $form.attr('action'),
             type: $form.attr('method'),
             dateType: 'html',
             data: {coordinate: coordinate}
           })
            .done(function(response){
              $("#append").empty();
              $('#append').append(response);
              $("#forecast_embed").attr('src', ("http://forecast.io/embed/#lat=" + coordinate.latitude + "&lon=" + coordinate.longitude + "&name=" + coordinate.formatted_address+ "&color=#00aaff&font=Georgia&units=us"));
            });
        });
      });
      ////
    });

  });

  $('body').on('submit', '#location-form', function(e) {
    e.preventDefault();
    console.log(this);
  });

});


function appendToPage (partial) {
  $('#append').empty();
  $('#append').append(partial);
}