class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  has_many :steps
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
