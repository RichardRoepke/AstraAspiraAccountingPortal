/////////////////////////////////
// Report Javascript Manifest //
///////////////////////////////

$(document).ready(function() {
  $('.file-transfer').on('click', function() {
    var fileURL = $(this).data("url");
    $(".loading-spinner").removeClass("hidden");

    $.ajax({
      url: fileURL,
      type: 'PATCH'
    }).done(function (data) {
      if (data.url) {
        window.location.href = data.url;
      } else {
        toastr.error('Did not receive url. Please try again in a few minutes.');
      }
    }).fail(function (jqXHR, status) {
      toastr.error('File is not currently available. Please try again in a few minutes.');
    }).always(function() {
      $(".loading-spinner").addClass("hidden");
    });
  });
});