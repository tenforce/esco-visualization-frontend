`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend
  actions:
    returnToIndex: ->
      @transitionToRoute('')

`export default ApplicationController`
