function tdInlineHandler(testId) {
  let data = `[data-test-id="${testId}"]`
  let link = document.querySelector('.form-inline-link' + data)
  // let testTitle = document.querySelector('.test-title' + data)
  // let formInline = document.querySelector('.form-inline' + data)
  let $testTitle = $('.test-title' + data)
  let $formInline = $('.form-inline' + data)

  $testTitle.toggle()
  $formInline.toggle()

  // if (formInline.classList.contains('hide')) {
  if ($formInline.is(':visible')) {
    // testTitle.classList.add('hide')
    // formInline.classList.remove('hide')
    link.textContent = 'Cancel'
  } else {
    // testTitle.classList.remove('hide')
    // formInline.classList.add('hide')
    link.textContent = 'Edit'
  }
}

function formInlineHandler(event) {
  event.preventDefault()

  let testId = this.dataset.testId
  tdInlineHandler(testId)
}

document.addEventListener('turbolinks:load', function() {
  // let controls = document.querySelectorAll('.form-inline-link')
  //
  // if (controls.length) {
  //     controls[i].addEventListener('click', formInlineHandler)
  //   }
  // }

  $('.form-inline-link').on('click', formInlineHandler)

  let errors = document.querySelector('.resource-errors')

  if (errors) {
    let resourceId = errors.dataset.resourceId
    tdInlineHandler(resourceId)
  }
})
