class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = current_user.foods
  end

  def create
    new_recipe_food = RecipeFood.new
    new_recipe_food.quantity = params[:recipe_food][:quantity]
    recipe = Recipe.find(params[:recipe_id])
    food = Food.find(params[:recipe_food][:food])
    new_recipe_food.recipe_id = recipe.id
    new_recipe_food.food_id = food.id

    if new_recipe_food.save
      flash[:notice] = 'You have successfully added a new ingredient to the recipe.'
      redirect_to recipe_path(recipe)
    else
      flash[:notice] = 'The ingredient has not been added.'
      render :new
    end

  end
end
