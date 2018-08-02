module ApplicationHelper

  def admin_user?(user)
    user_signed_in? && current_user.admin_flg == true
  end
end
