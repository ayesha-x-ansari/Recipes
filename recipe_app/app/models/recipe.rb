class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :title, uniqueness: true

  validates :ingredients, presence: true
  validates :steps, presence: true

  validates_associated :ingredients
  validates_associated :steps

  belongs_to :user
  has_many :comments,  :dependent => :delete_all
  has_many :users, through: :comments
  has_many :steps, :dependent => :delete_all

  has_many :recipe_ingredients, :dependent => :delete_all
  has_many :ingredients, through: :recipe_ingredients, :dependent => :delete_all

  accepts_nested_attributes_for :ingredients,
                 reject_if: proc { |attributes| attributes['name'].blank?},
                  allow_destroy: true

  accepts_nested_attributes_for :steps,
                 reject_if: proc { |attributes| attributes['step'].blank?},
                  allow_destroy: true
  # Search recipe
  def self.search(search)
      joins(:ingredients).where({ingredients: { name: "#{search}" }})
  end

  # Find recipe by user
  scope :recipes_by_current_user, -> (user_id){ where(user_id: user_id) }

  def self.most_commented_recipe
    c  =  Recipe.joins(:comments).order('count(recipe_id) DESC').group(:id).count
    count = 0
    most_comment_recipe  =  c.map do |k, v|
      array = []
      if  v >= count
        count =  v
        recipe  = Recipe.find(k)
        array[0] = "#{recipe.id}"
        array.push("#{recipe.title}")
        array.push(  " ***  Number of comments: #{v}  ***")
      end
    end
    most_comment_recipe.compact
  end

  def ingredients_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
      self.ingredients << ingredient
    end
  end
end
