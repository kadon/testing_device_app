ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  Entities.Device = Backbone.Model.extend(
    #urlRoot: "devices"
    url: "/device"
    defaults:
      id:            ""
      description:   ""
      color:         ""
      id_inventario: ""
      no_serie:      ""
      so:            ""
      type_device:   ""
      udid:          ""
      version:       ""

    validate: (attrs, options) ->
      errors = {}
      errors.brand = "can't be blank"  unless attrs.brand
      errors.so = "can't be blank"  unless attrs.so
      errors.model = "can't be blank"  unless attrs.model
      errors.serie = "can't be blank"  unless attrs.serie
  )

  #Entities.configureStorage Entities.Device
  Entities.DeviceCollection = Backbone.Collection.extend(
    #url: "devices"
    url: "/devices"
    model: Entities.Device
    comparator: "brand"
  )
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
