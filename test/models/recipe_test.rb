require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    RecipesFixtures.load
  end

  test "the truth" do
    assert_equal ["Cheese Fondue", "Mom's Pumpkin Pie", "Tiffany's Pumpkin Cupcakes"], Recipe.pluck(:title)
  end
end
