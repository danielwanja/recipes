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

