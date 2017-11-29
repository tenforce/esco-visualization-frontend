`import Ember from 'ember'`
`import sortByPromise from '../utils/sort-by-promise'`
`import env from '../config/environment'`

HierarchyConfigMixin = Ember.Mixin.create
  languageManager: Ember.inject.service('language-manager')
  displayLanguage: Ember.computed.alias 'languageManager.displayLanguage'
  status: 'all'

  ###
  # Builds a filter object that is compatible with the taxonomy-browser's filter requirements
  ###
  ###filters: Ember.computed ->
    filterConfig = env.filters
    config = filterConfig.inStatus
    @_computeFilters(config)

  # based on the given config, compute the right filter spec
  _computeFilters: (config) ->
    statuses = @get 'statuses'
    self = this
    filters = statuses.map (status) ->
      currentConfig = config
      # all is a special one, we need a different filter for it or none if also not filtering
      if status.id == 'all'
        currentConfig = {}
      filter =
        name: status.name
        id: currentConfig.id
        params: {}
      currentConfig.variables?.map (name) ->
        filter.params[name] = self.get name
      filter.params.status = status.id
      filter###

  config: Ember.computed 'defaultExpanded', 'displayLanguage', ->
    # if display language changes, fetch the concepts again
    lg = @get 'displayLanguage'
    # property path to the property that should be used as label
    # e.g. model.label.en would be label.en
    Ember.Object.create
      sortKey: ["defaultCode", "localizedPrefLabel"]
      labelPropertyPath: 'localizedPrefLabel'
      onActivate: (node) =>
        @send 'activateItem', node
      # list of concept ids that are expanded
      # will auto expand a node in the tree if it's id is contained in this array
      expandedConcepts: []
      # max amount (n) of children to be shown before a load more button is presented
      # load more button shows an extra n children
      showMaxChildren: 50
      noScroll: true
      # route used in link-to of the node
      linkToRoute: 'concepts.show'
      beforeComponent: 'concept-notation'

`export default HierarchyConfigMixin`
