class Comment < ApplicationRecord
  ######   belongs_to :user
  ######   belongs_to :recipe
  has_many :users, through: :recipess
  validates :content, presence: true

end
