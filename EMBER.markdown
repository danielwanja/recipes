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

