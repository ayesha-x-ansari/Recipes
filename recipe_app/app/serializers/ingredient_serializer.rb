class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipe_id
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def recipe_list
    object.recipes.map do |recipe|
      {
        id: recipe.id,
        title: recipe.title,
        description: recipe.description
      }
    end
  end

end
