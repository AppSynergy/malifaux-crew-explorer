<template>
  <div class="select-crew-vue">
    <div id="SelectCrewPanel">

      <div class="card my-2">
        <div class="card-header border-bottom-0 form-inline">
          <label for="group-crew-by" class="mr-2">Group by:</label>
          <div v-for="option in group.options">
            <button name="group-crew-by"
              v-bind:class="groupButtonClass()"
              v-on:click="clickGroupOption(option)">
              {{ option }}
            </button>
          </div>
        </div>
      </div>

      <div class="card mb-2"
        v-if="group.choice"
        v-for="groupMembers, groupIndex in groupedCrew">
        <div class="card-header">
          <h4 class="mb-0">{{ group.choice }}: {{ groupIndex.replace(',', '/') }}</h4>
        </div>
        <div class="card-block">
          <smart-table :table-data="groupMembers"></smart-table>
        </div>
      </div>

    </div>
  </div>
</template>

<script lang="coffee">
  import SmartTable from '../Panel/SmartTable.vue'

  SelectCrew =

    components: { SmartTable }

    props: [ 'crew', 'panelOpen' ]

    data: () ->
      groupMembers: ['Foo']
      group:
        choice: 'Cost'
        options: [
          'Cost'
          'Faction'
          'Station'
        ]

    computed:
      groupedCrew: () ->
        getStation = @getStation
        f = switch @group.choice
          when 'Cost' then (x) -> x.cost
          when 'Faction' then (x) -> x.factions
          when 'Station' then (x) => getStation(x)
        _.groupBy @crew, f

    methods:

      groupButtonClass: (option) ->
        'btn mx-2': true
        active: option == @group.choice

      clickGroupOption: (option) ->
        @group.choice = option

      getStation: (model) ->
        stations = ['Henchman', 'Enforcer', 'Minion', 'Peon']
        _.first _.intersection(model.attributes, stations)

  export default SelectCrew

</script>

<style lang="sass">
  button.active
    outline: 2px solid red
</style>
