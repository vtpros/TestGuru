document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  let table = document.querySelector('table')
  let up_tag_list = this.querySelector('.octicon-arrow-up').classList
  let down_tag_list = this.querySelector('.octicon-arrow-down').classList
  let sortedRows = Array.from(table.rows).slice(1)

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
