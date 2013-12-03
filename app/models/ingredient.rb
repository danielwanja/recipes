class Ingredient < ActiveRecord::Base
  belongs_to :recipe
end

# == Schema Information
#
# Table name: ingredients
#
#  id          :integer          not null, primary key
#  recipe_id   :integer
#  amount      :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  unit        :string(255)
#
