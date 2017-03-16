<template>
  <div class="select-leader-vue mt-4">

    <h2>Select your leader</h2>

    <form class="form-inline my-4">
      <label class="mr-4" for="soulstones">Soulstones: </label>
      <input type="text" class="form-control" v-model="soulstones">
    </form>

    <table class="table table-bordered table-hover" v-if="hasLeaders">
      <thead>
        <tr>
          <th>Name</th>
          <th>Cache</th>
          <th>Keywords</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="leader in leaders"
          v-on:click="selectLeader(leader)"
          :class="{ selected: selectedLeader == leader }">
          <td>{{ leader.name }}</td>
          <td>{{ leader.cache }}</td>
          <td>{{ listAttributes(leader.attributes, ', ') }}</td>
        </tr>
      </tbody>
    </table>

  </div>
</template>

<script lang="coffee">

  SelectLeader =

    props: [ 'masters', 'henchmen', 'factions' ]

    data: () ->
      soulstones: 50
      selectedLeader: null

    computed:
      hasLeaders: () -> @leaders.length > 0
      leaders: () ->
        out = []
        if @soulstones > 25 then @filterByFaction @masters, out
        if @soulstones < 40 then @filterByFaction @henchmen, out
        _.flatten out

    methods:

        selectLeader: (leader) ->
          @selectedLeader = leader

        filterByFaction: (models, results) ->
          _.map models, (factiongroup, faction) =>
            if _.contains @factions, faction
              results.push factiongroup
            else
              results

        listAttributes: (atts, interp) ->
          _.reject atts, (x) ->
            x.substring(0,4) == "Wave" || x == "Master"
          .join interp

  export default SelectLeader
</script>

<style lang="sass">
  tr.selected td
    background-color: #ccc
</style>
