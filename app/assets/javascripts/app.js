console.log("app file");

/**
* Theme: Highdmin - Responsive Bootstrap 4 Admin Dashboard
* Author: Coderthemes
* Module/App: Core js
*/


/**
 * Components
 */
!function($) {
  "use strict";

  var Components = function() {};

  //initializing tooltip
  Components.prototype.initTooltipPlugin = function() {
      $.fn.tooltip && $('[data-toggle="tooltip"]').tooltip()
  },

  //initializing popover
  Components.prototype.initPopoverPlugin = function() {
      $.fn.popover && $('[data-toggle="popover"]').popover()
  },

  //initializing custom modal
  Components.prototype.initCustomModalPlugin = function() {
      $('[data-plugin="custommodal"]').on('click', function(e) {
        Custombox.open({
              target: $(this).attr("href"),
              effect: $(this).attr("data-animation"),
              overlaySpeed: $(this).attr("data-overlaySpeed"),
              overlayColor: $(this).attr("data-overlayColor")
          });
        e.preventDefault();
      });
  },

  //initializing Slimscroll
  Components.prototype.initSlimScrollPlugin = function() {
      //You can change the color of scroll bar here
      $.fn.slimScroll &&  $(".slimscroll-alt").slimScroll({ position: 'right',size: "5px", color: '#98a6ad',wheelStep: 10});
  },

  //range slider
  Components.prototype.initRangeSlider = function() {
      $.fn.slider && $('[data-plugin="range-slider"]').slider({});
  },

  /* -------------
   * Form related controls
   */
  //switch
  Components.prototype.initSwitchery = function() {
      $('[data-plugin="switchery"]').each(function (idx, obj) {
          new Switchery($(this)[0], $(this).data());
      });
  },

   Components.prototype.initKnob = function() {
       $('[data-plugin="knob"]').each(function(idx, obj) {
          $(this).knob();
       });
   },

  Components.prototype.initCounterUp = function() {
      var delay = $(this).attr('data-delay')?$(this).attr('data-delay'):100; //default is 100
      var time = $(this).attr('data-time')?$(this).attr('data-time'):1200; //default is 1200
       $('[data-plugin="counterup"]').each(function(idx, obj) {
          $(this).counterUp({
              delay: 100,
              time: 1200
          });
       });
   },


  //initilizing
  Components.prototype.init = function() {
      var $this = this;
      this.initTooltipPlugin(),
      this.initPopoverPlugin(),
      this.initSlimScrollPlugin(),
      this.initCustomModalPlugin(),
      this.initRangeSlider(),
      this.initSwitchery(),
      this.initKnob(),
      this.initCounterUp()
  },

  $.Components = new Components, $.Components.Constructor = Components

}(window.jQuery),
  //initializing main application module
function($) {
  "use strict";
  $.Components.init();
}(window.jQuery);




/**
* Theme: Highdmin - Responsive Bootstrap 4 Admin Dashboard
* Author: Coderthemes
* Module/App: Core js
*/


/**
 * Components
 */
