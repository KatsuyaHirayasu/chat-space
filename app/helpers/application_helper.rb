module ApplicationHelper
  def published_times(message)
    message.created_at.to_s(:default)
  end
end
