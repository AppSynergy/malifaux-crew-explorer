<template>
  <div class="panel-select-vue">

    <div class="card">
      <h2 class="card-header">
        <span v-on:click="openPanel">{{ title }}</span>
        <span class="pull-right"
          v-if="value">{{ value.name }}</span>
      </h2>
    </div>

  </div>
</template>

<script lang="coffee">

  PanelSelect =

    props: ['title', 'value']

    methods:
      openPanel: () ->
        @$emit 'openPanel'

  export default PanelSelect

</script>
