//= require jquery
//= require jquery-ui
//= require tether
//= require bootstrap-sprockets
//= require autocomplete-rails
//= require jquery_nested_form
//= require turbolinks

$('.navbar > ul.nav li a').click(function(e) {
    var $this = $(this);
    console.log($this)
    $this.parent().siblings().removeClass('active').end().addClass('active');
    e.preventDefault();
});