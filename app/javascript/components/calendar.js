import 'fullcalendar';
import 'fullcalendar/dist/fullcalendar.css';

export function showCalendar() {

  // page is now ready, initialize the calendar...

  const listEventsDay = JSON.parse(document.getElementById('calendar').dataset.eventDay);
  const listEventsWeek = JSON.parse(document.getElementById('calendar').dataset.eventWeek);
  const listEventsMonth = JSON.parse(document.getElementById('calendar').dataset.eventMonth);

  $('#calendar').fullCalendar({
    // put your options and callbacks here
    themeSystem: 'bootstrap4',
    // defaultView: 'month',
    locale: 'fr',
    weekends: true, // will hide Saturdays and Sundays
    height: 540,
    dayClick: function(date) {
      $('#calendar').fullCalendar('changeView', 'agendaDay', date);
      debugger
    },
    header: {
      left:   'month, agendaDay',
      center: 'title',
      right:  'prev,next'
    },
    events: listEventsMonth,
    eventRender: function(event, element) {
      if (event.iconA){
        element.find(".fc-title").prepend("<i class='fas fa-user-md'></i>");
      }
      if (event.iconT){
        element.find(".fc-title").prepend("<i class='fas fa-pills'></i>");
      }
      if (event.iconS){
        element.find(".fc-title").prepend("<i class='fas fa-cloud'></i>");
      }
    },
    viewRender: function(view, element) {
      if (view.type === 'agendaDay'){
        $('#calendar').fullCalendar('removeEvents');
        $('#calendar').fullCalendar('renderEvents', listEventsDay);
      }
      if (view.type === 'agendaWeek'){
        $('#calendar').fullCalendar('removeEvents');
        $('#calendar').fullCalendar('renderEvents', listEventsWeek);
      }
      if (view.type === 'month'){
        $('#calendar').fullCalendar('removeEvents');
        $('#calendar').fullCalendar('renderEvents', listEventsMonth);
      }
    }
  });

}


    // eventClick: function(calEvent, jsEvent, view) {
    //   $('#calendar').fullCalendar('changeView', 'agendaDay', date);
    //   if (view.type === 'agendaDay'){
    //     console.log(calEvent.url);
    //     window.open(calEvent.url, "_self");
    //   }
    // },
