$(function() {
  $('body').on('submit', '#trip-form', function(e) {
    e.preventDefault();
    $form = $(this);
    console.log($form);
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
    console.log($link);
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
      console.log(partial);
      appendToPage(partial);
    });

  });

});


function appendToPage (partial) {
  $('#append').empty();
  $('#append').append(partial);
}