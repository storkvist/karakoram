document.addEventListener 'turbolinks:load', ->
  document.querySelectorAll('.filters .select').forEach (select) ->
    select.addEventListener 'change', ->
      window.location.assign(this.options[this.selectedIndex].getAttribute('data-path'))

  document.querySelectorAll('.filters .search').forEach (search) ->
    search.addEventListener 'submit', (e) ->
      e.preventDefault()
      path = this.elements['query'].getAttribute('data-path')
      if path.includes('?')
        path = path + '&'
      else
        path = path + '?'
      window.location.assign("#{path}search=#{encodeURIComponent(this.elements['query'].value)}")
