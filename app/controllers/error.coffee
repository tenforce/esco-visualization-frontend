`import Ember from 'ember'`

ErrorController = Ember.Controller.extend
  title: "Something went wrong"
  parsedTitle: Ember.computed 'title', ->
    return Ember.String.htmlSafe(@get('title'))
  reason: "Unknown reasons"
  parsedReason: Ember.computed 'reason', ->
    return Ember.String.htmlSafe(@get('reason'))
  message: undefined
  parsedMessage: Ember.computed 'message', ->
    return Ember.String.htmlSafe(@get('message'))

  actions:
    returnToIndex: ->
      @transitionToRoute('')
`export default ErrorController`
