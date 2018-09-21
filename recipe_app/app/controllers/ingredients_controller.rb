class IngredientsController < ApplicationController

  def index
    @ingredients  = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json:  @ingredient }
    end
  end

  def data  # get '/categories/:id/next', to: 'categories#next_category'
    @ingredient = Ingredient.find(params[:id])
    render json: @ingredient
  end

end
