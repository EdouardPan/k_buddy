import 'fullcalendar';
import 'fullcalendar/dist/fullcalendar.css';

export function showCalendar() {

  // page is now ready, initialize the calendar...

  const listEvents = document.getElementById('calendar').getAttribute('data-event')

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
    events: JSON.parse(listEvents),
    // events:
    // [
    //   {
    //     title  : '',
    //     start  : '2018-05-30',
    //     icon : 'fas_fa-user-md'
    //   },
    //   {
    //     title  : '',
    //     start  : '2018-05-30T12:00:00',
    //     end    : '2018-05-30T12:30:00',
    //     icon : 'fas_fa-user-md'
    //   },
    //   {
    //     title  : '',
    //     start  : '2018-05-30T08:00:00',
    //     end    : '2018-05-30T08:30:00',
    //     icon : 'fas_fa-user-md'
    //   },      {
    //     title  : '',
    //     start  : '2018-05-30T14:00:00',
    //     end    : '2018-05-30T14:30:00',
    //     icon : 'fas_fa-user-md'
    //   },
    //   {
    //     title  : '',
    //     start  : '2018-05-30T16:00:00',
    //     end    : '2018-05-30T16:30:00',
    //     icon : 'fas_fa-capsules'
    //   },
    //   {
    //     title  : 'event2',
    //     start  : '2018-05-24T12:00:00',
    //     end    : '2018-05-24T12:30:00',
    //     icon : 'fas_fa-user-md'
    //   },
    //   {
    //     title  : 'event3',
    //     start  : '2018-06-01T12:30:00',
    //     allDay : false, // will make the time show
    //     icon : 'fas_fa-capsules'
    //   }
    // ],
    eventRender: function(event, element) {
      if (event.icon) {
        const icon = event.icon.replace('_', ' ');
        element.find(".fc-title").prepend(`<i class='${icon}'></i>`);
      }
    },
    // viewRender: function(view, element) {
    //   $('#calendar').fullCalendar( ‘removeEvents’ [, idOrFilter ] )
    //   $('#calendar').fullCalendar( ‘renderEvents’, events [, stick ] )
    // }

  })

}

