class GroupsController < ApplicationController
  before_action :set_group, only: %i(edit update)

    def new
      @group = Group.new
      @users = User.where.not(id: current_user.id)
    end

    def create
      @group = Group.new(group_params)
      if @group.save
        @group.users << current_user
        redirect_to group_path(@group), notice: 'グループが作成されました'
      else
        flash.now[:alert] = 'グループに失敗しました'
        render :new
      end
    end

    def show
      @groups = current_user.groups
    end

    def edit
      @users = User.where.not(id: current_user.id)
    end

    def update
      if @group.update(group_params)
        @group.users << current_user
        redirect_to group_path(@group), notice: '更新に成功しました'
      else
        flash.now[:alert] = '更新に失敗しました'
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
