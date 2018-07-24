class RecipesController < ApplicationController
before_action  :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "Successfully created new recipe"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def show
    @current_user = current_user
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "Sucessfully deleted recipe."
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, ingrdients_attributes: [ :id, :name, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

end
