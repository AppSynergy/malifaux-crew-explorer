<template>
  <div class="smart-table-vue">
    <table class="mt-4 table table-hover">
      <thead>
        <tr>
          <th v-for="header, index in headers"
            v-on:click="sortBy(index)"
          ><span class="th">
            {{ header }}
            <i class="fa fa-caret-up pl-1"
              v-if="sortIndex == index && !sortAscending"></i>
            <i class="fa fa-caret-down pl-1"
              v-if="sortIndex == index && sortAscending"></i>
          </span>
          </th>
        </tr>
      </thead>
      <tbody class="models">
        <tr v-for="row in sortedData">
          <td v-for="cell in row">
            {{ cell }}
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script lang="coffee">

  SmartTable =

    props: ['tableData']

    data: () ->
      sortIndex: 'name'
      sortAscending: true
      headers:
        name: 'Name'
        faction: 'Faction'
        keywords: 'Keywords'
        cost: 'Cost'

    computed:
      sortedData: () ->
        data = _.sortBy @tableData, (row) => row[@sortIndex]
        if @sortAscending then data
        else data.reverse()

    methods:
      sortBy: (index) ->
        if index == @sortIndex then @sortAscending = !@sortAscending
        @sortIndex = index

  export default SmartTable

</script>
