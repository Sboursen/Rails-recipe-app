class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @user = current_user
    @recipes = @user.recipes.all
  end

  def show
    # check if the recipe_id belong to the user
    @recipe = Recipe.find(params[:id])
    authenticate_and_show!(@recipe)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:notice] = 'Your recipe was successfully created'
      redirect_to recipes_path
    else
      render 'new'
      flash[:notice] = 'Failed to create a recipe'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.public = ! @recipe.public

    if @recipe.save
      flash[:notice] = "Your recipe is now #{@recipe.public ? 'Public' : 'Private'}"
    else
      flash[:notice] = 'Failed to change the status of this recipe'
    end
  end

  def new
    @recipe = Recipe.new
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    flash[:notice] = if @recipe.destroy
                       'Your recipe was successfully deleted'
                     else
                       'Failed to delete the recipe'
                     end
    redirect_to recipes_path
  end

  private

  def authenticate_and_show!(recipe)
    unless current_user.present?
      authenticate_user!
    end
    if recipe.user.id != current_user.id
      flash[:alert] = 'Sorry! you can only access the details of your own recipes'
      redirect_to public_recipes_path
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
  end
end
