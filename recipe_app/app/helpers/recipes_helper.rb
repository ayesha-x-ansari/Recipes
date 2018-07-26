module RecipesHelper
  def last_updated(recipe)
    recipe.updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
  end
end
