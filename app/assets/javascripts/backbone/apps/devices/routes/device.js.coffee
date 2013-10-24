ManagerDevicesApp.module "DevicesApp", (DevicesApp, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class DevicesApp.Router extends Marionette.AppRouter
    appRoutes:
      "devices(?filter=:criterion)": "listDevices"
