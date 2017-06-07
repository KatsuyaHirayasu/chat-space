class MessagesController < ApplicationController
  before_action :set_group, only: %i(index create)

  def index
   @message = Message.new
   @messages = current_user.messages
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group), notice: 'メッセージの送信に成功しました'
    else
      flash.now[:alert] = 'メッセージの送信に失敗しました'
      render :index
    end
  end

  private

  def set_group
   @groups = current_user.groups
   @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:content).merge(group_id: @group.id)
  end
end
