module WikisHelper
  def editor(client)
    if client.present?
      if client.role == 'admin'
        return true
      else
        return false
      end
    end
  end
end
