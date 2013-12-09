ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class Entities.Project extends Backbone.Model
    urlRoot: "projects"
    defaults:
      name:     ""
      customer: ""
      key:      ""

