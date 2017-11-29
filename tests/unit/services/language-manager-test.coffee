`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'service:language-manager', 'Unit | Service | language manager', {
  # Specify the other units that are required for this test.
  # needs: ['service:foo']
}

# Replace this with your real tests.
test 'it exists', (assert) ->
  service = @subject()
  assert.ok service
