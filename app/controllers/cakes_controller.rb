class CakesController < ApplicationController
  def index
    @cakes = Cake.all
  end
  def new 
    @cake = Cake.new
  end
  def create
    @cake = Cake.new(cake_params)
    if @cake.save
      redirect_to @cake
    else
      render "new"
    end
  end

  def show 
    @cake = Cake.find(params[:id])
  end
  def destroy
  end

  private

  def cake_params
    params.require(:cake).permit(:author, :name, :amount)
  end

end
