class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :recipe_id
      t.integer :position
      t.text :description

      t.timestamps
    end
  end
end
