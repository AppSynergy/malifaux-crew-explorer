
class Model
  constructor: (@name, @factions, @attributes, @cost, @cache) ->

handler =
  get: (target, name) ->
    if name is "TotemFor" then (x) -> "Totem For " + x
    else name

Interface =
  Model: Model
  Attribute: new Proxy {}, handler

export default Interface
