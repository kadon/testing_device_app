ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  #Entities.configureStorage Entities.DeviceCollection
  initializeDevices = ->
    device = new Entities.DeviceCollection()
    device.fetch()
    #devices.forEach (device) ->
    #  device.save()

    #device.models

  API =
    getDeviceEntities: ->
      devices = new Entities.DeviceCollection()
      defer = $.Deferred()
      devices.fetch success: (data) ->
        defer.resolve data

      promise = defer.promise()
      #$.when(promise).done (devices) ->
      #  if devices.length is 0
          
      #    # if we don't have any contacts yet, create some for convenience
      #    models = initializeDevices()
      #    devices.reset models

      promise

    getDeviceEntity: (deviceId) ->
      device = new Entities.Device(id: deviceId)
      defer = $.Deferred()
      setTimeout (->
        contact.fetch
          success: (data) ->
            defer.resolve data

          error: (data) ->
            defer.resolve `undefined`

      ), 2000
      defer.promise()

  ManagerDevicesApp.reqres.setHandler "device:entities", ->
    API.getDeviceEntities()

  ManagerDevicesApp.reqres.setHandler "device:entity", (id) ->
    API.getDeviceEntity id
