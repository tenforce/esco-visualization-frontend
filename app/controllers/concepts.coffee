`import Ember from 'ember'`
`import env from 'visualization-tool-ui/config/environment'`

ConceptsController = Ember.Controller.extend
  sessionInfo: Ember.inject.service()
  selectedTaxonomy: Ember.computed.alias 'sessionInfo.taxonomy'
  actions:
    selectTaxonomy: (taxonomy) ->
      @set('sessionInfo.taxonomy', taxonomy)
      @transitionToRoute('concepts.browse', taxonomy.id)

`export default ConceptsController`
