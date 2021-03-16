document.addEventListener('turbolinks:load', function() {
  bar = document.querySelector('.progress-bar')
  if (bar) {
    let current_index = bar.dataset.currentIndex
    let total = bar.dataset.total
    let progress = (current_index / total) * 100
    bar.setAttribute("style", `width: ${progress}%`)
  }
})
