class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :recipe_id
  belongs_to :user
  belongs_to :recipe
end
