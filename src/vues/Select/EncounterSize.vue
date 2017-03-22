<template>
  <div class="select-encounter-size-vue">

    <div id="SelectEncounterSizePanel" style="display:none">
      <button class="btn" v-on:click="clickMe">Go away</button>
    </div>

  </div>
</template>

<script lang="coffee">

  SelectEncounterSize =

    data: () ->
      selectedEncounterSize: null

    methods:
      clickMe: () ->
        @$emit 'selectedEncounterSize', { name: "Foo" }

  export default SelectEncounterSize

</script>
