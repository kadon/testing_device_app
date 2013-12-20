ManagerDevicesApp.module "DevicesApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  List.Controller = listDevices: (criterion, mode) ->
    loadingView = new ManagerDevicesApp.Common.Views.Loading()
    ManagerDevicesApp.mainRegion.show loadingView
    fetchingDevices = ManagerDevicesApp.request("device:entities")
    devicesListLayout = new List.Layout()
    devicesListPanel = new List.Panel()
    $.when(fetchingDevices).done (devices) ->
      filteredDevices = ManagerDevicesApp.Entities.FilteredCollection(
        collection: devices
        filterFunction: (filterCriterion) ->
          criterion = filterCriterion.toLowerCase()
          (device) ->
            device  if device.get("description").toLowerCase().indexOf(criterion) isnt -1 or device.get("so").toLowerCase().indexOf(criterion) isnt -1 or device.get("udid").toLowerCase().indexOf(criterion) isnt -1
      )
      if criterion
        filteredDevices.filter criterion
        devicesListPanel.once "show", ->
          devicesListPanel.triggerMethod "set:filter:criterion", criterion

      if mode and mode is 'simple'
        devicesListView = new List.SimpleContacts(collection: filteredDevices)
      else
        devicesListView = new List.Contacts(collection: filteredDevices)

      devicesListPanel.on "contacts:filter", (filterCriterion) ->
        filteredDevices.filter filterCriterion
        ManagerDevicesApp.trigger "contacts:filter", filterCriterion

      devicesListLayout.on "show", ->
        devicesListLayout.panelRegion.show devicesListPanel
        devicesListLayout.contactsRegion.show devicesListView


      devicesListView.on "itemview:device:mark_as_using", (childView)->
        #childView.model.markAsUnavailable()
        fetchingProjects = ManagerDevicesApp.request("project:entities")
        $.when(fetchingProjects).done (projects) ->
          view = new ManagerDevicesApp.DevicesApp.List.UseModal( model: childView.model, project_collection: projects )
          view.on "show", () ->
            view.showModal()
          ManagerDevicesApp.dialogRegion.show view
        console.log('since device list controller lets mark as use')


      devicesListView.on "itemview:device:mark_as_available", (childView)->
        childView.model.markAsAvailable()

      #devicesListPanel.on "device:new", ->
      #  newContact = new ManagerDevicesApp.Entities.Contact()
      #  view = new ManagerDevicesApp.ContactsApp.New.Contact(model: newContact)
      #  view.on "form:submit", (data) ->
      #    highestId = contacts.max((c) ->
      #      c.id
      #    ).get("id")
      #    data.id = highestId + 1
      #    if newContact.save(data)
      #      contacts.add newContact
      #      view.trigger "dialog:close"
      #      newContactView = devicesListView.children.findByModel(newContact)
      #      
      #      # check whether the new contact view is displayed (it could be
      #      # invisible due to the current filter criterion)
      #      newContactView.flash "success"  if newContactView
      #    else
      #      view.triggerMethod "form:data:invalid", newContact.validationError

      #  ManagerDevicesApp.dialogRegion.show view

      #devicesListView.on "itemview:device:show", (childView, model) ->
      #  ManagerDevicesApp.trigger "device:show", model.get("id")

      #devicesListView.on "itemview:contact:edit", (childView, model) ->
      #  view = new ManagerDevicesApp.ContactsApp.Edit.Contact(model: model)
      #  view.on "form:submit", (data) ->
      #    if model.save(data)
      #      childView.render()
      #      view.trigger "dialog:close"
      #      childView.flash "success"
      #    else
      #      view.triggerMethod "form:data:invalid", model.validationError

      #  ManagerDevicesApp.dialogRegion.show view

      #devicesListView.on "itemview:device:delete", (childView, model) ->
      #  model.destroy()

      ManagerDevicesApp.mainRegion.show devicesListLayout


