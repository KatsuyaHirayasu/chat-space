module ApplicationHelper
  def times(message)
    message.created_at.to_s(:default)
  end
end
