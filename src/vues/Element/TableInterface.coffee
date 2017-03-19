
TableInterface =
  methods:

    toIndex: (leader) ->
      leader.faction + ':' + leader.name

    tableFind: (list, row) ->
      _.find list, (x) =>
        @toIndex(x) == row[0]


export default TableInterface
