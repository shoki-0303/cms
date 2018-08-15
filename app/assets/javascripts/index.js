$(function() {
  $(document).ready(function() {
    if (document.URL.match("/articles")) {
      var indexLists = $(".release-article__content h2")
      $("#index-js").append("<li class=release-article__content__index__title>目次</li>")
      $(indexLists).each(function(index) {
        var listText = $(this).text();
        var list = "<a class=release-article__content__index__list></a>";
        var ListIndex = $(list).append(listText);
        $("#index-js").append(ListIndex[0]);
      })

      $(indexLists).each(function(index) {
        $(this).attr("id", index)
      });
      $(".release-article__content__index__list").each(function(index) {
        $(this).attr("href","#"+ index)
      });
    }
  });
});
