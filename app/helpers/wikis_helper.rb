module WikisHelper
  def editor(user)
    if user.present?
      if user.user_lvl >= 3
        return true
      else
        return false
      end
    end
  end
end
