var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      //timezoneParam: "America/Los_Angeles",
      editable: true,
      eventLimit: true,
      eventStartEditable: false,
      eventEndEditable: false,
      events: '/events.json',

      eventDataTransform: function( eventData ) {
        console.log(eventData);
        if (eventData.editable){
          eventData.borderColor = "#00FF00";
        }
        return eventData;
      },

      eventRender: function eventRender( event, element, view ) {
        //Filter non-personal events
        if($('#counselor_filter').is(':checked') && !event.editable){
          console.log('hi')
          return false;
        }
        //Filter based on room
        var match = false;
        $('.room_filter:checked').each(function(){
          if ($(this).attr('name') == event.room){
            match = true;
          }
        });
        return match;
      },

      select: function(start, end) {
        $.getScript('/events/new', function() {
          $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
        });
        calendar.fullCalendar('unselect');
      },

      eventClick: function(event, jsEvent, view) {
        if (event.editable){
            $.getScript(event.edit_url, function() {
              $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"))
              date_range_picker();
              $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
              $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
          });
        }
      }
    });
  })
  $('#calendar_filters').on('click',function(){
    $('.calendar').fullCalendar('rerenderEvents');
  })
  $('#counselor_filter').on('click',function(){
    $('.calendar').fullCalendar('rerenderEvents');
  })
};

$(document).ready(initialize_calendar);
