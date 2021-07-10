class CakesController < ApplicationController
  def index
    @cakes = current_user.cakes.desc
    @group_options = Group.all.map{ |g| [ g.name, g.id]}
  end
  def external
    @uncategorized_cakes = current_user.cakes.desc.select{ |cake| cake.groups.empty?}
  end

  def new 
    # @group_options = Group.all.map{ |g| [ g.name, g.id]}
    @cake = current_user.cakes.build
  end
  def create
    @cake = current_user.cakes.build(cake_params)
    
    if @cake.save
      redirect_to @cake
    else
      render "new"
    end
  end

  def show 
    @cake = Cake.find(params[:id])
    @group = Group.find(@cake.group_id) if @cake.group_id
  end
  def destroy
  end

  def add_to_group
    @cake = Cake.find(add_params[:id])
    @group = Group.find(add_params[:group_id])
    @cake.groups << @group unless @cake.groups.include?(@group)
    # @cake.add_to_group
    redirect_to cakes_path
  end

  def remove_group
    @cake = Cake.find(params[:cake])
    @group = Group.find(params[:group])
    @cake.groups.delete(@group)
    redirect_to cakes_path
  end

  private

  def add_params
    params.permit(:id, :group_id)
  end

  def cake_params
    params.require(:cake).permit( :name, :amount)
  end

end
