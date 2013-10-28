ManagerDevicesApp.module "Authorization", (Authorization, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  ability = []
  
  Authorization.can = (action, class_model) ->
    !_.isEmpty(filterAbility(ability, true, action, class_model))

  Authorization.cannot = (action, class_model) ->
    !_.isEmpty(filterAbility(ability, false, action, class_model))
 
  Authorization.getAbility = ()-> #This gonna be removed
    ability

  Authorization.on "start", (options) ->
    @current_user = new Backbone.Model(options.current_user_object) #Set current user
    ability = JSON.parse(options.ability) #Set ability of cancan
  
  filterAbility = (list, can, action, subject) ->
    _.filter(list, (item)->
      return item.can is can and (_.contains(item.actions, action) and _.contains(item.subjects, subject) or _.contains(item.actions, "manage") and _.contains(item.subjects, subject) or _.contains(item.actions, "manage") and _.contains(item.subjects, "all"))
    )
