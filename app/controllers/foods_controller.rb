class FoodsController < ApplicationController
  def index
    @current_user = current_user
    @foods = @current_user.foods.includes([:user]).all
  end

  def new
    @new_food = Food.new
  end

  def create
    new_food = Food.new(food_params)
    new_food.user_id = current_user.id

    if new_food.save
      flash[:notice] = 'You have successfully created a new food.'
      redirect_to foods_path
    else
      flash[:notice] = 'The food has not been added.'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])

    if @food.destroy
      flash[:success] = 'Food deleted successfully'
    else
      flash.now[:error] = 'Error: Food could not be deleted'
    end
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
