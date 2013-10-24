ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class Entities.HeaderCollection extends Backbone.Collection
    model: Entities.Header
    initialize: ->
      singleSelect = new Backbone.Picky.SingleSelect(this)
      _.extend this, singleSelect
