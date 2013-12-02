class AddUnitToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :unit, :string
  end
end
