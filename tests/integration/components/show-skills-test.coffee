`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'show-skills', 'Integration | Component | show skills', {
  integration: true
}

test 'it renders', (assert) ->
  store = this.container.lookup('service:store')
  assert.expect 0
  blip = @
  Ember.run () =>
    store.find('concept', '1DE4B298-C998-11E5-AF4F-DBC8669C75B0').then (resconcept) =>
      @set('concept', resconcept)
      blip.render hbs """ {{show-skills concept=concept}} """
