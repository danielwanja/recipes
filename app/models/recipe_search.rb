# Read-only model based on a view generated in postgres that includes
# the recipe information and the ingredients flattened out into a string
class RecipeSearch < ActiveRecord::Base
  belongs_to :recipe

  def readonly?
    true
  end
end
