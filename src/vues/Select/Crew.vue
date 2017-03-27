<template>
  <div class="select-crew-vue">

    <div id="SelectCrewPanel" style="display:none">
      <li v-for="model in crew">
        {{ model.name }} {{ model.factions }} {{ model.cost }}
      </li>
    </div>

  </div>
</template>

<script lang="coffee">

  SelectCrew =

    props: [ 'crew' ]

  export default SelectCrew

</script>
