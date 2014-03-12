$ ->
  $('#post').bind 'click', (event) ->
    console.log 'clicked'
    $.post '/post',
      poem: $('.input')[0].textContent
      (data) ->
        if data['error']?
          $('#error-message')[0].innerHTML = data['error']
          $('#error-message')[0].style.display = 'block'
          setTimeout (-> $('#error-message').fadeOut(1000)), 2500
        else
          console.log 'hi'
          new_poem = document.createElement 'span'
          $(new_poem).addClass 'poem'
          new_poem.style.backgroundColor = 'rgb(' + (Math.floor((256-229)*Math.random()) + 230) + ',' +
                                    (Math.floor((256-229)*Math.random()) + 230) + ',' +
                                    (Math.floor((256-229)*Math.random()) + 230)
          new_poem.innerHTML = "<p>#{data['poem']}</p><p class='by'>by #{$('#username')[0].textContent}</p>"
          $(new_poem).prependTo $('#stream')
