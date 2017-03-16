<template>
  <div class="select-factions-vue mt-4">

    <h2>Select your faction(s)</h2>

    <button v-for="faction in factions"
      :class="['btn mr-2 mt-2', faction, isSelected(faction)?'selected':null]"
      v-on:click="toggleFaction(faction)"
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

  $colors: (Guild: #c73130, Resurrectionist: #008d47, Neverborn: #7f4996, Arcanist: #374ea2, Outcast: #bda93e, TenThunders: #d6742a, Gremlin: #8b692b)

  =malifauxFactions
    @each $faction, $color in $colors
      &.#{$faction}
        background-color: $color

  .select-factions-vue
    button
      +malifauxFactions
      &:focus
        box-shadow: none
      &.selected
        color: white
</style>
