<template>
  <div class="select-leader-vue">

    <div id="SelectLeaderPanel" style="display:none">

      <div class="row mt-4">
        <div class="col col-3" v-for="leader in leaders">
          <div class="leader-card card mb-4">

            <div class="card-block">
              <h5>{{ leader.name }}</h5>
              <div class="leader-attributes">
                <span class="leader-attribute"
                  v-for="attr in leader.attributes">{{ attr }}</span>
              </div>
            </div>

            <div class="card-footer">
              <button class="btn btn-success pull-right p-1"
                v-on:click="selectLeader(leader)"
              >select</button>
            </div>

          </div>
        </div>
      </div>

    </div>

  </div>
</template>

<script lang="coffee">

  import Encounters from '../../data/Encounters.coffee'

  SelectLeader =

    props: ['leaders']

    methods:
      selectLeader: (leader) ->
        @$emit 'selectedLeader', leader

  export default SelectLeader

</script>

<style lang="sass">

  .leader-card
    position: relative
    min-height: 12em

  .leader-attribute
    &:before
      content: ' \00B7 '
    &:first-child:before
      content: none

</style>
