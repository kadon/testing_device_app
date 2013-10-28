ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class Entities.Device extends Backbone.Model
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
  
    getStatusLabelClass: ->
      status = @get('status')
      status = "" unless status
      switch status
        when "AVAILABLE" then "label-success"
        when "UNAVAILABLE" then "label-important"
        when "FAILING" then ""
        else ""
      

