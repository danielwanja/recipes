class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image_url, :updated_at, :created_at
end
