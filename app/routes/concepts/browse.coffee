`import Ember from 'ember'`

ConceptsBrowseRoute = Ember.Route.extend
  sessionInfo: Ember.inject.service()
  errorTaxonomy: {
    id: undefined,
    label: "Unknown concept scheme",
    hierarchyMessage: "This hierarchy does not exist",
    showHierarchy: false,
    disableSearch: true,
    disableFilters: true,
    disableShadow: true
  }
  renderTemplate: ->
    @render({outlet: 'left'})
  model: (params) ->
    id = params?.taxonomy
    taxonomies = @modelFor('concepts')
    i = 0
    while(i<taxonomies?.length)
      tax = taxonomies[i]
      if (tax.id is id) or (tax?.ids.contains(id))
        checkPresence = true
        break
      i++
    if checkPresence
      @set('sessionInfo.taxonomy', tax)
      return tax
    else
      console.log "ERROR : Not allowed"
      tax = @get('errorTaxonomy')
      @set('sessionInfo.taxonomy', tax)
      @transitionTo('error').then (newRoute) ->
        newRoute.controller.set('title', "Taxonomy not found")
        newRoute.controller.set('reason', "The taxonomy with ID [<i>#{params.taxonomy}</i>] could not be found.")
      return tax


`export default ConceptsBrowseRoute`
