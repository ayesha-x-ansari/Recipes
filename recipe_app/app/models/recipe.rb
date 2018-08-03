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
  has_many :steps, :dependent => :delete_all
  has_many :users, through: :comments

  has_many :recipe_ingredients, :dependent => :delete_all
  has_many :ingredients, through: :recipe_ingredients, :dependent => :delete_all

  accepts_nested_attributes_for :ingredients,
                 reject_if: proc { |attributes| attributes['name'].blank?},
                  allow_destroy: true

  accepts_nested_attributes_for :steps,
                 reject_if: proc { |attributes| attributes['step'].blank?},
                  allow_destroy: true

  def self.search(search)
      joins(:ingredients).where({ingredients: { name: "#{search}" }})
  end

  # Find recipe by user
  scope :recipes_by_current_user, -> (user_id){ where(user_id: user_id) }

end
