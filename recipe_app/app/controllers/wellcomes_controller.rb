class WellcomesController < ApplicationController
  def index
    @recipes  = Recipe.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json:  @recipes }
    end
  end
end
