class Step < ApplicationRecord
  belongs_to :recipe
  validates :steps, presence: true
end
