
class Model
  constructor: (@name, @factions, @attributes, @cost, @cache) ->
  
handler = 
  get: (target, name) -> 
    if name is "TotemFor" then (x) -> "totem for " + x
    else name 

Interface =
  Model: Model
  Attribute: new Proxy {}, handler

export default Interface
  