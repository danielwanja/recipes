module 'Home Page Tests',
  setup: -> 
    App.Recipe.FIXTURES = [
      { id: 1, title: 'Taco', description: 'Crunchy and delicious', image_url: 'http://placekitten.com/72/72'}
    ]
    App.reset()

test 'Search box on home page', ->
  visit('/').then -> ok(find('.search').length, 'Search box not present')
test 'Has Recipes', ->
  visit('/').then ->
    ok(find('.recipe').length, 'There are no recipes on the page')
