@ManagerDevicesApp = new Marionette.Application()

@ManagerDevicesApp.addRegions
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
