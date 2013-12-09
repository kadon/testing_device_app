ManagerDevicesApp.module "DevicesApp.List", (List, ManagerDevicesApp, Backbone, Marionette, $, _) ->

  class List.UseModal extends Marionette.ItemView
    template: "devices/use_modal"
    className: "modal hide fade"
    
    initialize: (options)->
      @project_collection = options.project_collection

    events:
      "click button.js-close":        'closeModal'
      "click a.js-close":             'closeModal'
      "click #js-mark-as-unavailable": 'markAsUnavailable'
      hidden:                         'destroyView'

    ui:
      selectProjects: "#projects"

    onRender: ->
      @project_collection.each @addProjectOption, @

    addProjectOption: (project)->
      id = project.get('id') || ''
      name = project.get('name') || ''
      @ui.selectProjects.append("<option value=" + id + ">" + name + "</option>")

    markAsUnavailable: ->
      @model.set 'project_id', @ui.selectProjects.find(":selected").attr('value')
      @model.markAsUnavailable()
      @closeModal()

    showModal: ->
      @$el.modal('show')

    closeModal: ->
      @$el.modal('hide')

    destroyView: ->
      @remove()
