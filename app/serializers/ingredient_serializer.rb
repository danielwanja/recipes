class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :amount, :unit, :description
end
