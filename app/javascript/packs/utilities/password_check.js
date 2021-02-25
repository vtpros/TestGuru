var password1 = null
var password2 = ''
var icon_check = null
var icon_x = null

document.addEventListener('turbolinks:load', function() {
  icon_check = document.querySelector('.octicon-check-circle')
  icon_x = document.querySelector('.octicon-x-circle')

  var pass1_field = document.querySelector('.password1')
  if (pass1_field) { pass1_field.addEventListener('change', inputPassword1) }

  var pass2_field = document.querySelector('.password2')
  if (pass2_field) { pass2_field.addEventListener('change', inputPassword2) }

})

function inputPassword1(){
  password1 = this.value
  passwordCheck()
}

function inputPassword2(){
  password2 = this.value
  passwordCheck()
}

function passwordCheck(){
  if (password2 == '') {
    icon_x.classList.add('hide')
    icon_check.classList.add('hide')
  } else if (password1 == password2 ) {
    icon_x.classList.add('hide')
    icon_check.classList.remove('hide')
  } else {
    icon_check.classList.add('hide')
    icon_x.classList.remove('hide')
  }
}
