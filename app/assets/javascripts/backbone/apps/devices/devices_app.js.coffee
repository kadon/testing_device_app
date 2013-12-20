ManagerDevicesApp.module "DevicesApp", (DevicesApp, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  API =
    listDevices: (criterion, mode) ->
      console.log("listDevies")
      DevicesApp.List.Controller.listDevices criterion, mode
      ManagerDevicesApp.execute "set:active:header", "devices"

  ManagerDevicesApp.on "devices:list", (mode)->
    ManagerDevicesApp.navigate "devices"
    API.listDevices(null, mode)

  ManagerDevicesApp.on "devices:filter", (criterion) ->
    if criterion
      ManagerDevicesApp.navigate "devices?filter=" + criterion, true
    else
      ManagerDevicesApp.navigate "devices", true

  ManagerDevicesApp.addInitializer ->
    new DevicesApp.Router(controller: API)


