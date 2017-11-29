`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'concept-notation', 'Integration | Component | concept notation', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 1

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->
  @set 'model', {code:42}

  @render hbs """
    {{concept-notation model=model}}
  """

  assert.equal @$().text().trim(), 42
