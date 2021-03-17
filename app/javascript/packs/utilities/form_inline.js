function tdInlineHandler(testId) {
  const data = `[data-test-id="${testId}"]`
  const link = document.querySelector('.form-inline-link' + data)
  const $testTitle = $('.test-title' + data)
  const $formInline = $('.form-inline' + data)

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

  const testId = this.dataset.testId
  tdInlineHandler(testId)
}

document.addEventListener('turbolinks:load', function() {
  I18n.locale = $('html').attr('lang')

  $('.form-inline-link').on('click', formInlineHandler)

  const errors = document.querySelector('.resource-errors')

  if (errors && document.querySelector('.tests-index')) {
    const resourceId = errors.dataset.resourceId
    tdInlineHandler(resourceId)
  }
})
