`import DS from 'ember-data'`
`import ESCO from 'ember-esco-concept-description'`

ConceptLabel = DS.Model.extend ESCO.Label,
  prefLabelOf: DS.belongsTo('concept', inverse: null)
  altLabelOf: DS.hasMany('concept', inverse: null)
  hiddenLabelOf: DS.hasMany('concept', inverse: null)
  source: DS.attr('string')
`export default ConceptLabel`
