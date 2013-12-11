ManagerDevicesApp.module "DevicesApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  ACTIONS = [
    {name: 'edit', cancan_name: 'edit', icon: 'icon-pencil'},
    {name: 'show', cancan_name: 'read', icon: 'icon-eye-open'},
    {name: 'remove', cancan_name: 'remove', icon: 'icon-remove-circle'},
    {name: 'use', cancan_name: 'read', icon: 'icon-hand-up'},
    {name: 'relase', cancan_name: 'read',  icon: 'icon-hand-down'}
  ]

  class List.Contact extends Marionette.ItemView
    tagName: "li"
    className: "span2 device"
    template: "devices/list_item"
    templateItemListOptions: "devices/list_option_item"

    events:
      click: "highlightName"
      "click td a.js-show": "showClicked"
      "click td a.js-edit": "editClicked"
      "click button.js-delete": "deleteClicked"
      "click i.edit": "editDevice"
      "click i.show": "showDevice"
      "click i.remove": "removeDevice"
      "click i.use": "useDevice"
      "click i.relase": "relaseDevice"

    ui:
      thumbnails: '.thumbnail'
      statusLabel: 'span.label'
      optionsList: 'ul.options'

    initialize: ->
      #@listenTo @model, 'destroy', @remove
      @listenTo @model, "error", @showErrorAlert
      @listenTo @model, "sync", @render
      @listenTo @model, "request", @showSpinner

    showSpinner: ->
      console.log('Show spinner when there is a request')

    showErrorAlert: (model, xhr, options)->
      modelErrors = []
      if xhr.responseJSON.errors
        if typeof xhr.responseJSON.errors == 'string'
          modelErrors.push xhr.responseJSON.errors
        else
          _.each(xhr.responseJSON.errors, (errors, attribute)->
            err = errors.join "; "
            modelErrors.push( attribute + ": " + err )
          )
      ManagerDevicesApp.trigger "showAlert", modelErrors, 'error'

    flash: (cssClass) ->
      $view = @$el
      $view.hide().toggleClass(cssClass).fadeIn 800, ->
        setTimeout (->
          $view.toggleClass cssClass
        ), 500


    highlightName: (e) ->
      @$el.toggleClass "warning"

    showClicked: (e) ->
      e.preventDefault()
      e.stopPropagation()
      #@trigger "contact:show", @model

    editDevice: (e) ->
      e.preventDefault()
      e.stopPropagation()
      console.log("edit this device")

    showDevice: (e) ->
      e.preventDefault()
      e.stopPropagation()
      console.log("show this device")

    removeDevice: (e) ->
      e.preventDefault()
      e.stopPropagation()
      @trigger "device:delete", @model

    useDevice: (e) ->
      e.preventDefault()
      e.stopPropagation()
      @trigger "device:mark_as_using"

    relaseDevice: (e) ->
      e.preventDefault()
      e.stopPropagation()
      return unless confirm("Are you sure?")
      @trigger "device:mark_as_available"

    editClicked: (e) ->
      e.preventDefault()
      e.stopPropagation()
      #@trigger "device:edit", @model

    deleteClicked: (e) ->
      e.stopPropagation()
      #@trigger "device:delete", @model

    onRender: ->
      console.log('Sync event')
      @ui.statusLabel.addClass(@model.getStatusLabelClass())
      @renderOptions()
      @ui.thumbnails.find('li.hint').tooltip() #Show hint about each option
      @ui.statusLabel.popover({title: 'Titulo', trigger: 'hover'})

    renderOptions: ->
      status = @model.get('status')
      for action in ACTIONS
        if ManagerDevicesApp.Authorization.can( action.cancan_name, 'Device')
          @ui.optionsList.append(HandlebarsTemplates[@templateItemListOptions]( action )) 
        
    #remove: ->
      #@$el.fadeOut ->
      #  $(this).remove()

