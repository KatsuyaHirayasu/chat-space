
class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "作成に成功しました。"
    else
      redirect_to new_group_path, alert: "作成に失敗しました。"
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: "更新に成功しました。"
    else
      redirect_to edit_group_path, alert: "更新に失敗しました。"
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end
end
