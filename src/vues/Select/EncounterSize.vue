<template>
  <div class="select-encounter-size-vue">

    <div id="SelectEncounterSizePanel">

      <div class="my-4 text-center encounterSize">
        <label for="encounterSize">Hiring Pool:</label>
        <input name="encounterSize" class="form-control text-center"
          v-model="hiringSoulstones" type="number">
      </div>

      <div class="row">
        <div class="col col-4"
          v-for="encounterSize, key in encounters.sizes">
          <div :class="getClass(encounterSize)"
            v-on:click="selectNamedEncounterSize(encounterSize)">
            <div class="card-block">
              <h4>{{ encounterSize.name }}</h4>
              <p>{{ getLeaderText(encounterSize) }}</p>
            </div>
          </div>
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

  SelectEncounterSize =

    data: () ->
      hiringSoulstones: 50

    computed:

      encounters: () -> Encounters

      selectedEncounterSize: () ->
        _.find @encounters.sizes, (x) =>
          min = x.soulstones.min <= @hiringSoulstones
          max = x.soulstones.max >= @hiringSoulstones
          min && max

    methods:

      getClass: (encounterSize) ->
        card: true
        selected: @selectedEncounterSize == encounterSize

      getLeaderText: (encounterSize) ->
        leader = encounterSize.leader.join ' or a '
        if encounterSize.leader.length == 2
          'Your crew may be led be either a ' + leader + '.'
        else
          'Your crew must be led by a ' + leader + '.'


      selectNamedEncounterSize: (encounterSize) ->
        @hiringSoulstones = encounterSize.soulstones.typical

      clickDone: () ->
        obj = { name: "SS: " + @hiringSoulstones }
        @$emit 'selectedEncounterSize', obj

  export default SelectEncounterSize

</script>


<style lang="sass">

  div.encounterSize
    & input
      margin: 0 auto
      width: 8em
    & label
      width: 16em

  div.card
    background-color: white
    &.selected
      background-color: #f2f2f4

</style>
