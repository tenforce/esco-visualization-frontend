`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'formatted-description', 'Integration | Component | formatted description', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{formatted-description}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#formatted-description}}
      template block text
    {{/formatted-description}}
  """

  assert.equal @$().text().trim(), 'template block text'
