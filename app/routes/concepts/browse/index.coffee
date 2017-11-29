`import Ember from 'ember'`

ConceptsBrowseIndexRoute = Ember.Route.extend
  renderTemplate: ->
    @render({outlet: 'right', into:'concepts'})

`export default ConceptsBrowseIndexRoute`
