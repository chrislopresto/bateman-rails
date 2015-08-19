// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function createThing() {
  var requestPayload = {
    data: {
      type: 'things',
      value: $('.thing-value').val()
    }
  };
  $.ajaxPrefilter(function(options, originalOptions, xhr) {
    var csrfToken = $("meta[name='csrf-token']").attr('content');
    xhr.setRequestHeader('X-CSRF-Token', csrfToken);
  });
  $.post('api/site/v0/things', requestPayload, function(response) {
    $('.thing').text(response.data.value);
  });
}
