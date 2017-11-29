`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'nav-bar', 'Integration | Component | nav bar', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 1

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  # Not much to test here...
  @render hbs """{{nav-bar}}"""

  assert.equal @$().text().trim(), ''
