# for more details see: http://emberjs.com/guides/models/defining-models/
App.Ingredient = DS.Model.extend
  amount: DS.attr 'string'
  unit: DS.attr 'string'
  description: DS.attr 'string'
