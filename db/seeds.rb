# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(twitter: 'danielwanja')
# From http://allrecipes.com/recipe/cheese-fondue/
recipe = user.recipes.create(title: "cheese fondue", description: "Not a Traditional Cheese Fondue Swiss Recipe")

recipe.ingredients.create(amount: "1"   , description: "cup dry white wine" )
recipe.ingredients.create(amount: "1/2" , description: "pound shredded Swiss cheese" )
recipe.ingredients.create(amount: "1/2" , description: "pound shredded Gruyere cheese" )
recipe.ingredients.create(amount: "2"   , description: "tablespoons all-purpose flour" )
recipe.ingredients.create(amount: "1/4" , description: "teaspoon salt" )
recipe.ingredients.create(amount: "1/4" , description: "teaspoon ground nutmeg" )
recipe.ingredients.create(amount: "1"   , description: "(1 pound) loaf French bread, cut into 1 inch cubes" )

recipe.steps.create(position: 1, description: "Simmer wine in fondue pot.")
recipe.steps.create(position: 2, description: "Add Swiss cheese, Gruyere cheese, 1/4 pound at a time.")
recipe.steps.create(position: 3, description: "Stir after each addition of cheese until melted.")
recipe.steps.create(position: 4, description: "Stir in flour.")
recipe.steps.create(position: 5, description: "When all the cheese has melted, stir in salt and nutmeg.")
recipe.steps.create(position: 6, description: "Serve with cut-up French bread.")

user = User.create(twitter: 'theaboutbox')
# From http://allrecipes.com/Recipe/Tiffanys-Pumpkin-Cupcakes/Detail.aspx
recipe = user.recipes.create(title: "Tiffany's Pumpkin Cupcakes", description: "Moist, yellow cupcakes with cinnamon and spice make a great dessert or snack, with or without frosting")

recipe.ingredients.create(amount: "24",  description: "Reynolds® StayBrite® or Foil Baking Cups")
recipe.ingredients.create(amount: "1",   description: "(18 ounce) package yellow cake mix")
recipe.ingredients.create(amount: "1",   description: "cup canned pumpkin puree")
recipe.ingredients.create(amount: "1",   description: "teaspoon pumpkin pie spice")
recipe.ingredients.create(amount: "1/2", description: "cup water")
recipe.ingredients.create(amount: "1/3", description: "cup oil")
recipe.ingredients.create(amount: "3",   description: "eggs")
recipe.ingredients.create(amount: "1",   description: "teaspoon vanilla extract")

recipe.steps.create(position: 1, description: "Preheat oven to 350 degrees F. Place Reynolds Baking Cups in muffin pans; set aside.")
recipe.steps.create(position: 2, description: "Combine ingredients in large bowl. Beat with an electric mixer on medium speed for 2 minutes.")
recipe.steps.create(position: 3, description: "Spoon batter into baking cups.")
recipe.steps.create(position: 4, description: "Bake 20 to 23 minutes or until wooden pick inserted in center of cupcake comes out clean. Cool on cooling rack. Frost as desired.")


