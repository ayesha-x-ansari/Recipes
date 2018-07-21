class RecipesController < ApplicationController
before_action  :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
  end

  def show
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

end
