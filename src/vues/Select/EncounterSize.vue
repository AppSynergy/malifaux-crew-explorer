<template>
  <div class="select-encounter-size-vue">

    <div id="SelectEncounterSizePanel">

      <input v-model="hiringSoulstones" type="number">

      <div v-for="encounterSize, key in encounters.sizes">
        {{ encounterSize.name }}
      </div>

      <button class="btn" v-on:click="clickDone">Done</button>
    </div>

  </div>
</template>

<script lang="coffee">

  import Encounters from '../../data/Encounters.coffee'

  SelectEncounterSize =

    data: () ->
      hiringSoulstones: 50
      selectedEncounterSize: null

    computed:
      encounters: () -> Encounters

    methods:
      clickDone: () ->
        obj = { name: "SS: " + @hiringSoulstones }
        @$emit 'selectedEncounterSize', obj

  export default SelectEncounterSize

</script>
