<template>
  <div class="panel-select-vue">

    <div class="card">
      <div class="bg-primary border-bottom-0 rounded">
        <h2 class="mb-0 py-2 px-4 text-white">
          <span v-on:click="openPanel">{{ title }}</span>
          <span class="pull-right"
            v-if="value">{{ value.name }}</span>
        </h2>
      </div>
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
