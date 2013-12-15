class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients, -> { order "id" }  # FIXME: add position
  has_many :steps, -> { order "position" }

  accepts_nested_attributes_for :ingredients, :steps, allow_destroy: true
  acts_as_taggable

  validates_presence_of :title
end

# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  image_url   :string(255)
#
