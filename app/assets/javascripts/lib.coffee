@delay = (ms, func) ->
  setTimeout func, ms

@fadeOut = (el) ->
  el.style.opacity = 1
  fade = ->
    if (el.style.opacity -= .1) < 0
      el.style.display = 'none';
    else
      requestAnimationFrame(fade);
  fade()
