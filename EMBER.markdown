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

# Resources

* [Ember App Kit](https://github.com/stefanpenner/ember-app-kit) - A
  great starting place for Ember applications with 
