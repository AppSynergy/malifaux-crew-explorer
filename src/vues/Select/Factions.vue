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
      selectedFactions: @factions

    mounted: () ->
      @$emit 'selectedFactions', @selectedFactions

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

  @import '../Element/Colors.sass'

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
