<template>
  <div class="models-vue mt-4">

    <select-faction
      :factions="factions"
      v-on:selectedFaction="updateFaction"
    ></select-faction>

    <select-encounter-size></select-encounter-size>

    <select-leader></select-leader>

    <select-crew></select-crew>

  </div>
</template>

<script lang="coffee">
  import AllModels from '../data/Models.coffee'
  import AllFactions from '../data/Factions.coffee'
  import SelectFaction from './Select/Faction.vue'
  import SelectEncounterSize from './Select/EncounterSize.vue'
  import SelectLeader from './Select/Leader.vue'
  import SelectCrew from './Select/Crew.vue'

  Models =

    components:
      { SelectFaction, SelectEncounterSize, SelectLeader, SelectCrew }

    data: () ->
      faction: null

    computed:
      factions: () -> AllFactions

    methods:
      updateFaction: (faction) ->
        @faction = faction



  export default Models
</script>
