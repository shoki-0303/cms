module CallTags
  def call_tags_popular20
    Tag.joins(:article_tags).group(:tag_id).order('count(article_id) desc').limit(20)
  end
end
