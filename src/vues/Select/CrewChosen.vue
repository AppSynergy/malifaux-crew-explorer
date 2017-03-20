<template>
  <div class="crew-chosen-vue">
    <ul class="list-group">
      <li class="list-group-item"
        v-for="model, index in chosen"
        v-on:click="removeModel(index)"
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
