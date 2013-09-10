ManagerDevicesApp.module "DevicesApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class List.Panel extends Marionette.ItemView
    template: "common/list_panel"
    #triggers:
    #  "click button.js-new": "contact:new"
    events:
      "click button.js-filter": "filterClicked"

    ui:
      criterion: "input.js-filter-criterion"

    filterClicked: ->
      criterion = @$(".js-filter-criterion").val()
      @trigger "devices:filter", criterion

    onSetFilterCriterion: (criterion) ->
      $(@ui.criterion).val criterion
