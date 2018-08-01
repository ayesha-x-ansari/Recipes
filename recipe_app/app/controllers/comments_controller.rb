class CommentsController < ApplicationController

  before_action :set_recipe

  def index
    @comments = Comment.top_five_comments(params[:recipe_id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.valid?
    #  @recipe.comments << @comment
      @recipe.save
      @comment.save
      redirect_to @recipe, alert: "Comment successfully added."
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    #if @comment.user_id != current_user.id
    #  redirect_to user_recipes_path(current_user), alert: "You may not delete this comment!"
    #end
  end

  def update

    @comment = Comment.find(params[:id])
      @comment.update(comment_params)
      if  @comment.save
        redirect_to @recipe
      else
        render 'edit'
      end
  end

  def comment_statistics
    @comment_rating1 = Comment.comment_rating1(params[:recipe_id], ratings: 1)
    @comment_rating2 = Comment.comment_rating2(params[:recipe_id], ratings: 2)
    @comment_rating3 = Comment.comment_rating3(params[:recipe_id], ratings: 3)
    @comment_rating4 = Comment.comment_rating4(params[:recipe_id], ratings: 4)
    @comment_rating5 = Comment.comment_rating5(params[:recipe_id], ratings: 5)
  end


  def show
   @comments_rating5 = Comment.comments_rating5(params[:recipe_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @recipe.save
    redirect_to @recipe, alert: "Comment successfully deleted."

    if @comment.user_id != current_user.id
      redirect_to user_recipes_path(current_user), alert: "You may not delete this comment."
    end
  end

  private

    def set_recipe
      @recipe = Recipe.find_by(id: params[:recipe_id])
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id, :recipe_id, :ratings)
    end
end
