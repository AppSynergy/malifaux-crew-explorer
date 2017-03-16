<template>
  <div class="select-crew-vue mt-4" v-if="hasLeader">

    <h2>Select Crew</h2>

    <table class="mt-4 table table-bordered table-hover">
      <thead>
        <tr>
          <th>Model</th>
          <th>Station</th>
          <th>Cost</th>
          <th>Keywords</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="model in crew">
          <td>{{ model.name }}</td>
          <td>{{ model.station }}</td>
          <td>{{ model.cost }}</td>
          <td>{{ listAttributes(model.attributes, ', ') }}</td>
        </tr>
      </tbody>
    </table>

  </div>
</template>

<script lang="coffee">

  SelectCrew =

    props: [ 'leader', 'minions', 'enforcers', 'henchmen', 'peons' ]

    data: () ->
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
