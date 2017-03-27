
ModelLogic =

  data: () ->
    bannedLeaders: [
      'Lord Chompy Bits'
      'Dismounted McCabe'
    ]

  computed:

    availableLeaders: () ->
      if @faction != null && @encounterSize != null
        _.filter @models, (model) =>
          _.all [
            @hasFaction model
            not _.contains @bannedLeaders, model.name
            _.intersection(model.attributes, @encounterSize.leaders).length > 0
          ]
        .map (x) => @filterLeaderAttributes x
      else []

    availableCrew: () ->
      if @faction != null && @leader != null
        _.filter @models, (model) =>
          _.all [
            @hasFaction(model) || @hasAttribute(model, 'Mercenary')
            not @hasAttribute model, 'Master'
          ]

      else []

  methods:

    hasFaction: (model, faction = false) ->
      key = if faction then faction.key else @faction.key
      _.contains model.factions, key

    hasAttribute: (model, attribute) ->
      _.contains model.attributes, attribute

    filterLeaderAttributes: (model) ->
      atts = model.attributes
      reject = (x) -> x.substring(0,4).match /[WR]a[rv]e/
      replace = (x) -> x.replace(/([A-Z])/g, ' $1').trim()
      model.attributes = _.reject(model.attributes, reject).map(replace)
      return model

export default ModelLogic
