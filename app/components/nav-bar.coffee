`import Ember from 'ember'`
`import ClickElsewhereMixin from '../mixins/click-elsewhere'`

NavBarComponent = Ember.Component.extend ClickElsewhereMixin,
  mappingEffort: Ember.inject.service()
  from: Ember.computed.alias 'mappingEffort.taxonomies.from'
  classNames: ["main-header"]
  menuClosed: true

  onClickElsewhere: ->
    @set('menuClosed', true)

  actions:
    closeMenu: ->
      @set('menuClosed', true)
    toggleMenu: ->
      @toggleProperty 'menuClosed'
    returnToIndex: ->
      @sendAction('returnToIndex')

`export default NavBarComponent`
