ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class Entities.ProjectCollection extends Backbone.Collection
    url: "/projects"
    model: Entities.Project