!function($) {
  "use strict";

  var Components = function() {};

  //initializing tooltip
  Components.prototype.initTooltipPlugin = function() {
      $.fn.tooltip && $('[data-toggle="tooltip"]').tooltip()
  },

  //initializing popover
  Components.prototype.initPopoverPlugin = function() {
      $.fn.popover && $('[data-toggle="popover"]').popover()
  },

  //initializing custom modal
  Components.prototype.initCustomModalPlugin = function() {
      $('[data-plugin="custommodal"]').on('click', function(e) {
        Custombox.open({
              target: $(this).attr("href"),
              effect: $(this).attr("data-animation"),
              overlaySpeed: $(this).attr("data-overlaySpeed"),
              overlayColor: $(this).attr("data-overlayColor")
          });
        e.preventDefault();
      });
  },

  //initializing Slimscroll
  Components.prototype.initSlimScrollPlugin = function() {
      //You can change the color of scroll bar here
      $.fn.slimScroll &&  $(".slimscroll-alt").slimScroll({ position: 'right',size: "5px", color: '#98a6ad',wheelStep: 10});
  },

  //range slider
  Components.prototype.initRangeSlider = function() {
      $.fn.slider && $('[data-plugin="range-slider"]').slider({});
  },

  /* -------------
   * Form related controls
   */
  //switch
  Components.prototype.initSwitchery = function() {
      $('[data-plugin="switchery"]').each(function (idx, obj) {
          new Switchery($(this)[0], $(this).data());
      });
  },

   Components.prototype.initKnob = function() {
       $('[data-plugin="knob"]').each(function(idx, obj) {
          $(this).knob();
       });
   },

  Components.prototype.initCounterUp = function() {
      var delay = $(this).attr('data-delay')?$(this).attr('data-delay'):100; //default is 100
      var time = $(this).attr('data-time')?$(this).attr('data-time'):1200; //default is 1200
       $('[data-plugin="counterup"]').each(function(idx, obj) {
          $(this).counterUp({
              delay: 100,
              time: 1200
          });
       });
   },


  //initilizing
  Components.prototype.init = function() {
      var $this = this;
      this.initTooltipPlugin(),
      this.initPopoverPlugin(),
      this.initSlimScrollPlugin(),
      this.initCustomModalPlugin(),
      this.initRangeSlider(),
      this.initSwitchery(),
      this.initKnob(),
      this.initCounterUp()
  },

  $.Components = new Components, $.Components.Constructor = Components

}(window.jQuery),
  //initializing main application module
function($) {
  "use strict";
  $.Components.init();
}(window.jQuery);










/**
* Theme: Highdmin - Responsive Bootstrap 4 Admin Dashboard
* Author: Coderthemes
* Module/App: Main Js
*/


(function ($) {

  'use strict';

  function initSlimscrollMenu() {

      $('.slimscroll-menu').slimscroll({
          height: 'auto',
          position: 'right',
          size: "8px",
          color: '#9ea5ab',
          wheelStep: 5
      });
  }

  function initSlimscroll() {
      $('.slimscroll').slimscroll({
          height: 'auto',
          position: 'right',
          size: "8px",
          color: '#9ea5ab'
      });
  }

  function initMetisMenu() {
      //metis menu
      $("#side-menu").metisMenu();
  }

  function initLeftMenuCollapse() {
      // Left menu collapse
      $('.button-menu-mobile').on('click', function (event) {
          event.preventDefault();
          $("body").toggleClass("enlarged");
          initSlimscrollMenu();
      });
  }


$( ".toggle-slim" ).click(function() {
$('body').toggleClass('enlarged');
$("i", this).toggleClass("fi-arrow-left fi-arrow-right");


$("span", this).text(function(i, text){
      return text === "Collapse Nav" ? "Expand Nav" : "Collapse Nav";
    });


});


function initEnlarge() {
  if ($(window).width() < 1025) {
      $('body').addClass('enlarged');
  } else {
      if ($('body').data('keep-enlarged') != true)
          $('body').removeClass('enlarged');
  }
}

/*
  function initEnlarge() {
      if ($(window).width() < 1025) {
          $('body').addClass('enlarged');
      } else {
          if ($('body').data('keep-enlarged') != true)
              $('body').removeClass('enlarged');
      }
  }
*/


  function initActiveMenu() {
      // === following js will activate the menu in left side bar based on url ====
      $("#sidebar-menu a").each(function () {
          var pageUrl = window.location.href.split(/[?#]/)[0];
          if (this.href == pageUrl) {
              $(this).addClass("active");
              $(this).parent().addClass("active"); // add active to li of the current link
              $(this).parent().parent().addClass("in");
              $(this).parent().parent().prev().addClass("active"); // add active class to an anchor
              $(this).parent().parent().parent().addClass("active");
              $(this).parent().parent().parent().parent().addClass("in"); // add active to li of the current link
              $(this).parent().parent().parent().parent().parent().addClass("active");
          }
      });
  }

  function init() {
      initSlimscrollMenu();
      initSlimscroll();
      initMetisMenu();
      initLeftMenuCollapse();
      initEnlarge();
      initActiveMenu();
  }

  init();

})(jQuery)

