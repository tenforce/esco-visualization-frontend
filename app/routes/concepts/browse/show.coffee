`import Ember from 'ember'`

ConceptsShowRoute = Ember.Route.extend
  sessionInfo: Ember.inject.service()
  hierarchyService: Ember.inject.service()
  renderTemplate: ->
    @render({
      into: 'concepts',
      outlet: 'right'
    })
  beforeModel: ->
    @set('hierarchyService.loading', true)
  model: (params) ->
    options ={
      filter:
        id: params.id
      include: "pref-labels.pref-label-of,hidden-labels.pref-label-of,alt-labels.pref-label-of"
    }
    @store.query('concept', options).then (concepts) =>
      concept = concepts.get('firstObject')

      # TODO : Should probably check whether the concept is part of the current taxonomy OR AT LEAST part of the available ones
      if concept and concept.get('id')
        @set('sessionInfo.concept', concept)
        @set('hierarchyService.target', concept.get('id'))
        @set('hierarchyService.loading', false)
        concept
      else
        console.log "Concept not found"
        @transitionTo('error').then (newRoute) ->
          newRoute.controller.set('title', "Concept not found")
          newRoute.controller.set('reason', "The concept with ID [<i>#{params.id}</i>] could not be found.")


`export default ConceptsShowRoute`
