// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function createThing() {
  var requestPayload = {
    data: {
      type: 'things',
      value: $('.thing-value').val()
    }
  };
  $.post('api/site/v0/things', requestPayload, function(response) {
    $('.thing').text(response.data.value);
  });
}
