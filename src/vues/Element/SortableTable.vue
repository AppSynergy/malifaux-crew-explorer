<template>
  <table class="mt-4 table table-bordered table-hover">
    <thead>
      <tr>
        <th v-for="header in headers">{{ header }}</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="row in data"
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

    methods:

      tail: (x) -> _.tail x

      selectRow: (row) ->
        @selectedRow = row
        @$emit 'selectedRow', @selectedRow

  export default SortableTable
</script>
