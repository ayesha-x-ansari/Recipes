class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :ingredients, presence: true
end
