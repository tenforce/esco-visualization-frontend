`import Ember from 'ember'`

ConceptsIndexRoute = Ember.Route.extend
  afterModel: (transition) ->
    @_super(arguments)
    @transitionTo('concepts.browse', "6b73f82c-2543-4a72-a86d-e988869df5ca")

`export default ConceptsIndexRoute`
