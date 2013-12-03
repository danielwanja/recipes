class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :steps, -> { order "position" }

  acts_as_taggable
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
