`import Ember from 'ember'`
`import ENV from '../../../config/environment'`


ShowConceptController = Ember.Controller.extend

  defaultConceptDescriptionTagName: 'div'
  conceptDescriptionTagName: Ember.computed 'conceptDescription.tagName', 'defaultConceptDescriptionTagName', ->
    if @get 'conceptDescription.tagName' then @get 'conceptDescription.tagName'
    else @get 'defaultConceptDescriptionTagName'

  defaultConceptDescriptionClassNames: ['']
  conceptDescriptionClassNames: Ember.computed 'conceptDescription.classNames', 'defaultConceptDescriptionClassNames', ->
    if @get 'conceptDescription.classNames' then @get 'conceptDescription.classNames'
    else @get 'defaultConceptDescriptionClassNames'

  conceptDescriptionClass: Ember.computed 'concept.isOccupation', 'concept.isSkill', ->
    if @get 'concept.isOccupation' then return 'occupation'
    else if @get 'concept.isSkill' then return 'skill'
    else return 'occupation' # by default, for ISCO concepts

  objectModel: Ember.computed 'model', 'model.id', ->
    if @get('model.isOccupation') or @get('model.isSkill')
      altterms = "localizedAltLabels"
    else
      altterms = "defaultAltLabels"
    attributes:
      tagName: 'div'
      classNames: ['concept concept-description']
      classNameBindings: ['object.isOccupation:occupation', 'object.isSkill:skill']
    title:
      attributes:
        tagName: 'div'
        classNames: ['concept-header']
      target:
        prefix:
          type: 'property'
          value: 'iscoValue'
          attributes:
            classNames: ['label']
        attributes:
          tagName: 'h1'
          classNames: ['main-title']
        type: 'property'
        value: 'localizedPrefLabel'
    headings:
      attributes:
        tagName: 'div'
        classNames: ['concept-detail']
      values:
        [
          {
            attributes:
              tagName: 'div'
              classNames: ['concept-block concept-block-info']
            properties:
              collapsible: true
              collapsed: false
            title:
              attributes:
                tagName: ''
              target:
                attributes:
                  tagName: 'h2'
                type: 'string'
                value: 'Concept info'
            items:
              attributes:
                tagName: ''
              values:[
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-pref-label']
                  label:
                    type: 'string'
                    value: 'Preferred term in reference language (English)'
                    attributes:
                      tagName: 'h3'
                  target:
                    type: 'property'
                    value: 'defaultPrefLabel'
                },
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-description']
                  label:
                    type: 'string'
                    value: 'Description'
                    attributes:
                      tagName: 'h3'
                  target:
                    type: 'component'
                    value: 'formatted-description'
                    properties:
                      parameters:
                        name: 'localizedDescription'
                },
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-terms']
                  label:
                    type: 'string'
                    value: 'Non-preferred terms'
                    attributes:
                      tagName: 'h3'
                  target:
                    attributes:
                      tagName: ''
                    type: 'hasMany'
                    value: altterms
                    relation:
                      type: 'property'
                      value: 'literalForm'
                    container:
                      attributes:
                        tagName: 'div'
                        classNames: ['inner inner-terms']
                    member:
                      attributes:
                        tagName: 'span'
                        classNames: ['term']
                },
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-notes']
                  label:
                    type: 'string'
                    value: 'Scope notes'
                    attributes:
                      tagName: 'h3'
                  target:
                    type: 'property'
                    value: 'localizedScopeNote'
                },
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-code isco']
                  label:
                    type: 'string'
                    value: 'ISCO-08'
                    attributes:
                      tagName: 'h3'
                  target:
                    type: 'property'
                    value: 'iscoLabeledCode'
                }
              ]
          },
          {
            attributes:
              tagName: 'div'
              classNames: ['concept-block concept-block-related']
            properties:
              collapsible: true
              collapsed: false
            title:
              attributes:
                tagName: 'h2'
              target:
                type: 'string'
                value: 'Related skills / competences'
            items:
              attributes:
                tagName: ''
              values:[
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-skills']
                  target:
                    type: 'component'
                    value: 'show-skills'
                    properties:
                      parameters:
                        title: 'Essential'
                        skillRelation: 'essentialSkills'
                        tooltip: '\'Essential skills/competences\' are those skills/competences that are usually relevant for an occupation, independent of the work context, the employer or the country.'
                },
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-skills']
                  target:
                    type: 'component'
                    value: 'show-skills'
                    properties:
                      parameters:
                        title: 'Optional'
                        skillRelation: 'optionalSkills'
                        tooltip: '\'Optional skills/competences\' refer to skills/competences that may be relevant or occur when working in an occupation depending on the employer, on the working context or on the country.'
                }
              ]
          },
          {
            attributes:
              tagName: 'div'
              classNames: ['concept-block concept-block-related']
            properties:
              collapsible: true
              collapsed: false
            title:
              attributes:
                tagName: 'h2'
              target:
                type: 'string'
                value: 'Related knowledge'
            items:
              attributes:
                tagName: ''
              values:[
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-skills']
                  target:
                    type: 'component'
                    value: 'show-skills'
                    properties:
                      parameters:
                        title: 'Essential'
                        skillRelation: 'essentialKnowledges'
                        tooltip: '\'Essential knowledge\' is knowledge that is usually relevant for an occupation, independent of the work context, the employer or the country.'
                },
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-skills']
                  target:
                    type: 'component'
                    value: 'show-skills'
                    properties:
                      parameters:
                        title: 'Optional'
                        skillRelation: 'optionalKnowledges'
                        tooltip: '\'Optional knowledge\' is knowledge that may be relevant or occur when working in an occupation depending on the employer, on the working context or on the country.'
                }
              ]
          },
          {
            attributes:
              tagName: 'div'
              classNames: ['concept-block concept-block-related']
            properties:
              collapsible: true
              collapsed: false
            title:
              attributes:
                tagName: 'h2'
              target:
                type: 'string'
                value: 'Related occupations'
            items:
              attributes:
                tagName: ''
              values:[
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-skills']
                  target:
                    type: 'component'
                    value: 'show-skills'
                    properties:
                      parameters:
                        title: 'Essential for'
                        skillRelation: 'essentialForOccupation'
                        tooltip: '\'Essential for\' are the occupations that are usually relevant to this skill or knowledge, independent of the work context, the employer or the country.'
                },
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-skills']
                  target:
                    type: 'component'
                    value: 'show-skills'
                    properties:
                      parameters:
                        title: 'Optional for'
                        skillRelation: 'optionalForOccupation'
                        tooltip: '\'Optional for\' are the occupations that may be relevant to this skill or knowledge, depending on the work context, the employer or on the country.'
                }
              ]
          },
          {
            attributes:
              tagName: 'div'
              classNames: ['concept-block concept-block-related']
            properties:
              collapsible: true
              collapsed: false
            title:
              attributes:
                tagName: 'h2'
              target:
                type: 'string'
                value: 'Related skills'
            items:
              attributes:
                tagName: ''
              values:[
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-skills']
                  target:
                    type: 'component'
                    value: 'show-skills'
                    properties:
                      parameters:
                        title: 'Essential for'
                        skillRelation: 'essentialSkillForSkill'
                        tooltip: '\'Essential for\' are the skills that are usually relevant to this skill or knowledge, independent of the work context, the employer or the country.'
                },
                {
                  attributes:
                    tagName: 'div'
                    classNames: ['inner inner-skills']
                  target:
                    type: 'component'
                    value: 'show-skills'
                    properties:
                      parameters:
                        title: 'Optional for'
                        skillRelation: 'optionalSkillForSkill'
                        tooltip: '\'Optional for\' are the skills that may be relevant to this skill or knowledge, depending on the work context, the employer or on the country.'
                }
              ]
          }
        ]


  datastringAsBlob: (data, acceptType) ->
    ords = Array::map.call(data, byteValue)
    bytes = new Uint8Array(ords)

    byteValue = (x) ->
      x.charCodeAt(0) & 0xff
    new Blob([ bytes ], type: acceptType)

  currConceptName: Ember.computed 'model.localizedPrefLabel', ->
    @get 'model.localizedPrefLabel'
  currFileName: Ember.computed 'currConceptName', ->
    @get('currConceptName').then (name) ->
      unless name then name = "download"
      filename = name.replace(" ", "_")+".pdf"

  actions:
    click: ->
      contents = $(".concept-description").html();
      currentHtml = '<!DOCTYPE html [<!ENTITY nbsp "&#160;"> ]><html><head><style>body{font-family:Verdana;font-size:16px;line-height:1.2}h1{margin:0;font-size:24px;text-transform:uppercase}h2{margin:20px 0 5px;font-weight:100;border-bottom:1px solid #CCC;font-size:20px}h3{margin:10px 0 5px;font-size:14px}.inner{margin:5px 0 15px}.skills span,.inner-terms span{display:inline-block;padding:5px;border:1px solid #CCC;line-height:1;margin:0 0 5px 0;border-radius:5px;font-size:12px;white-space:nowrap;}.inner-description div,.inner-code div, .inner-nace div{font-size:16px}</style></head><body>'+contents+'</body></html>'
      xhr = new window.XMLHttpRequest();
      xhr.onreadystatechange = ()=>
        if(xhr.readyState ==4 && xhr.status ==200)
          console.log("Pdf downloaded");
          blob = datastringAsBlob(xhr.responseText, "application/pdf")
          @get('currFileName').then (filename) ->
            window.saveAs(blob, filename)
      xhr.overrideMimeType('application/pdf; charset=x-user-defined')
      xhr.open("POST", "pdf",false)
      xhr.setRequestHeader("Accept","application/pdf")
      xhr.send(currentHtml)



`export default ShowConceptController`
