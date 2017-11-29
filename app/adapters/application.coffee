`import HasManyQuery from 'ember-data-has-many-query'`

Adapter = DS.JSONAPIAdapter.extend HasManyQuery.RESTAdapterMixin,
  fetchUrl: (url) ->
    random = Math.random()
    url+"?page[size]=10000&page[offset]=0&page[random]="+random

`export default Adapter`
