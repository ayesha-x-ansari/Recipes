class RecipesController < ApplicationController
before_action  :find_recipe, only: [:show, :edit, :update, :destroy]

    def index
      if params[:search]
        @recipes  = Recipe.search(params[:search])
      else
      #  raise current_user.id.inspect      (params[:recipe_id])
        params[:user_id] = current_user.id
        @recipes  = Recipe.recipes_by_current_user(params[:user_id])

      end

      respond_to do |format|
      format.html { render :index }
      format.json { render json:  @recipes }
    end

  end

  def new
    #flash[:alert] = "#{current_user.name} add a yummy recipe for everyone to enjoy"
    @recipe = current_user.recipes.build

  end

  def create
   #raise params.inspect

    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
     redirect_to @recipe, alert: " #{current_user.name} you successfully created a new recipe"
    else
      render 'new'
    end
  end

  def edit
    flash[:alert] = "Edit your recipe #{current_user.name}!"
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
    @recipe = Recipe.find(params[:id])

    @comment = Comment.new

      respond_to do |format|
      format.html { render :show }
      format.json { render json:  @recipe }
    end
  end  

  def data  # get '/categories/:id/next', to: 'categories#next_category'
    @recipe = Recipe.find(params[:id])
    render json: @recipe
  end

  def most_commented_recipe
    @recipes = Recipe.most_commented_recipe
  end

  def destroy
  #  raise params.inspect
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path, notice: "Sucessfully deleted recipe."
  end


  private

  def recipe_params
  #  params.require(:recipe).permit(:title, :description, :user_id, ingredient_ids:[], ingredients_attributes: [ :id, :name, :_destroy], steps_attributes: [ :id, :step, :_destroy])
    params.require(:recipe).permit(:title, :description, :user_id, ingredient_ids:[], ingredients_attributes: [ :name], steps_attributes: [ :id, :step, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

end
