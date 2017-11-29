`import Ember from 'ember'`

ConceptTypeWatcherService = Ember.Service.extend
  currentType: undefined
  searchOrigins: Ember.computed ->
    array = []
    array.push @get('occupationsOrigin')
    array.push @get('skillsOrigin')
    array
  occupationsOrigin: {label: "Occupations", type: "http://data.europa.eu/esco/model#Occupation", scheme: "6b73f82c-2543-4a72-a86d-e988869df5ca"}
  skillsOrigin: {label: "Skills", type:"http://data.europa.eu/esco/model#Skill", scheme: "046d8963-cafa-4b6a-9f62-c76c5ac784cb"}
  selectedOrigin: Ember.computed 'occupationsOrigin', ->
    @get 'occupationsOrigin'
  originIsSkill: Ember.computed 'selectedOrigin.type', ->
    @get('skillsOrigin.type') is @get('selectedOrigin.type')
  originIsOccupation: Ember.computed 'selectedOrigin.type', ->
    @get('occupationsOrigin.type') is @get('selectedOrigin.type')

`export default ConceptTypeWatcherService`
