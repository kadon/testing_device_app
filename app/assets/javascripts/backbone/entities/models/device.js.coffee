ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class Entities.Device extends Backbone.Model
    urlRoot: "devices"
    #url: "/device"
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
      errors.so = "can't be blank"  unless attrs.so

    markAsAvailable: () ->
      return mark_status @, @urlRoot + '/' + @id + '/mark_as_available'

    markAsUnavailable: () ->
      return mark_status @, @urlRoot + '/' + @id + '/mark_as_unavailable'

    markAsFailing: () ->
      return mark_status @, @urlRoot + '/' + @id + '/mark_as_failing'
  
    getStatusLabelClass: ->
      status = @get('status')
      status = "" unless status
      switch status
        when "available" then "label-success"
        when "unavailable" then "label-important"
        when "failing" then ""
        else ""
  
# Private     
mark_status = (model, url) ->
  options = _.defaults((options || {}), { url: url })
  return Backbone.Model.prototype.save.call(model, {id: model.id}, options)


  
