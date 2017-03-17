<template>
  <div class="models-vue">

    <div class="leader-ui-wrapper">

      <button class="btn mt-4"
        id="differentLeader"
        v-if="!show.selectLeader"
        v-on:click="showSelectLeader()"
      >Choose a different leader</button>

      <div id="selectLeader">

        <select-factions
          :factions="factions"
          v-on:selectedFactions="selectFactions"
        ></select-factions>

        <select-leader
          id="selectLeader"
          :factions="selectedFactions"
          :masters="masters"
          :henchmen="henchmen"
          v-on:selectedLeader="selectLeader"
        ></select-leader>

      </div>
    </div>

    <div class="crew-ui-wrapper">
      <select-crew
        :leader="selectedLeader"
        :henchmen="henchmen[selectedLeaderFaction]"
        :enforcers="enforcers[selectedLeaderFaction]"
        :minions="minions[selectedLeaderFaction]"
        :peons="peons[selectedLeaderFaction]"
      ></select-crew>
    </div>

  </div>
</template>

<script lang="coffee">

  import Velocity from 'velocity-animate'
  import ModelList from '../data/ModelList.coffee'
  import SelectFactions from './Select/Factions.vue'
  import SelectLeader from './Select/Leader.vue'
  import SelectCrew from './Select/Crew.vue'

  Models =

    components: { SelectFactions, SelectLeader, SelectCrew }

    data: () ->
      models: ModelList
      selectedFactions: []
      selectedLeader: null
      selectedLeaderFaction: null
      show:
        selectLeader: true

    computed:
      masters: () -> @filterandSortModels 'Master'
      henchmen: () -> @filterandSortModels 'Henchman'
      enforcers: () -> @filterandSortModels 'Enforcer'
      minions: () -> @filterandSortModels 'Minion'
      peons: () -> @filterandSortModels 'Peon'
      factions: () -> _.keys @masters

    methods:

      showSelectLeader: () ->
        unless @show.selectLeader
          @animateLeader 'show'

      filterandSortModels: (attr) ->
        f = (model) -> _.contains model.attributes, attr
        filteredModels = _.filter @models, f
        out = {}
        _.each filteredModels, (m) ->
          _.each m.factions, (f) ->
            out[f] = out[f] || []
            n = _.extend _.omit(m, 'factions'), { faction: f }
            out[f].push n
        out

      selectFactions: (factions) ->
        @selectedFactions = factions

      selectLeader: (leader) ->
        @selectedLeader = leader
        @selectedLeaderFaction = leader.faction
        @animateLeader 'hide'

      animateLeader: (direction) ->
        ele = document.getElementById 'selectLeader'
        opts = duration: 700
        switch direction
          when 'show'
            @show.selectLeader = true
            Velocity ele, 'slideDown', opts
          when 'hide'
            opts =
              duration: 500
              begin: () ->
                Velocity document.body, "scroll", {offset: "0", mobileHA: false}
            Velocity ele, 'slideUp', opts
            @show.selectLeader = false


  export default Models

</script>

<style lang="sass">
  #selectLeader
    overflow: hidden
</style>
