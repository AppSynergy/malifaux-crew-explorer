import Velocity from 'velocity-animate'

Animation =

  data: () ->
    animation:
      opts:
        duration: 600

  methods:

    slideUp: (elementId) ->
      if element = document.getElementById elementId
        @animate element, 'slideUp'

    slideDown: (elementId) ->
      if element = document.getElementById elementId
        @animate element, 'slideDown'

    animate: (element, method) ->
      Velocity element, method, @animation.opts
      #.then (b) -> console.log "DONE", b
      #.catch (err) -> console.log "ERR", err

export default Animation
