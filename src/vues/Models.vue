<template>
  <div class="models-vue">

  </div>
</template>

<script lang="coffee">
  import AllModels from '../data/Models.coffee'
  Models =

    created: () ->
      console.log AllModels.length + " Models"



  export default Models
</script>
