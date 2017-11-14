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


})
