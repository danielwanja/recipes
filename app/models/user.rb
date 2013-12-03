class User < ActiveRecord::Base
  has_many :recipes
end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  twitter    :string(255)
#  created_at :datetime
#  updated_at :datetime
#
