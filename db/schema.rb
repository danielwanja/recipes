# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131203061332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.index ["user_id"], :name => "fk__recipes_user_id", :order => {"user_id" => :asc}
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_recipes_user_id"
  end

  create_table "ingredients", force: true do |t|
    t.integer  "recipe_id"
    t.string   "amount"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit"
    t.index ["recipe_id"], :name => "fk__ingredients_recipe_id", :order => {"recipe_id" => :asc}
    t.foreign_key ["recipe_id"], "recipes", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_ingredients_recipe_id"
  end

  create_view "recipe_searches", " SELECT recipes.id,\n    recipes.id AS recipe_id,\n    recipes.title,\n    recipes.description,\n    string_agg((ingredients.description)::text, ' '::text) AS ingredients\n   FROM recipes,\n    ingredients\n  WHERE (ingredients.recipe_id = recipes.id)\n  GROUP BY recipes.id", :force => true
  create_table "steps", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "position"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["recipe_id"], :name => "fk__steps_recipe_id", :order => {"recipe_id" => :asc}
    t.foreign_key ["recipe_id"], "recipes", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_steps_recipe_id"
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["tag_id"], :name => "fk__taggings_tag_id", :order => {"tag_id" => :asc}
    t.index ["tag_id"], :name => "index_taggings_on_tag_id", :order => {"tag_id" => :asc}
    t.index ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context", :order => {"taggable_id" => :asc, "taggable_type" => :asc, "context" => :asc}
    t.foreign_key ["tag_id"], "tags", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_taggings_tag_id"
  end

end
