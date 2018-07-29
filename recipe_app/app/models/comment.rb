class Comment < ApplicationRecord
  ######   belongs_to :user
  ######   belongs_to :recipe
  belongs_to :user
  belongs_to :recipe
  validates :content, :ratings, presence: true

  scope :top_five_comments, -> {order("comments.ratings DESC").limit(5)}
end
