<template>
  <div class="smart-table-vue">
    <table class="mt-4 table table-hover">
      <thead>
        <tr>
          <th v-for="header in headers"
          ><span class="th">
            {{ header }}
          </span>
          </th>
        </tr>
      </thead>
      <tbody class="models">
        <tr v-for="row in tableData">
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
      headers: ['Name', 'Faction', 'Keywords', 'Cost']

  export default SmartTable

</script>
