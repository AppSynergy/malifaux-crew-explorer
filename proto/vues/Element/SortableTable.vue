<template>
  <table class="mt-4 table table-hover">
    <thead>
      <tr>
        <th v-for="header in headers"
          v-on:click="sortBy(header)"
          v-bind:class="{ sortUp: sortColumn == header && sortAscending }"
        ><span class="th">
          {{ header }}
          <i class="fa fa-caret-up pl-1"
            v-if="sortColumn == header && !sortAscending"></i>
          <i class="fa fa-caret-down pl-1"
            v-if="sortColumn == header && sortAscending"></i>
        </span>
        </th>
      </tr>
    </thead>
    <tbody class="models">
      <tr v-for="row in sortedData"
        v-on:click="selectRow(row)"
        v-bind:class="row[1]">
        <td v-for="cell in tail(row)">
          {{ cell }}
        </td>
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
        data = _.sortBy @data, (row) => row[@sortIndex + 2]
        if @sortAscending then data
        else data.reverse()

    methods:

      tail: (x) -> _.tail _.tail(x)

      selectRow: (row) ->
        @selectedRow = row
        @$emit 'selectedRow', @selectedRow

      sortBy: (header) ->
        @sortIndex = _.indexOf @headers, header
        if @sortColumn == header
          @sortAscending = !@sortAscending
        else
          @sortAscending = true
          @sortColumn = header


  export default SortableTable

</script>

<style lang="sass">

  @import './Colors.sass'

  html table.table thead
    th
      background-color: #444
      color: white
      border: none
    th:hover
      cursor: s-resize
      &.sortUp
        cursor: n-resize
  tr td
    cursor: pointer
  span.th
    white-space: nowrap

  // Keyword Colors!

  tbody.models tr
    @each $faction, $color in $colors
      &.#{$faction}
        $tmpCol: lighten(desaturate($color, 23), 15)
        border-bottom: 3px solid $tmpCol !important

</style>
