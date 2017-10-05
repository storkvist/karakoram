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

@fadeIn = (el, display) ->
  el.style.opacity = 0
  el.style.display = display || 'block'
  fade = ->
    val = parseFloat(el.style.opacity)
    if !((val += .1) > 1)
      el.style.opacity = val
      requestAnimationFrame(fade)
  fade()
