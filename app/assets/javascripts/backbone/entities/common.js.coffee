ManagerDevicesApp.module "Entities", (Entities, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  Entities.FilteredCollection = (options) ->
    original = options.collection
    filtered = new original.constructor()
    filtered.add original.models
    filtered.filterFunction = options.filterFunction
    applyFilter = (filterCriterion, filterStrategy, collection) ->
      collection = collection or original
      criterion = undefined
      if filterStrategy is "filter"
        criterion = filterCriterion.trim()
      else
        criterion = filterCriterion
      items = []
      if criterion
        if filterStrategy is "filter"
          throw ("Attempted to use 'filter' function, but none was defined")  unless filtered.filterFunction
          filterFunction = filtered.filterFunction(criterion)
          items = collection.filter(filterFunction)
        else
          items = collection.where(criterion)
      else
        items = collection.models
      
      # store current criterion
      filtered._currentCriterion = criterion
      items

    filtered.filter = (filterCriterion) ->
      filtered._currentFilter = "filter"
      items = applyFilter(filterCriterion, "filter")
      
      # reset the filtered collection with the new items
      filtered.reset items

    filtered.where = (filterCriterion) ->
      filtered._currentFilter = "where"
      items = applyFilter(filterCriterion, "where")
      
      # reset the filtered collection with the new items
      filtered.reset items

    
    # when the original collection is reset,
    # the filtered collection will re-filter itself
    # and end up with the new filtered result set
    original.on "reset", ->
      items = applyFilter(filtered._currentCriterion, filtered._currentFilter)
      
      # reset the filtered collection with the new items
      filtered.reset items

    
    # if the original collection gets models added to it:
    # 1. create a new collection
    # 2. filter it
    # 3. add the filtered models (i.e. the models that were added *and*
    #     match the filtering criterion) to the `filtered` collection
    original.on "add", (models) ->
      coll = new original.constructor()
      coll.add models
      items = applyFilter(filtered._currentCriterion, filtered._currentFilter, coll)
      filtered.add items

    filtered

