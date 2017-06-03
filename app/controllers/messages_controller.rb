class MessagesController < ApplicationController
  def index
    @order = current_user.groups
    @groups = @order.order("created_at desc")
  end
end
