class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :ingredient_id, :recipe_id
  belongs_to :recipe
  belongs_to :ingredient
end
