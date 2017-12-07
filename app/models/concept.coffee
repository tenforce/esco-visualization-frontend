`import DS from 'ember-data'`
`import ESCO from 'ember-esco-concept-description'`

Concept = DS.Model.extend ESCO.Concept,
  types: DS.attr('string-set')
  codes: DS.attr('string-set')
  defaultCode: Ember.computed 'codes', ->
    filtered = @get('codes')?.filter (code) ->
      if (code.search 'CTC') is -1
        return true
      else return false
    return filtered?[0]
  scopeNote: DS.attr('lang-string-set')
  defaultScopeNote: Ember.computed 'scopeNote.@each.language', ->
    @get('scopeNote')?.filterBy('language', @get('defaultLanguage'))?.get('firstObject.content')
  taxonomies: DS.hasMany('concept-scheme', {inverse:null})
  isco: DS.belongsTo('concept', {inverse: null})
  iscoValue: Ember.computed 'taxonomies', ->
    @get('taxonomies').then (hierarchies) =>
      result = undefined
      hierarchies.forEach (hierarchy) =>
        if hierarchy.get('preflabel')?.contains 'ISCO 2008'
          result = "ISCO #{@get('defaultCode')}"
      return result
  iscoCode: Ember.computed 'isco', ->
    @get('isco')?.then (isco) ->
      isco.get('defaultCode')
  iscoLabeledCode: Ember.computed 'isco', 'displayLanguage', ->
    @get('isco').then (isco) ->
      if isco
        code = isco.get('defaultCode')
        isco.get('localizedPrefLabel').then (label) ->
          return code + " - " + label
      else return undefined
  uri: DS.attr('string')
  definition: null
  anyChildren: true
  hasChildren: Ember.computed "anyChildren", ->
    return @get('anyChildren')


  #######
  ## TODO : refactor this into something less horrible
  getTaxonomyId: ->
    if @get('isOccupation') then return "6b73f82c-2543-4a72-a86d-e988869df5ca"
    if @get('isSkill') then return "c61aced6-0285-4da5-aa9e-ef09ba364f6e"
    else return "6b73f82c-2543-4a72-a86d-e988869df5ca"


  languageManager: Ember.inject.service('language-manager')
  displayLanguage: Ember.computed.alias 'languageManager.displayLanguage'

  localizedPrefLabels: Ember.computed 'displayLanguage', 'prefLabels', ->
    @get('prefLabels')?.then (labels) =>
      Ember.ArrayProxy.create content: labels?.filterBy('language', @get('displayLanguage'))
  localizedPrefLabel: Ember.computed 'displayLanguage', 'localizedPrefLabels.firstObject.literalForm', ->
    @get('localizedPrefLabels')?.then (labels) =>
      lit = labels.get('firstObject.literalForm')
      # NB : Looks like we have to display that no translation has been provided for this guy
      #unless lit then return @get('defaultPrefLabel')
      unless lit then return @get('msgNoTranslatedPrefLabel')
      else lit
  localizedAltLabels: Ember.computed 'altLabels', 'displayLanguage', ->
    @get('altLabels')?.then (labels) =>
      ret = Ember.ArrayProxy.create content: labels?.filterBy('language', @get('displayLanguage'))
      if ret?.get('length') > 0 then return ret
      else
        msg = @get('msgNoTranslatedAltLabels')
        arr = []
        arr.push(Ember.Object.create(literalForm: msg, language:"en"))
        return arr
  localizedHiddenLabels:Ember.computed 'hiddenLabels', 'displayLanguage', ->
    @get('hiddenLabels')?.then (labels) =>
      ret = Ember.ArrayProxy.create content: labels?.filterBy('language', @get('displayLanguage'))
      if ret?.get('length') > 0 then return ret
      else
        msg = @get('msgNoTranslatedHiddenLabels')
        arr = []
        arr.push(Ember.Object.create(literalForm: msg, language:"en"))
        return arr
  localizedDescription: Ember.computed 'description.@each.language', 'displayLanguage', ->
    # NB : Looks like the description will always be displayed in English, even if a translation is available
    #lit = @get('description')?.filterBy('language', @get('displayLanguage'))?.get('firstObject.content')
    #unless lit then return @get('defaultDescription')
    #else lit
    return @get('defaultDescription')

  msgNoTranslatedPrefLabel: Ember.computed 'defaultPrefLabel', 'displayLanguage', ->
    if @get('displayLanguage') is "en"
      new Ember.RSVP.Promise ->
        return "No preferred term"
    else
      @get('defaultPrefLabel').then (label) ->
        return "#{label} (translation pending)"
  msgNoTranslatedAltLabels: Ember.computed 'displayLanguage', ->
    if @get('displayLanguage') is "en" then return  "No non-preferred terms"
    else return "Translation pending"

  msgNoTranslatedHiddenLabels: Ember.computed 'displayLanguage', ->
    if @get('displayLanguage') is "en" then return "No hidden terms"
    else return "Translation pending"


`export default Concept`
