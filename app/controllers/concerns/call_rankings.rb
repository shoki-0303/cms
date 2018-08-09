module CallRankings
  def call_rankings_ids
    ids = REDIS.zrevrangebyscore "articles/daily/#{Date.today.to_s}", "+inf", 0, limit: [0, 5]
  end
end
