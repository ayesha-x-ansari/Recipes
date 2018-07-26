class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true


  belongs_to :user
  has_many :comments
  has_many :ingredients
  has_many :steps

  accepts_nested_attributes_for :ingredients,
                 reject_if: proc { |attributes| attributes['name'].blank?},
                  allow_destroy: true

  accepts_nested_attributes_for :steps,
                 reject_if: proc { |attributes| attributes['step'].blank?},
                  allow_destroy: true



end
