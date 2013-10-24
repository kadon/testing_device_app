ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class Entities.Header extends Backbone.Model
    initialize: () ->
      selectable = new Backbone.Picky.Selectable(this)
      _.extend this, selectable
 
 
