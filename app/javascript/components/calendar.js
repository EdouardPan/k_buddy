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
    weekends: true, // will hide Saturdays and Sundays if false
    height: 540,
    dayClick: function(date) {
      $('#calendar').fullCalendar('changeView', 'agendaDay', date);
      event.preventDefault();
      // event.stopPropagation();
    },
    header: {
      left:   'month, agendaDay',
      center: 'title',
      right:  'prev,next'
    },
    events: listEventsMonth,
    eventRender: function(event, element) {
      if (event.iconA){
        element.find(".fc-title").prepend("<img src='/assets/doctor.png' class='img-calendar'>");
      }
      if (event.iconT) {
        if (event.taken) {
          element.find(".fc-title").prepend("<img src='/assets/pills.png' class='img-calendar light-img'>");
        } else {
          element.find(".fc-title").prepend("<img src='/assets/treatment-icon.png' class='img-calendar'>");
        }
      }
      if (event.iconS){
        element.find(".fc-title").prepend("<img src='/assets/symptoms-icon.png' class='img-calendar'>");
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
