(function() {
  var hideGreeting, showGreeting;

  showGreeting = function() {
    var greeting, pad, text, width;
    if ($(window).width() > 575) {
      width = '420px';
      pad = '49px';
    } else {
      width = '320px';
      pad = '0px';
    }
    greeting = $('#greeting');
    text = $('#greeting > #text');
    greeting.show();
    text.fadeIn(300);
    greeting.animate({
      width: width
    }, 200);
    return $('#hello').animate({
      'padding-left': pad
    }, 200);
  };

  hideGreeting = function() {
    var greeting, text;
    greeting = $('#greeting');
    text = $('#greeting > #text');
    text.fadeOut(100);
    $('#hello').animate({
      'padding-left': '0px'
    }, 200);
    return greeting.animate({
      width: '0px'
    }, 200, function() {
      greeting.hide();
      return text.hide();
    });
  };

  $(document).ready(function() {
    var button, greeting, hello, portfolio, text, winWidth;
    greeting = $('#greeting');
    text = $('#greeting > #text');
    portfolio = $('#portfolio');
    hello = $('#hello');
    button = $('#hello > button');
    winWidth = $(window).width();
    if (winWidth < 480) {
      button.hide();
    }
    portfolio.hide();
    button.click(function() {
      if (greeting.is(':visible')) {
        return hideGreeting();
      } else {
        return showGreeting();
      }
    });
    $('.go-portfolio').click(function(event) {
      event.preventDefault();
      if (greeting.is(':visible')) {
        hideGreeting();
      }
      hello.fadeOut(200, function() {
        hello.hide();
        return portfolio.fadeIn(200);
      });
      $('header').animate({
        'padding-top': '0px'
      }, 200);
      return $('#go-portfolio').css('color', '#aaa');
    });
    return $('.go-home').click(function(event) {
      event.preventDefault();
      if (portfolio.is(':visible')) {
        portfolio.fadeOut(200, function() {
          portfolio.hide();
          hello.fadeIn(200);
          if (winWidth < 480) {
            greeting.css('width', parseFloat(winWidth + 'px'));
            greeting.show();
            return text.show();
          }
        });
        if (winWidth > 480) {
          $('header').animate({
            'padding-top': '200px'
          }, 200);
        }
      }
      return $('#go-portfolio').css('color', 'white');
    });
  });

}).call(this);
