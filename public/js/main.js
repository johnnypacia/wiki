$(document).ready(function() {
  var testModalButton        = $("#modal-button");
  var testModal              = $(".modal-container.tester");
  var closeTestModalButton   = $(".close-button.tester");
  var toggleTestModalHandler = function() {
    testModal.toggle();
  };

  testModalButton.on('click', toggleTestModalHandler);
  closeTestModalButton.on('click', toggleTestModalHandler);

});