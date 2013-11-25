class IngredientsController < InheritedResources::Base
  nested_belongs_to :user, :recipe
end
