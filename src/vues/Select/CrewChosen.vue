<template>
  <div class="crew-chosen-vue">
    <ul class="list-group">
      <li class="list-group-item"
        v-for="model in chosen"
        v-on:click="removeModel(model)"
      >{{ model.name }} {{ model.cost }}</li>
    </ul>
  </div>
</template>

<script lang="coffee">

  CrewChosen =
    props: ['chosen']

    methods:

      removeModel: (model) ->
        @$emit 'removeModel', model

  export default CrewChosen

</script>
