document.addEventListener 'turbolinks:load', ->
  document.querySelectorAll('.filters .select').forEach (select) ->
    select.addEventListener 'change', ->
      window.location.assign(this.options[this.selectedIndex].getAttribute('data-path'))
