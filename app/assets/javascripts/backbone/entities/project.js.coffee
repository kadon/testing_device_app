ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  API =
    getProjectEntities: ->
      projects = new Entities.ProjectCollection()
      defer = $.Deferred()
      projects.fetch success: (data) ->
        defer.resolve data

      promise = defer.promise()

      promise

  ManagerDevicesApp.reqres.setHandler "project:entities", ->
    API.getProjectEntities()
