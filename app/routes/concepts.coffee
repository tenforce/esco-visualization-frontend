`import Ember from 'ember'`
`import env from 'visualization-tool-ui/config/environment'`

ConceptsRoute = Ember.Route.extend
  sessionInfo: Ember.inject.service()
  model: (params) ->
    promises = []
    taxonomies = env.conceptSchemes
    filtered = taxonomies.filter (cs) =>
      if cs.disable is true then return false
      if cs.default is true then @set('sessionInfo.taxonomy', cs)
      promises.push(
        @store.findRecord('taxonomy', cs.id).then (dbtaxonomy) =>
          Ember.set(cs, 'dbTaxonomy', dbtaxonomy)
          return dbtaxonomy
      )
      true
    Ember.RSVP.Promise.all(promises).then () ->
      return filtered
  getSchemeId: (item) ->
    return item.getTaxonomyId()
  actions:
    activateItem: (item) ->
      item.get('taxonomies').then (taxs) =>
        id = @getSchemeId(item)
        @transitionTo('concepts.browse.show', id, item.get('id'))


`export default ConceptsRoute`
