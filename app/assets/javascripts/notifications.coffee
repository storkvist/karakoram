document.addEventListener 'turbolinks:load', ->
  if handle = document.querySelector('.notification .delete')
    handle.addEventListener 'click', -> this.parentElement.remove()
