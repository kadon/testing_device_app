@ManagerDevicesApp = new Marionette.Application()

@ManagerDevicesApp.addRegions
  alertsRegion: "#alerts-container"
  headerRegion: "#header-region"
  mainRegion: "#main-region"
  dialogRegion: Marionette.Region.Dialog.extend(el: "#dialog-region")

@ManagerDevicesApp.navigate = (route, options) ->
  options or (options = {})
  Backbone.history.navigate route, options

@ManagerDevicesApp.getCurrentRoute = ->
  Backbone.history.fragment

@ManagerDevicesApp.on "initialize:after", ->
  if Backbone.history
    Backbone.history.start()
    ManagerDevicesApp.trigger "devices:list"  if @getCurrentRoute() is ""

@ManagerDevicesApp.on "showAlert", (message, type_message) ->
  model = new Backbone.Model({ type_message: type_message, message: message })
  ManagerDevicesApp.alertsRegion.show new ManagerDevicesApp.Common.Views.Alert({model: model})
  
