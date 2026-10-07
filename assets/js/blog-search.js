// Progressive enhancement: the search box is hidden until JS runs; filters the post cards already on the page.
(function () {
  var box = document.getElementById('blog-search');
  if (!box) return;
  box.hidden = false;
  var empty = document.getElementById('blog-empty');
  var items = Array.prototype.slice.call(document.querySelectorAll('.featured, .post-card'));
  box.addEventListener('input', function () {
    var q = box.value.trim().toLowerCase(), shown = 0;
    items.forEach(function (el) {
      var hit = !q || el.textContent.toLowerCase().indexOf(q) !== -1;
      el.hidden = !hit; if (hit) shown++;
    });
    if (empty) empty.hidden = shown !== 0;
  });
})();
