<template>
  <div class="select-leader-vue">

    <div id="SelectLeaderPanel" style="display:none">

      <div v-if="encounterSize && faction">
        <div class="btn" v-for="leader in availableLeaders">
          {{ leader.name }}
        </div>
      </div>

      <div class="text-center">
        <button class="btn btn-success my-4"
          v-on:click="clickDone">Ok</button>
      </div>

    </div>

  </div>
</template>

<script lang="coffee">

  import Encounters from '../../data/Encounters.coffee'

  SelectLeader =

    props: ['encounterSize', 'faction', 'models']

    computed:

      availableLeaders: () ->
        _.filter @models, (model) =>
          _.all [
            _.contains model.factions, @faction.key
            _.intersection(model.attributes, @encounterSize.leaders).length > 0
          ]

    methods:

      clickDone: () ->
        @$emit 'selectedLeader', { name: "Bob" }

  export default SelectLeader

</script>
