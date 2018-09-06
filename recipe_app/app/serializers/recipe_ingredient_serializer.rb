class CommentSerializer < ActiveModel::Serializer
  attributes :id, :ingredient, :recipe_id
  belongs_to :recipe
  belongs_to :ingredient
end
