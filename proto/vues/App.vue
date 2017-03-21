<template>
  <div id="app">
    <div class="container">
      <models></models>
    </div>
  </div>
</template>

<script lang="coffee">
  import Models from './Models.vue'

  App =
    name: 'app'
    components: { Models }

  export default App
</script>

<style lang="sass">
  @import '../../node_modules/bootstrap/dist/css/bootstrap.css'
  @import '../../node_modules/font-awesome/css/font-awesome.min.css'
</style>
