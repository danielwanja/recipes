# user = User.create(twitter: 'squirrel')
# RecipeDownloader.new.parse_all(user)

user = User.create(twitter: 'danielwanja')

# From http://allrecipes.com/recipe/cheese-fondue/
recipe = user.recipes.create(title: "Cheese Fondue", description: "Not a Traditional Cheese Fondue Swiss Recipe",
                             image_url: "http://images.media-allrecipes.com/userphotos/250x250/00/06/38/63821.jpg")
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

# From http://allrecipes.com/Recipe/Moms-Pumpkin-Pie/Detail.aspx?evt19=1
recipe = user.recipes.create(title: "Mom's Pumpkin Pie", description: "This is the pumpkin pie that my mother has made for years. It is a rich pie with just the right amount of spices.",
                             image_url: "http://images.media-allrecipes.com/userphotos/250x250/01/05/44/1054478.jpg")

recipe.ingredients.create(amount:'1 recipe',  description:'pastry for a 9 inch single crust pie')
recipe.ingredients.create(amount:'3',   description:'eggs')
recipe.ingredients.create(amount:'1',   description:'egg yolk')
recipe.ingredients.create(amount:'1/2 cup',   description:'white sugar')
recipe.ingredients.create(amount:'1/2 cup',   description:'packed brown sugar')
recipe.ingredients.create(amount:'1 teaspoon',  description:'salt')
recipe.ingredients.create(amount:'1/2 teaspoon',  description:'ground cinnamon')
recipe.ingredients.create(amount:'1/2 teaspoon',  description:'ground nutmeg')
recipe.ingredients.create(amount:'1/2 teaspoon',  description:'ground ginger')
recipe.ingredients.create(amount:'1/4 teaspoon',  description:'ground cloves')
recipe.ingredients.create(amount:'1 1/2 cups',  description:'milk')
recipe.ingredients.create(amount:'1/2 cup',   description:'heavy whipping cream')
recipe.ingredients.create(amount:'2 cups',  description:'pumpkin puree')

recipe.steps.create(position:1,   description:'Preheat oven to 425 degrees F (220 degrees C.)' )
recipe.steps.create(position:2,   description:'In a large bowl, combine eggs, egg yolk, white sugar and brown sugar. Add salt, cinnamon, recipe.steps.create(nutmeg, ginger and cloves. Gradually stir in milk and cream. Stir in pumpkin. Pour filling into pie shell.' )
recipe.steps.create(position:3,   description:'Bake for ten minutes in preheated oven. Reduce heat to 350 degrees F (175 degrees C), and bake for an additional 40 to 45 minutes, or until filling is set.' )


user = User.create(twitter: 'theaboutbox')

# From http://allrecipes.com/Recipe/Tiffanys-Pumpkin-Cupcakes/Detail.aspx
recipe = user.recipes.create(title: "Tiffany's Pumpkin Cupcakes", description: "Moist, yellow cupcakes with cinnamon and spice make a great dessert or snack, with or without frosting",
                              image_url: "http://images.media-allrecipes.com/userphotos/250x250/01/02/90/1029027.jpg")

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


