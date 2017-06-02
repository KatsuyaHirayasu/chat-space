class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update]

    def new
      @group = Group.new
      @group.users << current_user
    end

    def create
      @group = Group.new(group_params)
      if @group.save
        GroupUser.create(user_id: current_user.id, group_id: @group.id)
        redirect_to group_path(@group), notice: 'グループが作成されました'
      else
        flash[:alert] = 'グループに失敗しました'
        render :new
      end
    end

    def edit
    end

    def show
      @groups = current_user.groups
    end

    def update
      if @group.update(group_params)
        redirect_to group_path(@group), notice: '更新に成功しました'
      else
        flash[:alert] = '更新に失敗しました'
        render :edit
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
