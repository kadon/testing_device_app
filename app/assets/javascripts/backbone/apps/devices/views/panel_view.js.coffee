ManagerDevicesApp.module "DevicesApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class List.Panel extends Marionette.ItemView
    template: "common/list_panel"
    #triggers:
    #  "click button.js-new": "device:new"
    events:
      "click button.js-filter": "filterClicked"

    ui:
      criterion: "input.js-filter-criterion"

    filterClicked: (e)->
      e.preventDefault()
      criterion = @$(".js-filter-criterion").val()
      ManagerDevicesApp.trigger "devices:filter", criterion

    onSetFilterCriterion: (criterion) ->
      $(@ui.criterion).val criterion
