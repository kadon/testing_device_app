ManagerDevicesApp.module "HeaderApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class List.Headers extends Marionette.CompositeView
    template: "headers/header_template"
    className: "navbar navbar-fixed-top"
    itemView: List.Header
    itemViewContainer: "ul.nav"
    events:
      "click a.brand": "brandClicked"
    
    ui:
      userButton: 'a.user.dropdown-toggle'

    brandClicked: (e) ->
      @trigger "brand:clicked"

    onRender: ->
      @ui.userButton.find("i.icon-user").after(ManagerDevicesApp.Authorization.current_user.get('email'))
