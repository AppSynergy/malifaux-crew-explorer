<template>
  <div class="models-vue">

    <select-factions
      :factions="factions"
      v-on:selectedFactions="selectFactions"
    ></select-factions>

    <div class="row">
      <div class="col col-xs-6">
        <select-leader
          :factions="selectedFactions"
          :masters="masters"
          :henchmen="henchmen"
          v-on:selectedLeader="selectLeader"
        ></select-leader>
      </div>
      <div class="col col-xs-6">
        <select-crew
          :leader="selectedLeader"
          :henchmen="henchmen[selectedLeaderFaction]"
          :enforcers="enforcers[selectedLeaderFaction]"
          :minions="minions[selectedLeaderFaction]"
          :peons="peons[selectedLeaderFaction]"
        ></select-crew>
      </div>
    </div>

  </div>
</template>

<script lang="coffee">
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

    computed:
      masters: () -> @filterandSortModels 'Master'
      henchmen: () -> @filterandSortModels 'Henchman'
      enforcers: () -> @filterandSortModels 'Enforcer'
      minions: () -> @filterandSortModels 'Minion'
      peons: () -> @filterandSortModels 'Peon'
      factions: () -> _.keys @masters

    methods:

      filterandSortModels: (attr) ->
        filteredModels = _.filter @models, (model) =>
          _.contains model.attributes, attr
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

  export default Models
</script>
