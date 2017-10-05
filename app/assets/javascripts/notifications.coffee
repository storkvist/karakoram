document.addEventListener 'turbolinks:load', ->
  if handle = document.querySelector('.notification .delete')
    delay 5000, ->
      fadeOut(handle.parentElement) if handle

    handle.addEventListener 'click', ->
      handle.parentElement.remove()
