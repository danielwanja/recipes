# for more details see: http://emberjs.com/guides/models/defining-models/

App.Recipe = DS.Model.extend
  title: DS.attr 'string'
  description: DS.attr 'string'
  imageUrl: DS.attr 'string'
  createdAt: DS.attr 'date'
  updatedAt: DS.attr 'date'
