class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipe_id
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

#  def ingredient_list
#    object.ingredients.map do |ingredient|
#{
#        id: recipe.id,
#        ingredient:{
#          id: ingredient.id,
#          name: ingredient.name
#          recipe_id: ingredient.recipe_id
#          created_at: ingredient.created_at
#          updated_at: ingredient.updated_at
#        },
#        recipe_id: ingredient.recipe_id
#      }
#    end
#  end


#  def recipes
#    object.recipes.map do |recipe|
#      {
#        id: recipe.id,
#        title: recipe.title,
#        description: recipe.description
#      }
#    end
#  end

end
