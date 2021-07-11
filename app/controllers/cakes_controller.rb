class CakesController < ApplicationController
  def index    
    params[:order]="desc"
    @cakes = current_user.cakes.desc 
    @cakes = current_user.cakes.asc if params[:order]=="asc"
  end
  def external
    @uncategorized_cakes = current_user.uncategorized_cakes
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
    @groups = @cake.groups
    @group_options = Group.all.map{ |g| [ g.name, g.id]}
  end
  def destroy
    @cake = Cake.find(params[:id])
    @cake.delete
    redirect_to cakes_path
  end

  def add_to_group
    @cake = Cake.find(add_params[:id])
    @group = Group.find(add_params[:group_id])
    @cake.groups << @group unless @cake.groups.include?(@group)
    redirect_to @cake
  end

  def remove_group
    @cake = Cake.find(params[:cake])
    @group = Group.find(params[:group])
    @cake.groups.delete(@group)
    @cake.groups.compact
    redirect_to @cake
  end

  private

  def add_params
    params.permit(:id, :group_id)
  end

  def cake_params
    params.require(:cake).permit( :name, :amount)
  end

end
