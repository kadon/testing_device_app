@ManagerDevicesApp.module "HeaderApp", (HeaderApp, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  API = listHeader: ->
    HeaderApp.List.Controller.listHeader()

  ManagerDevicesApp.commands.setHandler "set:active:header", (name) ->
    ManagerDevicesApp.HeaderApp.List.Controller.setActiveHeader name

  HeaderApp.on "start", ->
    API.listHeader()
