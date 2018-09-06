class IngredientsController < ApplicationController

  def index
    @ingredients  = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def data  # get '/categories/:id/next', to: 'categories#next_category'
    @ingredient = Ingredient.find(params[:id])
    render json: @ingredient
  end

end
