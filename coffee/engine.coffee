showGreeting = ->
    if $(window).width() > 575
        width = '420px' 
        pad = '49px'
    else
        width = '320px'
        pad = '0px'
    greeting = $('#greeting')
    text = $('#greeting > #text')
    greeting.show()
    text.fadeIn 300
    greeting.animate {width: width}, 200
    $('#hello').animate {'padding-left': pad}, 200


hideGreeting = ->
    greeting = $('#greeting')
    text = $('#greeting > #text')
    text.fadeOut 100
    $('#hello').animate {'padding-left': '0px'}, 200
    greeting.animate {width: '0px'}, 200, ->
        greeting.hide()
        text.hide()


$(document).ready ->
    greeting = $('#greeting')
    text = $('#greeting > #text')
    portfolio = $('#portfolio')
    hello = $('#hello')
    button = $('#hello > button')
    winWidth = $(window).width()

    if winWidth < 480
        button.hide()
    
    portfolio.hide()

    button.click ->
        if greeting.is ':visible' then hideGreeting() else showGreeting()

    $('.go-portfolio').click (event) ->
        event.preventDefault()
        hideGreeting() if greeting.is(':visible')

        hello.fadeOut 200, ->
            hello.hide()
            portfolio.fadeIn 200

        $('header').animate {'padding-top': '0px'}, 200
        $('#go-portfolio').css 'color', '#aaa'

    $('.go-home').click (event) ->
        event.preventDefault()
        if portfolio.is ':visible'
            portfolio.fadeOut 200, ->
                portfolio.hide()
                hello.fadeIn 200
                if winWidth < 480
                    greeting.css 'width', parseFloat winWidth + 'px'
                    greeting.show()
                    text.show()
            
            if winWidth > 480
                $('header').animate {'padding-top': '200px'}, 200

        $('#go-portfolio').css 'color', 'white'