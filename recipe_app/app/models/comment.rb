class Comment < ApplicationRecord
  ######   belongs_to :user
  ######   belongs_to :recipe
  belongs_to :user
  belongs_to :recipe
  validates :content, :ratings, presence: true

  #scope :top_five_comments, -> {order("comments.ratings DESC").limit(5)}
  #scope :top_five_comments, -> {order("comments.ratings DESC").limit(5)}
  scope :top_five_comments, ->(recipe_id) { where(recipe_id: recipe_id )}

end
