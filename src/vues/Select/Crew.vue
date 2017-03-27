<template>
  <div class="select-crew-vue">
    <div id="SelectCrewPanel">

      <div class="card my-2">
        <div class="card-header border-bottom-0 form-inline">
          <label for="group-crew-by" class="mr-2">Group by:</label>
          <select class="form-control" name="group-crew-by"
            v-model="group.choice">
            <option v-for="option in group.options">{{ option }}</option>
          </select>
        </div>
      </div>

      <div class="card mb-2"
        v-if="group.choice"
        v-for="groupMembers, groupIndex in groupedCrew">
        <div class="card-header">
          <h4 class="mb-0">{{ group.choice }}: {{ groupIndex.replace(',', '/') }}</h4>
        </div>
        <div class="card-block">
          <p v-for="model in groupMembers">
            {{ model.name }} {{ model.cost }} {{ model.attributes }} {{ model.factions }}
          </p>
        </div>
      </div>

    </div>
  </div>
</template>

<script lang="coffee">

  SelectCrew =

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
      getStation: (model) ->
        stations = ['Henchman', 'Enforcer', 'Minion', 'Peon']
        _.first _.intersection(model.attributes, stations)

  export default SelectCrew

</script>
