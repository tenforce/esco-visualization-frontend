`import Ember from 'ember'`

ErrorRoute = Ember.Route.extend
  beforeModel: (params) ->
    @controllerFor('error').set('origin', window.location.href)
    console.log "error coming from : " +window.location.href

`export default ErrorRoute`
