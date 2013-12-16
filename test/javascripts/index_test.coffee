module 'Home Page Tests',
  setup: -> App.reset()
test 'Search box on home page', ->
  visit('/').then -> ok(find('.search').length, 'Search box not present')
