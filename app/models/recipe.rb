class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :steps, -> { order "position" }

  acts_as_taggable
end
