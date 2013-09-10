ManagerDevicesApp.module "DevicesApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class List.Contacts extends Marionette.CompositeView
    tagName: "div"
    className: "s"
    template: "devices/list"
    emptyView: NoContactsView
    itemView: List.Contact
    itemViewContainer: "ul"
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

