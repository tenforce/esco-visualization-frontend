`import Ember from 'ember';`
`import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'concepts', { path: '/concepts/' }, ->
    @route 'index', { path: '/' }
    @route 'browse', { path: ':taxonomy/browse' }, ->
      @route 'show', { path: ':id' }
      @route 'index', { path: '/' }
  @route 'error'
  @route 'index', {path: ''}
  @route 'index', {path: '/*wildcard'}

`export default Router;`
