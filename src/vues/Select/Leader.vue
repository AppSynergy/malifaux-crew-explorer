<template>
  <div class="select-leader-vue mt-4" v-if="hasLeaders">

    <h2>Select your leader</h2>

    <form class="form-inline my-4">
      <label class="mr-4" for="soulstones">Soulstones: </label>
      <input type="text" class="form-control" v-model="soulstones">
    </form>

    <sortable-table
      :headers="tableHeaders"
      :data="tableData"
      v-on:selectedRow="selectLeader"
    ></sortable-table>

  </div>
</template>

<script lang="coffee">
  import TableInterface from '../Element/TableInterface.coffee'
  import SortableTable from '../Element/SortableTable.vue'

  SelectLeader =

    components: { SortableTable }

    mixins: [ TableInterface ]

    props: [ 'masters', 'henchmen', 'factions' ]

    data: () ->
      soulstones: 50
      selectedLeader: null
      tableHeaders: ['Leader', 'Cache', 'Keywords']

    computed:

      hasLeaders: () -> @leaders.length > 0

      leaders: () ->
        out = []
        if @soulstones > 25 then @filterByFaction @masters, out
        if @soulstones < 40 then @filterByFaction @henchmen, out
        @forbiddenLeaders _.flatten(out)

      tableData: () ->
        _.map @leaders, (leader) =>
          [ @toIndex(leader), @classNames(leader)
          , @nameAndMaybeFaction(leader)
          , leader.cache
          , @listAttributes(leader.attributes, ', ')
          ]

    methods:

        forbiddenLeaders: (leaders) ->
          _.reject leaders, (x) ->
            _.contains ["Dismounted McCabe", "Lord Chompy Bits"], x.name

        selectLeader: (row) ->
          @selectedLeader = @tableFind @leaders, row
          @$emit "selectedLeader", @selectedLeader

        filterByFaction: (models, results) ->
          _.map models, (factiongroup, faction) =>
            if _.contains @factions, faction
              results.push factiongroup
            else
              results

        nameAndMaybeFaction: (model) ->
          dups = _.filter @leaders, (x) -> x.name == model.name
          if dups.length > 1
            model.name + ' (' + model.faction + ')'
          else
            model.name

        listAttributes: (atts, interp) ->
          f = (x) -> _.any [
            x.substring(0,4).match(/[WR]a[rv]e/),
            x == "Master",
            x == "Henchman"
          ]
          g = (x) -> x.replace /([A-Z])/g, ' $1'
          _.reject(atts, f).map(g).join interp


  export default SelectLeader
</script>

<style lang="sass">
  tr.selected td
    background-color: #ccc
</style>
