$(function() {
  $('body').on('submit', '#new-trip', function(e) {
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
      appendToFront(partial);
    });
  });

});


function appendToFront (partial) {
  $('#append').empty();
  $('#append').append(partial);
}