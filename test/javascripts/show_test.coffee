module 'Showing a recipe',
  setup: -> 
    App.User.FIXTURES = [
      { id: '1', twitter_handle: 'testy' }
    ]
    App.Ingredient.FIXTURES = [
      { id: '1', recipe: '1', amount: '1', unit: 'shell', description: 'Taco Shell' }
    ]
    App.Step.FIXTURES = [
      { id: '1', position: 1, description: 'Put filling in shell' }
    ]    
    App.Recipe.FIXTURES = [
      { 
        id: '1', title: 'Taco', 
        description: 'Crunchy and delicious', 
        image_url: 'http://placekitten.com/72/72',
        user: '1',
        ingredients: ['1'],
        steps: ['1']
      }
    ]
    App.reset()

test 'Shows a recipe', ->
  visit('/recipe/1').then ->
    ok(find('.recipe').length, 'Recipe not present')
    ok(find('.title').text().indexOf('Taco'), 'Title not present')
    ok(find('.description').text().indexOf('Crunchy and delicious'), 'Description not present')

test 'Shows a user', ->
  visit('/recipe/1').then ->
    ok(find('.user').text().indexOf('testy'), 'User not present')

test 'Shows Steps', ->
  visit('/recipe/1').then ->
    ok(find('.step').length, 'Steps not present')

test 'Shows Ingredients', ->
  visit('/recipe/1').then ->
    ok(find('.ingredient').length, 'Ingredients not present')
