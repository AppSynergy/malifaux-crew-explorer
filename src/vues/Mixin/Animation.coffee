import Velocity from 'velocity-animate'

Animation =
  methods:

    slideUp: (elementId) ->
      element = document.getElementById elementId
      opts =
        duration: 600
      Velocity element, 'slideUp', opts

    slideDown: (elementId) ->
      element = document.getElementById elementId
      opts =
        duration: 600
      Velocity element, 'slideDown', opts


export default Animation
