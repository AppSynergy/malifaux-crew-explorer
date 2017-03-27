import Animation from '../Mixin/Animation.coffee'

PanelController =

  mixins: [ Animation ]

  data: () ->
    panels:
      encounterSize:
        id: 'SelectEncounterSizePanel'
        open: true
      faction:
        id: 'SelectFactionPanel'
        open: false
      leader:
        id: 'SelectLeaderPanel'
        open: false
      crew:
        id: 'SelectCrewPanel'
        open: false

  methods:

    find: (panelId) ->
      _.find @panels, (panel) -> panelId == panel.id

    openPanel: (panelId) ->
      panel = @find panelId
      @closeAllPanelsExcept panelId
      unless panel.open
        @slideDown panelId
        panel.open = true

    closePanel: (panelId) ->
      panel = @find panelId
      @slideUp panelId
      panel.open = false

    closeAllPanelsExcept: (panelId) ->
      _.filter @panels, (panel) -> panelId != panel.id
      .map (panel) => @closePanel panel.id

export default PanelController
