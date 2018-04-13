document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('#new_user')
  if (control) { control.addEventListener('input', passwordMatch)}
})
function passwordMatch() {
  var password = document.querySelector('#user_password')
  var passwordConfirmation = document.querySelector('#user_password_confirmation')
  if (password.value === passwordConfirmation.value) {
    this.querySelector('.octicon-thumbsup').classList.remove('hide')
    this. querySelector('.octicon-thumbsdown').classList.add('hide')
  } else if (passwordConfirmation.value === "") {
    this.querySelector('.octicon-thumbsup').classList.add('hide')
    this. querySelector('.octicon-thumbsdown').classList.add('hide')
  } else {
    this.querySelector('.octicon-thumbsup').classList.add('hide')
    this. querySelector('.octicon-thumbsdown').classList.remove('hide')
  }
}
