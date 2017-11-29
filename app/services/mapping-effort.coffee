`import Ember from 'ember'`

###
# A service to track the state of the mapping platform. Keeps track of the taxonomy to map from and
# to and whether the mapping viewpoint is inverted or not
###
MappingEffortService = Ember.Service.extend
  currentConcept: undefined
  taxonomies: Ember.Object.create
    from: null
  hierarchies: Ember.Object.create
    from: null
  inverted: false
  origin: Ember.computed 'taxonomies.from', ->
    @get 'taxonomies.from'
  originHierarchies: Ember.computed 'hierarchies.from',  ->
    @get 'hierarchies.from'


`export default MappingEffortService`
