<template>
  <table class="mt-4 table table-bordered table-hover">
    <thead>
      <tr>
        <th v-for="header in headers"
          v-on:click="sortBy(header)"
        >{{ header }}</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="row in sortedData"
        v-on:click="selectRow(row)"
        :class="{ selected: selectedRow == row }">
        <td v-for="cell in tail(row)">{{ cell }}</td>
      </tr>
    </tbody>
  </table>
</template>

<script lang="coffee">

  SortableTable =

    props: [ 'headers', 'data' ]

    data: () ->
      selectedRow: null
      sortColumn: null
      sortIndex: 0
      sortAscending: true

    computed:
      sortedData: () ->
        data = _.sortBy @data, (row) => row[@sortIndex + 1]
        if @sortAscending then data
        else data.reverse()

    methods:

      tail: (x) -> _.tail x

      selectRow: (row) ->
        @selectedRow = row
        @$emit 'selectedRow', @selectedRow

      sortBy: (header) ->
        @sortIndex = _.indexOf @headers, header
        if @sortColumn == header then @sortAscending = !@sortAscending
        else @sortColumn = header


  export default SortableTable

</script>
