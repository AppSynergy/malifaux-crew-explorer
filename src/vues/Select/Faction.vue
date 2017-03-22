<template>
  <div class="select-faction-vue">

    <div id="SelectFactionPanel" style="display:none">
      <div class="row mt-4">
        <div v-for="faction, key in factions"
          v-on:click="selectThisFaction(faction)"
          class="col col-6 col-lg-3 mb-4">
          <div :class="key + ' faction card'">
            <div class="card-block text-center">
              <h4 class="card-title pb-1">{{ faction.name }}</h4>
              <img :src="'/static/'+faction.img" width="72">
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
</template>

<script lang="coffee">

  SelectFaction =

    props: ['factions']

    data: () ->
      selectedFaction: null

    methods:
      selectThisFaction: (faction) ->
        @$emit 'selectedFaction', faction

  export default SelectFaction

</script>

<style lang="sass">

  .card.faction
    cursor: pointer
    transition: 600ms all
    &:hover
      background-color: #f2f2f4

  @import '../../data/Colors.sass'
  @each $faction, $color in $colors
    $lightColor: lighten(desaturate($color, 23), 45)
    .card.faction.#{$faction}
      h4
        border-bottom: 5px solid $color !important

</style>
