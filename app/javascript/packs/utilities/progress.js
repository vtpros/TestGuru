document.addEventListener('turbolinks:load', function() {
  const bar = document.querySelector('.progress-bar')
  if (bar) {
    const current_index = bar.dataset.currentIndex
    const total = bar.dataset.total
    const progress = (current_index / total) * 100
    bar.setAttribute("style", `width: ${progress}%`)
  }
})
