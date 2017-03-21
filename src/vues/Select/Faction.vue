<template>
  <div class="select-faction-vue row">
    <div :class="'card-block '+ key" v-for="faction, key in factions">
      <div class="card-block">
        <h4 class="card-title">{{ faction.name }}</h4>
        <img :src="'/static/'+faction.img">
      </div>
    </div>
  </div>
</template>

<script lang="coffee">

  SelectFaction =

    props:
      ['factions']

  export default SelectFaction
</script>

<style lang="sass">
  .card
    text-align: center

  @import '../../data/Colors.sass'
  @each $faction, $color in $colors
    .#{$faction}
      $tmpCol: lighten(desaturate($color, 23), 15)
      border-bottom: 3px solid $tmpCol !important
</style>
