class MessagesController < ApplicationController

  def index
    @groups = Group.order(created_at: :desc)
    @group = Group.find_by(params[:group_id])
  end
end
