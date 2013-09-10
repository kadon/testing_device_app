Marionette.Region.Dialog = Marionette.Region.extend(
  onShow: (view) ->
    @listenTo view, "dialog:close", @closeDialog
    self = this
    @$el.dialog
      modal: true
      title: view.title
      width: "auto"
      close: (e, ui) ->
        self.closeDialog()


  closeDialog: ->
    @stopListening()
    @close()
    @$el.dialog "destroy"
)
