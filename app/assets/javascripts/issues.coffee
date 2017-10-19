document.addEventListener 'turbolinks:load', ->
  form = document.getElementById('find_issue')
  if form
    document.querySelector('#find').addEventListener 'click', (e) ->
      token = form.token.value
      if token
        window.location.assign('/issues/' + token)
      else
        fadeIn(document.querySelector('#find_issue .help'))
        document.querySelector('#find_issue .input').classList.add('is-danger')
      e.preventDefault()

  status_switcher = document.querySelector('.switch-status')
  if status_switcher
    document.querySelectorAll('.switch-status a').forEach (link) ->
      link.addEventListener 'click', (e) ->
        document.querySelector('.switch-status #issue_status').value = this.getAttribute('data-status')
        document.querySelector('.switch-status form').submit()
