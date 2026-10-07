// Manual theme toggle; the choice is stored per browser. Without a stored choice the OS preference applies (CSS).
(function () {
  var root = document.documentElement;
  var btn = document.getElementById('theme-toggle');
  if (!btn) return;
  function current() {
    var t = root.getAttribute('data-theme');
    if (t) return t;
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  }
  function sync() { btn.setAttribute('aria-pressed', current() === 'dark' ? 'true' : 'false'); }
  btn.addEventListener('click', function () {
    var next = current() === 'dark' ? 'light' : 'dark';
    root.setAttribute('data-theme', next);
    try { localStorage.setItem('theme', next); } catch (e) { console.warn('theme not persisted', e); }
    sync();
  });
  sync();
})();
