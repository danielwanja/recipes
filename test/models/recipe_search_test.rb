require 'test_helper'

class RecipeSearchTest < ActiveSupport::TestCase
  setup do
    r = Recipe.new
    r.title = 'Water'
    r.description = 'Dihydrogen monoxide'
    i = Ingredient.new
    i.description = 'Hydrogen'
    r.ingredients << i
    i = Ingredient.new
    i.description = 'Oxygen'
    r.ingredients << i
    r.save
  end
 
  test "Creates a row in the view" do
    assert RecipeSearch.count == 1
  end

  test "Searches titles" do
    assert_equal 1, RecipeSearch.basic_search('water').count
  end

  test "Searches descriptions" do
    assert_equal 1, RecipeSearch.basic_search('monoxide').count
  end

  test "Searches ingredients" do
    assert_equal 1, RecipeSearch.basic_search('Oxygen').count
  end
end
