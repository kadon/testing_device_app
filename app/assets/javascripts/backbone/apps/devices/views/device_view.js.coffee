ManagerDevicesApp.module "DevicesApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class List.Contact extends Marionette.ItemView
    tagName: "li"
    className: "span2"
    template: "devices/list_item"
    events:
      click: "highlightName"
      "click td a.js-show": "showClicked"
      "click td a.js-edit": "editClicked"
      "click button.js-delete": "deleteClicked"

    ui:
      thumbnails: '.thumbnail'

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
      @ui.thumbnails.find('li.hint').tooltip() #Show hint about each option

    remove: ->
      #@$el.fadeOut ->
      #  $(this).remove()

