console.log("app file"),function($){"use strict";var Components=function(){};Components.prototype.initTooltipPlugin=function(){$.fn.tooltip&&$('[data-toggle="tooltip"]').tooltip()},Components.prototype.initPopoverPlugin=function(){$.fn.popover&&$('[data-toggle="popover"]').popover()},Components.prototype.initCustomModalPlugin=function(){$('[data-plugin="custommodal"]').on("click",function(e){Custombox.open({target:$(this).attr("href"),effect:$(this).attr("data-animation"),overlaySpeed:$(this).attr("data-overlaySpeed"),overlayColor:$(this).attr("data-overlayColor")}),e.preventDefault()})},Components.prototype.initSlimScrollPlugin=function(){$.fn.slimScroll&&$(".slimscroll-alt").slimScroll({position:"right",size:"5px",color:"#98a6ad",wheelStep:10})},Components.prototype.initRangeSlider=function(){$.fn.slider&&$('[data-plugin="range-slider"]').slider({})},Components.prototype.initSwitchery=function(){$('[data-plugin="switchery"]').each(function(idx,obj){new Switchery($(this)[0],$(this).data())})},Components.prototype.initKnob=function(){$('[data-plugin="knob"]').each(function(idx,obj){$(this).knob()})},Components.prototype.initCounterUp=function(){$(this).attr("data-delay")&&$(this).attr("data-delay"),$(this).attr("data-time")&&$(this).attr("data-time");$('[data-plugin="counterup"]').each(function(idx,obj){$(this).counterUp({delay:100,time:1200})})},Components.prototype.init=function(){this.initTooltipPlugin(),this.initPopoverPlugin(),this.initSlimScrollPlugin(),this.initCustomModalPlugin(),this.initRangeSlider(),this.initSwitchery(),this.initKnob(),this.initCounterUp()},$.Components=new Components,$.Components.Constructor=Components}(window.jQuery),function($){"use strict";window.jQuery.Components.init()}(),function($){"use strict";var Components=function(){};Components.prototype.initTooltipPlugin=function(){$.fn.tooltip&&$('[data-toggle="tooltip"]').tooltip()},Components.prototype.initPopoverPlugin=function(){$.fn.popover&&$('[data-toggle="popover"]').popover()},Components.prototype.initCustomModalPlugin=function(){$('[data-plugin="custommodal"]').on("click",function(e){Custombox.open({target:$(this).attr("href"),effect:$(this).attr("data-animation"),overlaySpeed:$(this).attr("data-overlaySpeed"),overlayColor:$(this).attr("data-overlayColor")}),e.preventDefault()})},Components.prototype.initSlimScrollPlugin=function(){$.fn.slimScroll&&$(".slimscroll-alt").slimScroll({position:"right",size:"5px",color:"#98a6ad",wheelStep:10})},Components.prototype.initRangeSlider=function(){$.fn.slider&&$('[data-plugin="range-slider"]').slider({})},Components.prototype.initSwitchery=function(){$('[data-plugin="switchery"]').each(function(idx,obj){new Switchery($(this)[0],$(this).data())})},Components.prototype.initKnob=function(){$('[data-plugin="knob"]').each(function(idx,obj){$(this).knob()})},Components.prototype.initCounterUp=function(){$(this).attr("data-delay")&&$(this).attr("data-delay"),$(this).attr("data-time")&&$(this).attr("data-time");$('[data-plugin="counterup"]').each(function(idx,obj){$(this).counterUp({delay:100,time:1200})})},Components.prototype.init=function(){this.initTooltipPlugin(),this.initPopoverPlugin(),this.initSlimScrollPlugin(),this.initCustomModalPlugin(),this.initRangeSlider(),this.initSwitchery(),this.initKnob(),this.initCounterUp()},$.Components=new Components,$.Components.Constructor=Components}(window.jQuery),function($){"use strict";window.jQuery.Components.init()}(),function($){"use strict";function initSlimscrollMenu(){$(".slimscroll-menu").slimscroll({height:"auto",position:"right",size:"8px",color:"#9ea5ab",wheelStep:5})}$(".toggle-slim").click(function(){$("body").toggleClass("enlarged"),$("i",this).toggleClass("fi-arrow-left fi-arrow-right"),$("span",this).text(function(i,text){return"Collapse Nav"===text?"Expand Nav":"Collapse Nav"})}),initSlimscrollMenu(),$(".slimscroll").slimscroll({height:"auto",position:"right",size:"8px",color:"#9ea5ab"}),$("#side-menu").metisMenu(),$(".button-menu-mobile").on("click",function(event){event.preventDefault(),$("body").toggleClass("enlarged"),initSlimscrollMenu()}),$(window).width()<1025?$("body").addClass("enlarged"):1!=$("body").data("keep-enlarged")&&$("body").removeClass("enlarged"),$("#sidebar-menu a").each(function(){var pageUrl=window.location.href.split(/[?#]/)[0];this.href==pageUrl&&($(this).addClass("active"),$(this).parent().addClass("active"),$(this).parent().parent().addClass("in"),$(this).parent().parent().prev().addClass("active"),$(this).parent().parent().parent().addClass("active"),$(this).parent().parent().parent().parent().addClass("in"),$(this).parent().parent().parent().parent().parent().addClass("active"))})}(jQuery);