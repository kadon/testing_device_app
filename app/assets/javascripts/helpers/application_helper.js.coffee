Handlebars.registerHelper "link_to", (url, name, options) ->
  translate = options.hash.translate || false
  id = options.hash.id || ""
  if translate
      name = Handlebars.helpers.t(name, options)
  new Handlebars.SafeString("<a href='" + url + "'>" + name + "</a>")


Handlebars.registerHelper "t", (scope, options) ->
  scope = scope or ""
  locale = options.hash.locale || {}
  I18n.t scope, locale

Handlebars.registerHelper "humanize", (property) ->
  humanize_property = ""
  if property
    humanize_property = property.toLocaleLowerCase().replace(/_/g, " ").replace /(\w+)/g, (match) -> match.charAt(0).toUpperCase() + match.slice(1)
  new Handlebars.SafeString(humanize_property)

Handlebars.registerHelper "can", (action, name_model, options) ->
  if ManagerDevicesApp.Authorization.can( action, name_model)
    return options.fn(this)
  else
    return options.inverse(this)
