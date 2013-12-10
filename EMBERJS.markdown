== Setting up Ember.js

0. Add [ember-rails](https://github.com/emberjs/ember-rails) and
   `ember-source` gems to gemfile

0. run `rails g ember:bootstreap` to generate all the Rails boilerplate

== Moving over the layout

* Talk about Router -> Controller -> Template

* "Root" Template = template/application.hbs

* {{outlet}}

* Move over application.html.haml markup -> application.hbs

* Now all application has in it is...empty body

== Data

* Just use ActiveModelSerializers. Ember really likes it.

== Testing

Using [Teaspoon](https://github.com/modeset/teaspoon) as test runner.

0. Add teaspoon to Gemfile

0. Run `rails g teaspoon:install --framework=qunit --coffee`


