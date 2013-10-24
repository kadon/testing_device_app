@ManagerDevicesApp.module "HeaderApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  List.Controller =
    listHeader: ->
      links = ManagerDevicesApp.request("header:entities")
      headers = new List.Headers(collection: links)
      headers.on "brand:clicked", ->
        ManagerDevicesApp.trigger "devices:list"

      headers.on "itemview:navigate", (childView, model) ->
        console.log('navigate controller')
        url = model.get("url")
        if url is "devices"
          ManagerDevicesApp.trigger "devices:list"
        else if url is "about"
          ManagerDevicesApp.trigger "about:show"
        else
          throw "No such sub-application: " + url

      ManagerDevicesApp.headerRegion.show headers

    setActiveHeader: (headerUrl) ->
      links = ManagerDevicesApp.request("header:entities")
      headerToSelect = links.find((header) ->
        header.get("url") is headerUrl
      )
      headerToSelect.select()
      links.trigger "reset"

