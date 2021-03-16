function tdInlineHandler(testId) {
  let data = `[data-test-id="${testId}"]`
  let link = document.querySelector('.form-inline-link' + data)
  let $testTitle = $('.test-title' + data)
  let $formInline = $('.form-inline' + data)

  $testTitle.toggle()
  $formInline.toggle()

  if ($formInline.is(':visible')) {
    link.textContent = I18n.t('app.cancel');
  } else {
    link.textContent = I18n.t('app.edit');
  }
}

function formInlineHandler(event) {
  event.preventDefault()

  let testId = this.dataset.testId
  tdInlineHandler(testId)
}

document.addEventListener('turbolinks:load', function() {
  I18n.locale = $('body').data('locale')

  $('.form-inline-link').on('click', formInlineHandler)

  let errors = document.querySelector('.resource-errors')

  if (errors && document.querySelector('.tests-index')) {
    let resourceId = errors.dataset.resourceId
    tdInlineHandler(resourceId)
  }
})
