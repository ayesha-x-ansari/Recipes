class Comment < ApplicationRecord
  ######   belongs_to :user
  ######   belongs_to :recipe
  belongs_to :user
  belongs_to :recipe
  validates :content, :ratings, presence: true

  #scope :top_five_comments, -> {order("comments.ratings DESC").limit(5)}
  #scope :top_five_comments, -> {order("comments.ratings DESC").limit(5)}
  #scope :top_five_comments, ->(recipe_id) { where(recipe_id: recipe_id).order("comments.ratings ASC").limit(5)}
  scope :top_five_comments, -> (recipe_id) { where(recipe_id: recipe_id).order(ratings: :desc ).limit(5)}
  scope :comment_rating1,   -> (recipe_id, ratings) { where({recipe_id: recipe_id, ratings: 1 })}
  scope :comment_rating2,   -> (recipe_id, ratings) { where({recipe_id: recipe_id, ratings: 2 })}
  scope :comment_rating3,   -> (recipe_id, ratings) { where({recipe_id: recipe_id, ratings: 3 })}
  scope :comment_rating4,   -> (recipe_id, ratings) { where({recipe_id: recipe_id, ratings: 4 })}
  scope :comment_rating5,   -> (recipe_id, ratings) { where({recipe_id: recipe_id, ratings: 5 })}

end
