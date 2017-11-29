`import Ember from 'ember'`
`import HierarchyConfig from 'visualization-tool-ui/mixins/hierarchy-config'`
`import env from 'visualization-tool-ui/config/environment'`

ConceptsBrowseController = Ember.Controller.extend HierarchyConfig,
  languageManager: Ember.inject.service('language-manager')
  displayLanguage: Ember.computed.alias 'languageManager.displayLanguage'
  sessionInfo: Ember.inject.service()
  showHierarchy: Ember.computed 'model.id', 'model.showHierarchy', ->
    @get('model.showHierarchy') is not false
  hierarchyMessage: Ember.computed 'model.id', 'model.hierarchyMessage', ->
    @get('model.hierarchyMessage')
  disableSearch: Ember.computed 'model.id', 'model.disableSearch', ->
    @get('model.disableSearch') is true
  disableFilters: Ember.computed 'model.id', 'model.disableFilters', ->
    @get('model.disableFilters') is true
  disableShadow: Ember.computed 'model.id', 'model.disableShadow', ->
    @get('model.disableShadow') is true
  actions:
    activateItem: (item) ->
      true


`export default ConceptsBrowseController`
