// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require ckeditor/init

$(document).ready(function(){
   $('.cart form').bind("ajax:success", function(evt, data, status, xhr){
       var count = xhr.responseText; 
       $('#item').html(count == 1 ? "<a href='/show_cart'>" + count + " item</a>" : "<a href='/show_cart'>" + count + " items</a>");
   });
   
   $('#delcart a').bind("ajax:success", function(evt, data, status, xhr){
       var count = xhr.responseText;
       $('#item').text("no items");
    });
   
   
   
   //Admin Menu
   $('#tabs li.current').removeClass("current");
   
    var title = $('#page_title').text()
    if(title != ""){
        title = title.charAt(0).toLowerCase() + title.slice(1);
        $('#'+title).addClass("current");
    }else {
        $('#dashboard').addClass("current");
        $('#page_title').text("Dashboard");
    }


});

