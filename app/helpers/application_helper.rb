module ApplicationHelper

  def admin_user?(user)
    user_signed_in? && current_user.admin_flg == true
  end

  def is_your_article?(article, user)
    article.user_id == current_user.id
  end
end
