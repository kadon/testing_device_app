@ManagerDevicesApp.module "HeaderApp", (Header, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  API = listHeader: ->
    Header.List.Controller.listHeader()

  ManagerDevicesApp.commands.setHandler "set:active:header", (name) ->
    ManagerDevicesApp.HeaderApp.List.Controller.setActiveHeader name

  Header.on "start", ->
    API.listHeader()
