# Ember Front-End

## Testing Setup

As with the Angular app, going to try [Teaspoon](https://github.com/modeset/teaspoon) to run the tests. Since
Ember's [default test framework](http://emberjs.com/guides/testing/integration/) is [Qunit](http://qunitjs.com/), we are going to try that.

`Gemfile`:
```ruby
group :development, :test do
  gem 'teaspoon'
  gem 'annotate'
  gem 'pry'
end
```

Set up Teaspoon
```
bundle install
rails g teaspoon:install --framework=qunit --coffee
```

One little thing needs to be fixed. In
`config/initializers/teaspoon.rb`:

```ruby
    # Each suite can load a different helper, which can in turn require additional files. This file is loaded before
    # your tests are loaded, and can be used as a manifest.
    suite.helper = "test_helper"
```

Now start up the server and hit http://localhost:3000/teaspoon

## First Test

Especially when getting started with new technolgies/frameworks, I like
to start small, so I wrote a really simple test to make sure things were
working:

```coffeescript
test 'Is this thing on?', -> 
  ok 1 == 1, 'this thing is on'
```

And the test runner runs it properly

## Hooking up Ember

One of the awesome things about Ember is how nicely it plays with Rails.
Stands to reason because there is good overlap between their core team
members. The [Ember Rails]() gem works marvelously with Rails and
integrates with the asset pipeline.


`Gemfile`:
```ruby
gem 'ember-rails'
gem 'ember-source', '1.2.0'
```

Now get Ember set up. I like to change the app name to 'app' because
that's what most of the Ember examples seem to use.

```
bundle install
rails g ember:bootstrap --coffee --app-name=app
```

Get rid of the old `application.js file` and we're good to go.

## Start on the UI

So first things first: need to get the application layout set up in
Ember. But since we want to test-drive things, there are a few things
that need to be set up.

Let's start with a really simple integration test:

`index_test.coffee`
```coffeescript
module 'Home Page Tests',
  setup: -> App.reset()
test 'Search box on home page', ->
  visit('/').then -> ok(find('.search').length, 'Search box not present')
```

Of course this test doesn't work at all. That's because we need to make
sure that Ember is set up for testing, and that all the right resources
are included. But this is why I like to start with something really
simple - it keeps the number of variables down. Looking at the error, we
can't find the test helpers, so if we follow the instructions in the
Ember testing guide:

`test_helper.coffee`
```coffeescript
document.write('<div id="ember-testing-container" style="display:none;"><div id="ember-testing"></div></div>');
App.rootElement = '#ember-testing'; # Output into fixture element
App.setupForTesting();              # Defers readyness until test run
App.injectTestHelpers();            # Adds test methods to window class
```

These past two sections deserve some further explanation.

The module statement above defines a suite of tests. All test below the
module statement are grouped together, and you can define common setup
and teardown tasks. `App.reset()` resets the state of the Ember
application to create a clean slate between tests. The test is looking
for an element with class 'search'.

So now we have a failing test, looking for a search box. So let's make
that test pass.

# Implementing Layout

Ember is all about mapping URLs (Routes) to Application State (nested
controllers) At the top level of all of this is 'Application'.

[] Explain relationship between route, controller, template

So what we would refer to as the 'application' layout in Rails land goes
into the `application` template. Any UI that needs to be on every page
would go there.

```handlebars
<div class="container">
  <div class="nav navbar navbar-default" role="navigation">
    <div class="navbar-header">
      {{#linkTo '' class="navbar-brand"}}Super Cookbook{{/linkTo}}
    </div>
    <form action="" method="get" accept-charset="utf-8"
    class="navbar-form navbar-right">
      <div class="form-group">
        <input class="form-control search" type="text" name="query" value="" placeholder="Search Recipes" role="search" />
      </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
  </div>
  {{outlet}}
</div>
```

Now our test passes! Next step, get some actual data on the page.

# Implementing the Home page

So we actually want to see some recipes on the home page, so there are a
few things that we need to do to make that happen. Since we are
test-driving this thing, the first thing is an integration test. We'll
start really simple and then refine it.

`index_test.coffee`:
```coffeescript
test 'Has Recipes', ->
  visit('/').then ->
    ok(find('.recipe').length, 'There are no recipes on the page')
```

What we want to do is query for Recipes, and then display them on the
home page, just like the Rails app. So first, we should define a model,
based on the Rails model. The excellent ember-rails gem makes this
pretty easy:

`rails g ember:model recipe title:string description:string image_url:string created_at:date updated_at:date --app-name=app`

Now we have a model that can store the data. Now we need to get the data
and that is the route's job.

Ember has models, views and controllers and routes, and so does Rails,
but they are a little different in Ember. Ember's philosophy is a lot
closer to iOS than it is to Rails. The route is responsible for
interpreting parameters (on the url) and getting the appropriate data.
It passes that data to a controller, and loads a template to render the
page. That means the Route is closest to what a controller is in Rails.

All Ember applications have an implicit 'index' route that maps to '/',
so let's refine its behavior:

`routes/index_route.js.coffee`:
```coffeescript
App.IndexRoute = Ember.Route.extend
  model: -> @store.find('recipe')
```

One more thing. While we're still developing the front end, let's set up
some fixtures so that we have some data that we can use:

`test_helper.coffee`
```coffeescript
App.Store = DS.Store.extend({
  revision: 13,
  adapter: DS.FixtureAdapter
});
```

`index_test.coffee`
```coffeescript
module 'Home Page Tests',
  setup: -> 
    App.Recipe.FIXTURES = [
      { id: 1, title: 'Taco', description: 'Crunchy and delicious', image_url: 'http://placekitten.com/72/72'}
    ]
    App.reset()
```

So now we are most of the way there. We just need to create the view:

```handlebars
<table class="table table-striped table-bordered">
  <tr>
    <th>Twitter Handle</th>
    <th>Image</th>
    <th>Title</th>
    <th>Description</th>
    <th>Actions</th>
  </tr>
  {{#each recipe in controller}}
    <tr class="recipe">
      <td></td>
      <td><img class="img-thumbnail" style="width: 64px;" {{bindAttr
        src=recipe.image_url}}/></td>
      <td>{{recipe.title}}</td>
      <td>{{recipe.description}}</td>
      <td></td>
    </tr>
  {{/each}}
</table>
```

There is a bit of magic going on behind the scenes. We have overridden
the route's default behavior to load a list of recipes and Ember creates
a controller to hold the data. The `#each` grabs each of the elements in
the array the route put in and iterates through them.

## Hooking up real data

We are going to use Ember's `ember-data` library to load and store data from the
server. One of the nice things about ember-data is that it has an
adapter that works with `active_model_serializers` out of the box.

`Gemfile`:
```ruby
# gem 'jbuilder' # Remove jbuilder or nothing will work
gem 'ember-data-source', '1.0.0.beta.3'
gem 'active_model_serializers'
```

Now going to the home page, we get a somewhat cryptic error that it
cannot call `forEach` on `undefined`. Chances are the data that the
server is sending back is not quite what ember-data wants. Let's change
things over to use active_model_serializers.

`rails g serializer recipe`

`app/serializers/recipe_serializer.rb`:
```ruby
class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image_url, :updated_at, :created_at
end
```

Now, magically, going to the home page brings up the recipes

## Show page for recipe

Now, let's get the page to show a recipe up and running. Since we are
doing this TDD-Style, let's start with a test:

`test/javascripts/show_test.coffee`:
```coffeescript
module 'Showing a recipe',
  setup: -> 
    App.Recipe.FIXTURES = [
      { id: 1, title: 'Taco', description: 'Crunchy and delicious', image_url: 'http://placekitten.com/72/72'}
    ]
    App.reset()

test 'Shows a recipe', ->
  visit('/recipe/1').then -> 
    ok(find('.title').innerText() == 'Taco', 'Title not present')
    ok(find('.description').innerText() == 'Crunchy and delicious', 'Description not present')
```

Running this test shows an assertion failure that there is no route, so
let's start there.

# Resources

* [Ember App Kit](https://github.com/stefanpenner/ember-app-kit) - A
  great starting place for Ember applications with 
