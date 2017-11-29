`import Ember from 'ember'`
`import {languages} from '../utils/languages'`

LanguageManagerService = Ember.Service.extend
  selectedLanguage: Ember.computed ->
    userlang = window.navigator.language || "en"
    res = languages.filter (lg) ->
      if lg.id is userlang.substr(0,2) then return true
      else return false
    return res[0] || @get('defaultLanguage')
  defaultLanguage: {title: "English", id: "en"}
  languages: languages

  languagePreference: Ember.computed 'selectedLanguage.id', 'defaultLanguage.id', ->
    array = []
    if @get('selectedLanguage.id') then array.push(@get('selectedLanguage.id'))
    unless array.contains(@get('defaultLanguage.id')) then array.push(@get('defaultLanguage.id'))
    array
  displayLanguage: Ember.computed 'languagePreference.length', 'languagePreference.@each', ->
    @get('languagePreference')?[0] || @get('defaultLanguage.id') || "en"

`export default LanguageManagerService`
