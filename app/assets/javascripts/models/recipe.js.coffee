# for more details see: http://emberjs.com/guides/models/defining-models/

Recipes.Recipe = DS.Model.extend
  title: DS.attr('string')
  description: DS.attr('string')
  image_url: DS.attr('string')
  created_at: DS.attr('string')
  updated_at: DS.attr('string')
