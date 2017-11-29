`import Ember from 'ember'`
`import sortByPromise from '../utils/sort-by-promise'`
`import env from 'visualization-tool-ui/config/environment'`

ShowSkillsComponent = Ember.Component.extend
  tagName: 'div'
  classNames: ['skills']
  classNameBindings: ['shadowSkills:shadowed:open']
  properties: Ember.computed.alias 'model.properties'
  parameters: Ember.computed.alias 'properties.parameters'

  sessionInfo: Ember.inject.service()

  skillLimit: Ember.computed.alias 'parameters.skillLimit'
  title: Ember.computed.alias 'parameters.title'
  tooltip: Ember.computed.alias 'parameters.tooltip'
  fullDetail: false
  # the skills to be passed in
  skillRelation: Ember.computed.alias 'parameters.skillRelation'

  skills: Ember.computed 'object', 'skillRelation', ->
    @get "object.#{@get('skillRelation')}"

  skillsToDisplay: Ember.computed 'skillLimit', 'shadowSkills', 'sortedSkills', ->
    limit = @get('skillLimit')
    Ember.RSVP.hash(
      shadow: @get('shadowSkills')
      skills: @get('sortedSkills')
    ).then (hash) ->
      if hash.shadow then return hash.skills.slice(0, limit)
      else
        return hash.skills

  shadowSkills: Ember.computed 'fullDetail','skillLimit', 'skills', 'skills.length', ->
    if @get('fullDetail') then return false

    limit = @get('skillLimit')
    @get('skills').then (result) ->
      if not limit or (Ember.get(result, 'length')) <= limit
        return false
      else
        return true

  sortedSkills: Ember.computed 'skills', ->
    @get('skills').then (skills) ->
      promises = []
      skills.map (skill) ->
        promises.push(skill)
      Ember.RSVP.all(promises).then (resolvedSkills)->
        sortByPromise(resolvedSkills, 'localizedPrefLabel')

  showSkills: Ember.computed 'skills', ->
    @get('skills')?.then (skills) ->
      not Ember.isEmpty(skills)

  checkEmpty: Ember.observer('showSkills', ->
    if @get('showSkills')?.then
      @get('showSkills')?.then (result) =>
        unless result then @sendAction('handleHide', @get('model'))
    else @sendAction('handleHide', @get('model'))
  ).on('init')

  toggleTooltip: "Click to show the full list"

  typeWatcher: Ember.inject.service('concept-type-watcher')
  occupationsOrigin: Ember.computed.alias 'typeWatcher.occupationsOrigin'
  skillsOrigin: Ember.computed.alias 'typeWatcher.skillsOrigin'
  selectedOrigin: Ember.computed.alias 'typeWatcher.selectedOrigin'

  actions:
    toggleDetail: ->
      @toggleProperty 'fullDetail'
    handleSkillClick: (skill) ->
      ###if skill.get('isOccupation')
        @set('selectedOrigin', @get('occupationsOrigin'))###
      if env.switchTaxonomyOnClick then taxid = skill.getTaxonomyId()
      else taxid = @get('sessionInfo.taxonomy.id')
      Ember.getOwner(this).lookup('router:main').transitionTo("concepts.browse.show", taxid, skill.get('id'));

`export default ShowSkillsComponent`
