ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  initializeHeaders = ->
    Entities.headers = new Entities.HeaderCollection([
      name: "Devices"
      url: "devices"
    ])

  API = getHeaders: ->
    initializeHeaders()  if Entities.headers is `undefined`
    Entities.headers

  ManagerDevicesApp.reqres.setHandler "header:entities", ->
    API.getHeaders()


