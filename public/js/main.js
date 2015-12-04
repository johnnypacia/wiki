$(document).ready(function() {
  var monsterModalButton        = $("#monster-modal-button");
  var monsterModal              = $(".modal-container.monster");
  var closeMonsterButton        = $('.close-button.monster');
  var toggleMonsterModalHandler = function() {
    monsterModal.toggle();
  };

  monsterModalButton.on('click', toggleMonsterModalHandler);
  closeMonsterButton.on('click', toggleMonsterModalHandler);

});