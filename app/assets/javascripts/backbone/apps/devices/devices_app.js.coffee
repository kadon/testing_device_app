ManagerDevicesApp.module "DevicesApp", (DevicesApp, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  API =
    listDevices: (criterion) ->
      console.log("listDevies")
      DevicesApp.List.Controller.listDevices criterion
      ManagerDevicesApp.execute "set:active:header", "devices"

  ManagerDevicesApp.on "devices:list", ->
    ManagerDevicesApp.navigate "devices"
    API.listDevices()

  ManagerDevicesApp.on "devices:filter", (criterion) ->
    if criterion
      ManagerDevicesApp.navigate "devices?filter=" + criterion, true
    else
      ManagerDevicesApp.navigate "devices", true

  ManagerDevicesApp.addInitializer ->
    new DevicesApp.Router(controller: API)


