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
    className: "span2"
    template: "devices/list_item"
    templateItemListOptions: "devices/list_option_item"
    events:
      click: "highlightName"
      "click td a.js-show": "showClicked"
      "click td a.js-edit": "editClicked"
      "click button.js-delete": "deleteClicked"

    ui:
      thumbnails: '.thumbnail'
      statusLabel: 'span.label'
      optionsList: 'ul.options'

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

    editClicked: (e) ->
      e.preventDefault()
      e.stopPropagation()
      #@trigger "contact:edit", @model

    deleteClicked: (e) ->
      e.stopPropagation()
      #@trigger "contact:delete", @model

    onRender: ->
      @ui.statusLabel.addClass(@model.getStatusLabelClass())
      @renderOptions()
      @ui.thumbnails.find('li.hint').tooltip() #Show hint about each option

    renderOptions: ->
      status = @model.get('status')
      for action in ACTIONS
	#if ManagerDevicesApp.Autentication.can? option, @model
        @ui.optionsList.append(HandlebarsTemplates[@templateItemListOptions]( action )) if ManagerDevicesApp.Authorization.can( action.cancan_name, 'Device') #unless option is 'Use' or option is "Release" and status is "UNAVAILABLE"
        
    remove: ->
      #@$el.fadeOut ->
      #  $(this).remove()

