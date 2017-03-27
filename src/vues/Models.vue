<template>
  <div class="models-vue mt-4">

    <panel-select
      :title="'Select an Encounter Size'"
      :value="encounterSize"
      v-on:openPanel="openPanel('SelectEncounterSizePanel')"
    ></panel-select>

    <select-encounter-size
      :panel-open="panels.encounterSize.open"
      v-on:selectedEncounterSize="updateEncounterSize"
      v-on:selectedEncounterSizeDone="updateEncounterSizeDone"
    ></select-encounter-size>

    <panel-select
      :title="'Select a Faction'"
      :value="faction"
      v-on:openPanel="openPanel('SelectFactionPanel')"
    ></panel-select>

    <select-faction
      :panel-open="panels.faction.open"
      :factions="factions"
      v-on:selectedFaction="updateFaction"
    ></select-faction>

    <panel-select
      :title="'Select a Leader'"
      :value="leader"
      v-on:openPanel="openPanel('SelectLeaderPanel')"
    ></panel-select>

    <select-leader
      v-if="faction"
      :panel-open="panels.leader.open"
      :leaders="availableLeaders"
      v-on:selectedLeader="updateLeader"
    ></select-leader>

    <panel-select
      :title="'Select a Crew'"
      :value="crew"
      v-on:openPanel="openPanel('SelectCrewPanel')"
    ></panel-select>

    <select-crew
      v-if="leader && faction"
      :panel-open="panels.crew.open"
      :crew="availableCrew"
      v-on:selectedCrew="updateCrew"
    ></select-crew>

  </div>
</template>

<script lang="coffee">

  import AllModels from '../data/Models.coffee'
  import AllFactions from '../data/Factions.coffee'

  import ModelLogic from './Mixin/ModelLogic.coffee'
  import PanelSelect from './Panel/Select.vue'
  import PanelController from './Panel/Controller.coffee'
  import SelectFaction from './Select/Faction.vue'
  import SelectEncounterSize from './Select/EncounterSize.vue'
  import SelectLeader from './Select/Leader.vue'
  import SelectCrew from './Select/Crew.vue'

  Models =

    mixins: [ModelLogic, PanelController]

    components:
      { PanelSelect, SelectFaction, SelectEncounterSize, SelectLeader, SelectCrew }

    data: () ->
      faction: null
      encounterSize: null
      leader: null
      crew: null

    computed:
      factions: () -> AllFactions
      models: () -> AllModels

    methods:

      updateEncounterSize: (size) ->
        @encounterSize = size

      updateEncounterSizeDone: (size) ->
        @encounterSize = size
        @closePanel @panels.encounterSize.id
        @openPanel @panels.faction.id

      updateFaction: (faction) ->
        @faction = faction
        @closePanel @panels.faction.id
        @openPanel @panels.leader.id
        if @leader && not @hasFaction(@leader) then @leader = null

      updateLeader: (leader) ->
        @leader = leader
        @closePanel @panels.leader.id
        @openPanel @panels.crew.id

      updateCrew: (crew) ->
        @crew = crew


  export default Models
</script>
