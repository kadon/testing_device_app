ManagerDevicesApp.module "DevicesApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class List.SimpleContacts extends Marionette.CompositeView
    template: "devices/simple_list"
    emptyView: NoContactsView
    itemView: List.SimpleDevice
    itemViewContainer: "tbody"
    initialize: ->
      @listenTo @collection, "reset", ->
        @appendHtml = (collectionView, itemView, index) ->
          collectionView.$el.append itemView.el

    onCompositeCollectionRendered: ->
      @appendHtml = (collectionView, itemView, index) ->
        collectionView.$el.prepend itemView.el


  NoContactsView = Marionette.ItemView.extend(
    template: "common/list_none"
    tagName: "tr"
    className: "alert"
  )

