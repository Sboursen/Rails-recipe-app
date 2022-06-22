class FoodsController < ApplicationController
  def index
    @foods = Food.all
    @current_user = current_user
  end

  def new; end

  def create
    user = current_user

    new_food = Food.new(food_params)

    if new_food.save
      flash[:notice] = 'You have successfully created a new post.'
      redirect_to foods_path(user, new_post)
    else
      render :new
    end
  end

  def destroy; end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
