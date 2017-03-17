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
      tableHeaders: ['Models', 'Station', 'Cost', 'Rarity', 'Keywords']
      stations: ["Henchman", "Enforcer", "Minion", "Peon"]

    computed:

      hasLeader: () -> @leader != null

      crew: () ->
        _.flatten [
          @addCrew @henchmen, "Henchman"
          @addCrew @enforcers, "Enforcer"
          @addCrew @minions, "Minion"
          @addCrew @peons, "Peon"
        ]

      tableData: () ->
        _.map @crew, (model) =>
          attrs = @listAttributes model.attributes, ', '
          [ model.faction+":"+model.name,
            model.name, model.station, model.cost,
            @getRarity(model), attrs ]

    methods:

      addCrew: (models, station) ->
        # Remove other master's totems
        f = (x) => _.any(_.map x.attributes, (a) => _.all [
          a.substring(0,9) == "Totem For",
          a.substring(10) != @leader.name
        ])
        # Add station
        g = (x) -> _.extend x, {station: station}
        _.reject(models, f).map g

      listAttributes: (atts, interp) ->
        f = (x) => _.any [
          _.contains @stations, x
          x.substring(0,4).match /[WR]a[rv]e/
        ]
        g = (x) -> x.replace /([A-Z])/g, ' $1'
        _.reject(atts, f).map(g).join interp

      getRarity: (model) ->
        a = _.find model.attributes, (x) -> x.substring(0,4) == "Rare"
        if a
          a.substring(4,5)
        else '∞'

  export default SelectCrew
</script>
