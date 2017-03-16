<template>
  <div class="select-leader-vue mt-4">
    
    <h2>Select your leader</h2>
    
    <form class="form-inline my-4">
      <label class="mr-4" for="soulstones">Soulstones: </label>
      <input type="text" class="form-control" v-model="soulstones">
    </form>
      
    <li v-for="leader in leaders">
      {{ leader.name }} - cache: {{ leader.cache }}
    </li>
    
  </div>
</template>

<script lang="coffee">
  
  SelectLeader =
    
    props: [ 'masters', 'henchmen', 'factions' ]
    
    data: () ->
      soulstones: 35
    
    computed:
      leaders: () ->
        out = []
        if @soulstones > 25 then @filterByFaction @masters, out
        if @soulstones < 40 then @filterByFaction @henchmen, out
        _.flatten out
        
    methods:
      
        filterByFaction: (models, results) ->
          _.map models, (factiongroup, faction) =>
            if _.contains @factions, faction
              results.push factiongroup
            else
              results
        
  export default SelectLeader
</script>