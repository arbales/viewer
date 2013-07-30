FILES = window.FILES

viewer = $('#viewer')
currentIndex = 0

Images = 
  current: ->
    $('#slide-current').text currentIndex+1
    FILES[currentIndex]
  next: ->
    if currentIndex < FILES.length - 1
      currentIndex += 1
    else 
      currentIndex = 0
    this.current()
  previous: ->
    if currentIndex > 0
      currentIndex -= 1
    else
      currentIndex = FILES.length - 1
    this.current()


viewer.on 'load', ->
  toggleLoading off

viewer.attr 'src', "images/#{Images.current()}"

$('#slide-count').text FILES.length

sizeToFit = ->
  viewer.toggleClass "size-to-fit"

toggleLoading = (towards = on) ->
  viewer.toggleClass 'loading', towards

viewer.click sizeToFit

$(document).keydown (e) ->
  if e.keyCode is 39
    toggleLoading()
    viewer.attr 'src', "images/#{Images.next()}"
    if viewer[0].complete
      toggleLoading off

  if e.keyCode is 37
    toggleLoading()
    viewer.attr 'src', "images/#{Images.previous()}"
    if viewer[0].complete
      toggleLoading off
