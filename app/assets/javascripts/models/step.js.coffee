# for more details see: http://emberjs.com/guides/models/defining-models/

App.Step = DS.Model.extend
  position: DS.attr 'number'
  description: DS.attr 'string'
