<template>
  <div class="models-vue">

    <select-faction
      :factions="factions"
    ></select-faction>

  </div>
</template>

<script lang="coffee">
  import AllModels from '../data/Models.coffee'
  import AllFactions from '../data/Factions.coffee'
  import SelectFaction from './Select/Faction.vue'

  Models =

    components:
      { SelectFaction }

    computed:
      factions: () -> AllFactions

    created: () ->
      #console.log AllModels.length + " Models, "
      #console.log AllFactions



  export default Models
</script>
