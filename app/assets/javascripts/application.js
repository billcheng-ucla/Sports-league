// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require moment
//= require fullcalendar
//= require_tree .


$(document).on('turbolinks:load', function () {
  var trigger = $('.hamburger'),
      overlay = $('.overlay'),
     isClosed = false;
    trigger.click(function () {
      hamburger_cross();
    });
    function hamburger_cross() {
      if (isClosed == true) {
        overlay.hide();
        trigger.removeClass('is-open');
        trigger.addClass('is-closed');
        isClosed = false;
      } else {
        overlay.show();
        trigger.removeClass('is-closed');
        trigger.addClass('is-open');
        isClosed = true;
      }
  }

  $('[data-toggle="offcanvas"]').click(function () {
        $('#wrapper').toggleClass('toggled');
  });
});

$(document).on('turbolinks:load', function() {
$(".btn-pref .btn").click(function () {
    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
    // $(".tab").addClass("active"); // instead of this do the below
    $(this).removeClass("btn-default").addClass("btn-primary");
});
});

$(document).on('turbolinks:load', function() {
  var viewportWidth = $(window).width();
    $(window).resize(function () {

        if (viewportWidth < 1000) {
            $(".btn").addClass("btn-lg");
        }
    });
});

$(document).on('turbolinks:load', function()
{
	var ID = $(location).attr('href').split('/')[4];
	if ($('#calendar').html() == "")
	{
		$('#calendar').fullCalendar(
		{
      contentHeight: 500,
			header:
			{
				left: 'title',
				center: ""
			},
			events: "/teams/" + ID + "/get_events",
			eventClick: function(event, jsEvent, view) 
			{
			        if (event.edit_url != "Finished")
			        {
			        	$.getScript(event.edit_url, function() {
                  console.log(event.title);
			        	});
			        }

			},
			eventRender: function(event, element, view) 
			{
			        return $('<div class="eventData">' + event.title + '</div>');
			},
		});
	}

});
