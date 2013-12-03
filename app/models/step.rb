class Step < ActiveRecord::Base
  belongs_to :recipe
end

# == Schema Information
#
# Table name: steps
#
#  id          :integer          not null, primary key
#  recipe_id   :integer
#  position    :integer
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#
