@ManagerDevicesApp.module "Common.Views", (Views, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class Views.Loading extends Marionette.ItemView
    template: "common/loading_templayte"

    serializeData: ->
      title: @options.title or "Loading Data"
      message: @options.message or "Please wait, data is loading..."

    onShow: ->
      opts =
        lines: 13 # The number of lines to draw
        length: 10 # The length of each line
        width: 2 # The line thickness
        radius: 10 # The radius of the inner circle
        corners: 1 # Corner roundness (0..1)
        rotate: 0 # The rotation offset
        direction: 1 # 1: clockwise, -1: counterclockwise
        color: "gray" # #rgb or #rrggbb
        speed: 1 # Rounds per second
        trail: 60 # Afterglow percentage
        shadow: false # Whether to render a shadow
        hwaccel: false # Whether to use hardware acceleration
        className: "spinner" # The CSS class to assign to the spinner
        zIndex: 2e9 # The z-index (defaults to 2000000000)
        top: "30px" # Top position relative to parent in px
        left: "auto" # Left position relative to parent in px

      $("#spinner").spin opts

  class Views.Alert extends Marionette.ItemView
    template: "common/alert_template"
    className: "alert"

    events:
      "click a.close": @remove

    onRender: ->
      type_message = @model.get("type_message")
      @$el.addClass("alert-" + type_message ) if type_message

