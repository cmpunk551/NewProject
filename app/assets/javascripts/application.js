// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require select2
$(document).ready(function() { $("#select-field").select2(); });

$(document).ready(function(){
    $("#select-field").select2({
    	minimumResultsForSearch: -1
    })
});

$(document).on("click", "#form_link", function(){
   $("#form").submit();
});
$(document).ready(function() {
	$("#form_div").hide();

	$(document).on("click","#add_Todo", function(){
   		$("#form_div").show();
	});

	$(document).on("click","#cancel_link", function(){
   		$("#form_div").hide();
	});
});

$(function () {
    $('input:checkbox').on('ifChanged', function () {
        var input = $(this).parent().parent().parent().next('li').children('span');
        if (this.checked) {
            $(input).css('text-decoration', 'line-through');
        } else {
            $(input).css('text-decoration', 'none');
        }
    })
})

$(function () {
    $('input:checkbox').on('ifChanged', function () {
    	$(this).parent().parent().submit();
    })
})

