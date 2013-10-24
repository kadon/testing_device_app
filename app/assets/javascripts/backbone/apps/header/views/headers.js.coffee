ManagerDevicesApp.module "HeaderApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class List.Headers extends Marionette.CompositeView
    template: "headers/header_template"
    className: "navbar navbar-fixed-top"
    itemView: List.Header
    itemViewContainer: "ul.nav"
    events:
      "click a.brand": "brandClicked"

    brandClicked: (e) ->
      @trigger "brand:clicked"
