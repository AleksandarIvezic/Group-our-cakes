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
      flash[:notice] = 'Category created successfully!'
      redirect_to @group
    else
      flash.now[:alert] = 'Please fill required fields!'
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @cakes = @group.cakes.includes([:author])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.delete
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
