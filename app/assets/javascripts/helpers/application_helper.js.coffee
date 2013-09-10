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

