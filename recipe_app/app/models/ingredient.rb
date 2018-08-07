class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true, uniqueness: true

  validate :is_name_upcase

# New Code!!
  before_validation :make_name_upcase


  def is_name_upcase
    if name.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Ingredient  must be in title case")
    end
  end

  def make_name_upcase
    self.name = self.name.titlecase
  end

end
