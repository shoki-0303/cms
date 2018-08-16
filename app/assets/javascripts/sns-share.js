$(function() {

  var url = location.href;
  var text = $("h1").text();

  $("#facebook-link").attr("href", "https://www.facebook.com/sharer/sharer.php?u=" + url);
  $("#line-link").attr("href", "http://line.me/R/msg/text/?" + text)
  $("#twitter-link").attr("href", "https://twitter.com/intent/tweet?url="+ url + "&text=" + text);

  function WindowOpen(url) {
    window.open(url, '_blank', 'width=600, height=600, menubar=no, toolbar=no, scrollbars=yes');
  }

  $("#facebook-link").on("click", function(e) {
    WindowOpen(this.href)
    e.preventDefault();
  });

  $("#line-link").on("click", function(e) {
    WindowOpen(this.href)
    e.preventDefault();
  });

  $("#twitter-link").on("click", function(e) {
    WindowOpen(this.href)
    e.preventDefault();
  });
});
