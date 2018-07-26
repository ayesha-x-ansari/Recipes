class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true


  belongs_to :user
  has_many :comments
  has_many :ingredients

  accepts_nested_attributes_for :ingredients,
                 reject_if: proc { |attributes| attributes['name'].blank?},
                  allow_destroy: true


end
