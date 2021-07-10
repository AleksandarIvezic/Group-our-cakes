class GroupsController < ApplicationController
  def index
    @groups = Group.all.asc
  end
  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to @group
    else
      render "new"
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name,:icon)
  end
end
