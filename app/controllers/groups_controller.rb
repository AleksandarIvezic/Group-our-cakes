class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  def new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group
    else
      render "new"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name,:icon)
  end
end
