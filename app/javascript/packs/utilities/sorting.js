document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  const table = document.querySelector('table')
  const up_tag_list = this.querySelector('.octicon-arrow-up').classList
  const down_tag_list = this.querySelector('.octicon-arrow-down').classList
  const sortedRows = Array.from(table.rows).slice(1)

  if (up_tag_list.contains('hide')) {
    sortedRows.sort( (rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1 )
    up_tag_list.remove('hide')
    down_tag_list.add('hide')
  } else {
    sortedRows.sort( (rowA, rowB) => rowA.cells[0].innerHTML < rowB.cells[0].innerHTML ? 1 : -1 )
    up_tag_list.add('hide')
    down_tag_list.remove('hide')
  }

  table.tBodies[0].append(...sortedRows);
}
