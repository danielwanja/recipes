class RecipeSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :description, :image_url, :updated_at, :created_at
  has_one  :user
  has_many :ingredients
  has_many :steps
end
