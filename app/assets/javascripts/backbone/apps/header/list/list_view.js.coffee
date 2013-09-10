ManagerDevicesApp.module "HeaderApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  List.Header = Marionette.ItemView.extend(
    template: "headers/header_link"
    tagName: "li"
    events:
      "click a": "navigate"

    navigate: (e) ->
      e.preventDefault()
      @trigger "navigate", @model

    onRender: ->
      
      # add class so Bootstrap will highlight the active entry in the navbar
      @$el.addClass "active"  if @model.selected
  )

  List.Headers = Marionette.CompositeView.extend(
    template: "headers/header_template"
    className: "navbar navbar-fixed-top"
    itemView: List.Header
    itemViewContainer: "ul"
    events:
      "click a.brand": "brandClicked"

    brandClicked: (e) ->
      @trigger "brand:clicked"
  )

