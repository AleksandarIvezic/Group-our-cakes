class CakesController < ApplicationController
  def index
    @cakes = Cake.all
    
  end
  def external
    @cakes = Cake.all
    @uncategorized_cakes = @cake.uncategorized if @cake

  end

  def new 
    @group_options = Group.all.map{ |g| [ g.name, g.id]}
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

  private

  def cake_params
    params.require(:cake).permit( :name, :amount, :group_id)
  end

end
