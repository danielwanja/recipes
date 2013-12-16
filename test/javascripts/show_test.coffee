module 'Showing a recipe',
  setup: -> 
    App.Recipe.FIXTURES = [
      { id: 1, title: 'Taco', description: 'Crunchy and delicious', image_url: 'http://placekitten.com/72/72'}
    ]
    App.reset()

test 'Shows a recipe', ->
  visit('/recipe/1').then ->
    ok(find('.recipe').length, 'Recipe not present')
    ok(find('.title').text().indexOf('Taco'), 'Title not present')
    ok(find('.description').text().indexOf('Crunchy and delicious'), 'Description not present')

