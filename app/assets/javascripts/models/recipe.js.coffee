# for more details see: http://emberjs.com/guides/models/defining-models/

App.Recipe = DS.Model.extend
  title: DS.attr 'string'
  description: DS.attr 'string'
  image_url: DS.attr 'string'
  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'

  user: DS.belongsTo('user', async: true)
  ingredients: DS.hasMany('ingredient', async: true)
  steps: DS.hasMany('step', async: true)
