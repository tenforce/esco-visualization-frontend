`import Ember from 'ember'`

LanguageSelectorComponent = Ember.Component.extend
  tagName: "div"
  classNames: ['language-selector']

  languageManager: Ember.inject.service('language-manager')

  languages: Ember.computed.alias 'languageManager.languages'
  selectedLanguage: Ember.computed.alias 'languageManager.selectedLanguage'

  actions:
    selectLanguage: (language) ->
      @set('languageManager.selectedLanguage', language)

`export default LanguageSelectorComponent`
