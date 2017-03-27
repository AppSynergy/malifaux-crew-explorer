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
  .d-none
    display: none
  $brand-primary: #5626A6
  @import '../../node_modules/bootstrap/scss/bootstrap.scss'
  @import '../../node_modules/font-awesome/css/font-awesome.min.css'
</style>
