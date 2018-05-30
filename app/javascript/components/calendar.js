import 'fullcalendar';
import 'fullcalendar/dist/fullcalendar.css';

export function showCalendar() {

  // page is now ready, initialize the calendar...

  $('#calendar').fullCalendar({
    // put your options and callbacks here
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
    events: [
      {
        title  : '',
        start  : '2018-05-30'
      },
      {
        title  : 'event2',
        start  : '2018-05-20',
        end    : '2018-05-21'
      },
      {
        title  : 'event3',
        start  : '2018-06-01T12:30:00',
        allDay : false // will make the time show
      }
    ],
    eventRender: function(event, element) {
      element.find(".fc-title").prepend("<i class='fas fa-pills'></i><i class='fas fa-user-md'></i>");
    }

  })

}
