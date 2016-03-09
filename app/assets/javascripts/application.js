// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//

$( document ).ready(function() {
   function asyncEvent() {
      var dfd = jQuery.Deferred();
      
      // Resolve after a random interval
      setTimeout(function() {
         dfd.resolve( "update" );
      }, Math.floor( 500 ));
   
      return dfd.promise();
   }

   $( "#message_text" ).keypress(function() {
      path = $( ".edit_message" ).attr('action');
      $.when( asyncEvent() ).then(
         function( status ) {
            $.ajax({
               type: "POST",
               dataType : "json",
               url: path,
               data: $( ".edit_message" ).serialize(),
               success: function( json ) {
                  $('#cipher').text(json['cipher']);
                  return false;
               },
               error: function( json ) {
                  return false;
               },
           });
         });
   });
});


