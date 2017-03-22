<template>
  <div class="select-leader-vue">

    <div id="SelectLeaderPanel" style="display:none">
      LEADERS
        <button class="btn" v-on:click="clickMe">Go away</button>
    </div>

  </div>
</template>

<script lang="coffee">

  SelectLeader =

    methods:
      clickMe: () ->
        @$emit 'selectedLeader', { name: "Bob" }

  export default SelectLeader

</script>
