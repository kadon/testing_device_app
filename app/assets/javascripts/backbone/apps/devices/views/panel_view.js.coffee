ManagerDevicesApp.module "DevicesApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class List.Panel extends Marionette.ItemView
    template: "common/list_panel"
    #triggers:
    #  "click button.js-new": "device:new"
    events:
      "click button.js-filter": "filterClicked"
      "click .js-toggle-view": "toggleView"

    ui:
      criterion: "input.js-filter-criterion"
      toggleView: "js-toggle-view"

    filterClicked: (e)->
      e.preventDefault()
      criterion = @$(".js-filter-criterion").val()
      ManagerDevicesApp.trigger "devices:filter", criterion

    onSetFilterCriterion: (criterion) ->
      $(@ui.criterion).val criterion

    toggleView: (e)->
      e.preventDefault()
      target = $(e.currentTarget)
      target.toggleClass("simple")
      @trigger "change:view:type"
      ManagerDevicesApp.trigger "devices:list"


      #if target.hasClass("js-devices-view")
      #  target.addClass("js-simple-view")
      #  target.removeClass("js-devices-view")
      #else
      #  target.addClass("js-devices-view")
      #  target.removeClass("js-simple-view")
        
      
