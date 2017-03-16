<template>
  <div class="models-vue">
    
    <select-factions
      :factions="factions"
      v-on:selectedFactions="selectFactions"
    ></select-factions>
      
    <select-leader
      :factions="selectedFactions"
      :masters="masters"
      :henchmen="henchmen"
    ></select-leader>

  </div>
</template>

<script lang="coffee">
  import ModelList from '../data/ModelList.coffee'
  import SelectFactions from './Select/Factions.vue'
  import SelectLeader from './Select/Leader.vue'
  
  Models = 
    
    components: { SelectFactions, SelectLeader }
    
    data: () ->
      models: ModelList
      selectedFactions: []
        
    computed:
      masters: () -> @filterandSortModels 'Master'
      henchmen: () -> @filterandSortModels 'Henchman'
      factions: () -> _.keys @masters        
          
    methods:
      
      filterandSortModels: (attr) ->
        filteredModels = _.filter @models, (model) =>
          _.contains model.attributes, attr
        out = {}
        _.each filteredModels, (m) ->
          _.each m.factions, (f) ->
            out[f] = out[f] || []
            out[f].push m
        out
            
      selectFactions: (factions) ->
        @selectedFactions = factions
          
  export default Models
</script>