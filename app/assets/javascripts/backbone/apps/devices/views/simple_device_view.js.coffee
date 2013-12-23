ManagerDevicesApp.module "DevicesApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class List.SimpleDevice extends Marionette.ItemView
    tagName: "tr"
    className: "device"
    template: "devices/simple_list_item"

    ui:
      statusLabel: 'span.label'

    onRender: ->
      @ui.statusLabel.addClass(@model.getStatusLabelClass())

