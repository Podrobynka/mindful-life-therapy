document.addEventListener('click', function(event) {
  var target = event.target;
  var isCloseButton = target.classList.contains('close-flash');

  if (!isCloseButton) return;

  var closable = target.parentNode.parentNode.parentNode;
  closable.parentNode.removeChild(closable);
}, false);
