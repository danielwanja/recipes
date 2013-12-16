class StepSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :position, :description
end
