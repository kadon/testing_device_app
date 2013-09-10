do (ManagerDevicesApp) ->
  ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
    findStorageKey = (entity) ->
    
      # use a model's urlRoot value
      return _.result(entity, "urlRoot")  if entity.urlRoot
    
      # use a collection's url value
      return _.result(entity, "url")  if entity.url
    
      # fallback to obtaining a model's storage key from
      # the collection it belongs to
      return _.result(entity.collection, "url")  if entity.collection and entity.collection.url
      throw new Error("Unable to determine storage key")

    StorageMixin = (entityPrototype) ->
      storageKey = findStorageKey(entityPrototype)
      localStorage: new Backbone.LocalStorage(storageKey)

    Entities.configureStorage = (entity) ->
      _.extend entity::, new StorageMixin(entity::)
