<template>
  <div class="select-factions-vue mt-4">
    
    <h2>Select your faction(s)</h2>
    
    <button class="btn mr-2 mt-2"
      v-for="faction in factions"
      v-on:click="toggleFaction(faction)"
      v-bind:class="{ selected: isSelected(faction) }"
    >{{ faction }}</button>
    
  </div>
</template>

<script lang="coffee">

  SelectFactions =
    
    props: [ 'factions' ]
    
    data: () ->
      selectedFactions: []
      
    methods:
      
      toggleFaction: (faction) ->
        if @isSelected faction
          @selectedFactions = _.without @selectedFactions, faction 
        else
          @selectedFactions.push faction
        @$emit 'selectedFactions', @selectedFactions

      isSelected: (faction) ->
        _.contains @selectedFactions, faction
        
  export default SelectFactions  
</script>

<style lang="sass">
  button
    &.selected
      background-color: #dee
</style>