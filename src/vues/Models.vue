<template>
  <div class="models-vue mt-4">

    <panel-select
      :title="'Select an Encounter Size'"
      :value="encounterSize"
      v-on:openPanel="openPanel('SelectEncounterSizePanel')"
    ></panel-select>

    <select-encounter-size
      v-on:selectedEncounterSize="updateEncounterSize"
      v-on:selectedEncounterSizeDone="updateEncounterSizeDone"
    ></select-encounter-size>

    <panel-select
      :title="'Select a Faction'"
      :value="faction"
      v-on:openPanel="openPanel('SelectFactionPanel')"
    ></panel-select>

    <select-faction
      :factions="factions"
      v-on:selectedFaction="updateFaction"
    ></select-faction>

    <panel-select
      :title="'Select a Leader'"
      :value="leader"
      v-on:openPanel="openPanel('SelectLeaderPanel')"
    ></panel-select>

    <select-leader
      :leaders="availableLeaders"
      v-on:selectedLeader="updateLeader"
    ></select-leader>

    <panel-select
      :title="'Select a Crew'"
      :value="crew"
      v-on:openPanel="openPanel('SelectCrewPanel')"
    ></panel-select>

    <select-crew
      v-on:selectedCrew="updateCrew"
    ></select-crew>

  </div>
</template>

<script lang="coffee">

  import AllModels from '../data/Models.coffee'
  import AllFactions from '../data/Factions.coffee'
  import Animation from './Mixin/Animation.coffee'
  import ModelLogic from './Mixin/ModelLogic.coffee'
  import PanelSelect from './Panel/Select.vue'
  import SelectFaction from './Select/Faction.vue'
  import SelectEncounterSize from './Select/EncounterSize.vue'
  import SelectLeader from './Select/Leader.vue'
  import SelectCrew from './Select/Crew.vue'

  Models =

    mixins: [Animation, ModelLogic]

    components:
      { PanelSelect, SelectFaction, SelectEncounterSize, SelectLeader, SelectCrew }

    data: () ->
      faction: null
      encounterSize: null
      leader: null
      crew: null
      panels:
        encounterSize: 'SelectEncounterSizePanel'
        faction: 'SelectFactionPanel'
        leader: 'SelectLeaderPanel'
        crew: 'SelectCrewPanel'

    computed:
      factions: () -> AllFactions
      models: () -> AllModels

    methods:

      openPanel: (panelId) ->
        @closeAllPanelsExcept panelId
        @slideDown panelId

      closeAllPanelsExcept: (panelId) ->
        Object.values(@panels).map (x) =>
          if x != panelId then @slideUp x

      updateEncounterSize: (size) ->
        @encounterSize = size

      updateEncounterSizeDone: (size) ->
        @encounterSize = size
        @slideUp @panels.encounterSize
        @slideDown @panels.faction

      updateFaction: (faction) ->
        @faction = faction
        @slideUp @panels.faction
        @slideDown @panels.leader

      updateLeader: (leader) ->
        @leader = leader
        @slideUp @panels.leader
        @slideDown @panels.crew

      updateCrew: (crew) ->
        @crew = crew


  export default Models
</script>
