<template>
  <div class="select-crew-vue mt-4" v-if="hasLeader">

    <h2>Select Crew</h2>

    <ul class="list-group mt-4">
      <li class="list-group-item">
        <strong>Leader: </strong>
        <span class="pl-2">{{ leader.name }}</span>
      </li>
      <li class="list-group-item">
        <strong>Faction: </strong>
        <span class="pl-2">{{ leader.faction }}</span>
      </li>
    </ul>

    <sortable-table
      :headers="tableHeaders"
      :data="tableData"
    ></sortable-table>

  </div>
</template>

<script lang="coffee">
  import SortableTable from '../Element/SortableTable.vue'

  SelectCrew =

    components: { SortableTable }

    props: [ 'leader', 'minions', 'enforcers', 'henchmen', 'peons' ]

    data: () ->
      tableHeaders: ['Models', 'Station', 'Cost', 'Keywords']
      stations: ["Henchman", "Enforcer", "Minion", "Peon"]

    computed:
      hasLeader: () -> @leader != null
      crew: () ->
        _.flatten [
          @addStation @henchmen, "Henchman"
          @addStation @enforcers, "Enforcer"
          @addStation @minions, "Minion"
          @addStation @peons, "Peon"
        ]
      tableData: () ->
        _.map @crew, (model) =>
          attrs = @listAttributes model.attributes, ', '
          [ model.faction+":"+model.name,
            model.name, model.station, model.cost, attrs ]

    methods:

      addStation: (models, station) ->
        _.map models, (x) ->
          _.extend x, {station: station}

      listAttributes: (atts, interp) ->
        _.reject atts, (x) =>
          x.substring(0,4) == "Wave" || _.contains @stations, x
        .join interp

  export default SelectCrew
</script>
