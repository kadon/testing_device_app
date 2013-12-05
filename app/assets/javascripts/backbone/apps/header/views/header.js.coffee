ManagerDevicesApp.module "HeaderApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class List.Header extends Marionette.ItemView
    template: "headers/header_link"
    tagName: "li"
    events:
      "click a.menu-item": "navigate"

    navigate: (e) ->
      e.preventDefault()
      @trigger "navigate", @model

    onRender: ->
      @$el.addClass "active"  if @model.selected
