ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  Entities.Header = Backbone.Model.extend(initialize: ->
    selectable = new Backbone.Picky.Selectable(this)
    _.extend this, selectable
  )
  Entities.HeaderCollection = Backbone.Collection.extend(
    model: Entities.Header
    initialize: ->
      singleSelect = new Backbone.Picky.SingleSelect(this)
      _.extend this, singleSelect
  )
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


