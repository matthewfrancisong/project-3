$(document).on("turbolinks:load", function() {
  $(".button-collapse").sideNav();
    // Show sideNav
  $('.button-collapse').sideNav('show');
    // Hide sideNav
  $('.button-collapse').sideNav('hide');
    // Destroy sideNav
  $('.button-collapse').sideNav('destroy');

  $('.button-collapse').sideNav({
     menuWidth: 300, // Default is 300
     edge: 'right', // Choose the horizontal origin
     closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
     draggable: true, // Choose whether you can drag to open on touch screens,
     onOpen: function(el) {  },
     onClose: function(el) {  },
   })
  $('.dropdown-button').dropdown({
          inDuration: 300,
          outDuration: 225,
          constrainWidth: false, // Does not change width of dropdown to that of the activator
          hover: false, // Activate on hover
          gutter: 0, // Spacing from edge
          belowOrigin: false, // Displays dropdown below the button
          alignment: 'left', // Displays dropdown with edge aligned to the left of button
          stopPropagation: false // Stops event propagation
        }
  );
  $('select').material_select();
  $('.slider').slider();
  // Pause slider
  $('.slider').slider('pause');
  // Start slider
  $('.slider').slider('start');
  // Next slide
  $('.slider').slider('next');
  // Previous slide
  $('.slider').slider('prev');
  $('.datepicker').pickadate({
   selectMonths: true, // Creates a dropdown to control month
   selectYears: 15, // Creates a dropdown of 15 years to control year,
   today: 'Today',
   clear: 'Clear',
   close: 'Ok',
   closeOnSelect: false // Close upon selecting a date,
 });
 $('.timepicker').pickatime({
    default: 'now', // Set default time: 'now', '1:30AM', '16:30'
    fromnow: 0,       // set default time to * milliseconds from now (using with default = 'now')
    twelvehour: false, // Use AM/PM or 24-hour format
    donetext: 'OK', // text for done-button
    cleartext: 'Clear', // text for clear-button
    canceltext: 'Cancel', // Text for cancel-button
    autoclose: false, // automatic close timepicker
    ampmclickable: true, // make AM PM clickable
    aftershow: function(){} //Function for after opening timepicker
  });



})
