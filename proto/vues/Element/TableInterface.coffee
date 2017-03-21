
TableInterface =
  methods:

    toIndex: (leader) ->
      leader.faction + ':' + leader.name

    tableFind: (list, row) ->
      _.find list, (x) =>
        @toIndex(x) == row[0]

    classNames: (model) ->
      str = model.attributes.join ' '
      str += ' ' + model.faction
      str #.toLowerCase()


export default TableInterface
