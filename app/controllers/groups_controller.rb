class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update]

    def index
      @order = current_user.groups
      @groups = @order.order("created_at desc")
    end

    def new
      @group = Group.new
      @users = User.all.where.not(id: current_user.id)
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

    def edit
      @users = User.all.where.not(id: current_user.id)
    end

    def show
      @order = current_user.groups
      @groups = @order.order("created_at desc")
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
