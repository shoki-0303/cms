module CallRankings
  def call_rankings_ids
    ids = REDIS.zrevrangebyscore "articles/daily/#{Date.yesterday.to_s}", "+inf", 1, limit: [0, 5]
    if ids.length < 5
      @ranking_articles = Article.order("created_at DESC").limit(5)
    else
      @ranking_articles = Article.where(id: ids)
    end
  end
end
