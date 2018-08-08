$(function() {

  function appendTag(tag) {
    var tags_area = $('#tag-search-result');
    var tag =`
    <div class="tag-items">
    <p class="tag-items__name">${tag.name}</p>
    <a class="tag-add-btn tag-items__add" data-tag-id=${tag.id} data-tag-name=${tag.name}>追加</a>
    </div>
    `;
    $(tags_area).append(tag);
  }

  function appendNoTag(word) {
    var tags_area = $('#tag-search-result');
    var tag =`
    <li><p>一致するタグは存在しません</p></li>
    `;
    $(tags_area).append(tag);
  }

  function appendTagResult(id, name) {
    var html = `
    <div class="js-result-tag">
    <input name='article[tag_ids][]'  type='hidden' value=${id}>
    <p class="js-result-tag__name">${name}</p>
    <a class="js-result-tag__remove-btn">×</a>
    </div>
    `
    $('#tag-result').append(html)
  }

  $('#tag-search-field').on("keyup", function() {
    var input = $('#tag-search-field').val();
    if (input !== 0) {
      $.ajax({
        type: "get",
        url: '/drafts/new',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(tags) {
        console.log(tags)
        $('#tag-search-result').empty();
        if (tags.length !== 0) {
          tags.forEach(function(tag){
            appendTag(tag)
          });
        } else {
          appendNoTag('一致するタグは存在しません')
        }
      })
      .fail(function() {
        alert("ユーザー検索に失敗しました")
      })
    } else {
      $('#tag-search-result').empty();
    }
  });

  $('#tag-search-result').on("click", ".tag-add-btn", function() {
    var TagId = $(this).attr("data-tag-id");
    var TagName = $(this).attr("data-tag-name");
    appendTagResult(TagId, TagName);
  });
  $('#tag-result').on("click", ".js-result-tag__remove-btn", function() {
    $(this).parent().remove();
  });
});
