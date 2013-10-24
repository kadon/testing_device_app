ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  #Entities.configureStorage Entities.Device
  class Entities.DeviceCollection extends Backbone.Collection
    #url: "devices"
    url: "/devices"
    model: Entities.Device
    comparator: "brand"
