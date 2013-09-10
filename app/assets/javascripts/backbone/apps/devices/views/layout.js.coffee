ManagerDevicesApp.module "DevicesApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class List.Layout  extends Marionette.Layout
    template:    "common/layout_list"
    className:   "row"
    regions:
      panelRegion:    "#panel-region"
      contactsRegion: "#contacts-region"
