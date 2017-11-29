`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'selected-language', 'Integration | Component | selected language', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{selected-language}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#selected-language}}
      template block text
    {{/selected-language}}
  """

  assert.equal @$().text().trim(), 'template block text'
