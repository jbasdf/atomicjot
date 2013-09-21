//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require atomicjot

AtomicJot = Ember.Application.create();

//= require_tree .


$(document).ready(function() {
  $('[data-toggle=offcanvas]').click(function() {
    $('.row-offcanvas').toggleClass('active');
  });
});