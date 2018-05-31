import 'fullcalendar';
import 'fullcalendar/dist/fullcalendar.css';

export function showCalendar() {

  // page is now ready, initialize the calendar...

  const listEventsDay = document.getElementById('calendar').getAttribute('data-event-day');
  const listEventsWeek = document.getElementById('calendar').getAttribute('data-event-week');
  const listEventsMonth = document.getElementById('calendar').getAttribute('data-event-month');

  $('#calendar').fullCalendar({
    // put your options and callbacks here
    themeSystem: 'bootstrap4',
    defaultView: 'month',
    locale: 'fr',
    weekends: false, // will hide Saturdays and Sundays
    height: 540,
    dayClick: function() {
      alert('To be customed to add info');
    },
    header: {
      left:   'month, agendaWeek, agendaDay',
      center: '',
      right:  'prev,next'
    },
    events: JSON.parse(listEventsMonth),
    eventRender: function(event, element) {
      if (event.iconA){
        element.find(".fc-title").prepend("<i class='fas fa-user-md'></i>");
      }
      if (event.iconT){
        element.find(".fc-title").prepend("<i class='fas fa-pills'></i>");
      }
    }
    // viewRender: function(view, element) {
    //   $('#calendar').fullCalendar( ‘removeEvents’ [, idOrFilter ] )
    //   $('#calendar').fullCalendar( ‘renderEvents’, events [, stick ] )
    // }
});

}

