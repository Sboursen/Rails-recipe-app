class PublicRecipesController < ApplicationController
  def index
    @public_recipe = Recipe.where(public: true).order('created_at DESC')
  end

  def show; end
end
