import 'fullcalendar';
import 'fullcalendar/dist/fullcalendar.css';

export function showCalendar() {

  // page is now ready, initialize the calendar...

  const listEventsDay = JSON.parse(document.getElementById('calendar').dataset.eventDay);
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
        element.find(".fc-title").prepend(`<img src='${event.img_path_A}' class='img-calendar'>`);
      }
      if (event.iconT) {
        if (event.taken) {
          element.find(".fc-title").prepend(`<img src='${event.img_path_T_taken}' class='img-calendar light-img'>`);
        } else {
          element.find(".fc-title").prepend(`<img src='${event.img_path_T}' class='img-calendar'>`);
        }
      }
      if (event.iconS){
        element.find(".fc-title").prepend(`<img src='${event.img_path_S}' class='img-calendar'>`);
      }
    },
    viewRender: function(view, element) {
      if (view.type === 'agendaDay'){
        $('#calendar').fullCalendar('removeEvents');
        $('#calendar').fullCalendar('renderEvents', listEventsDay);
      }
      if (view.type === 'month'){
        $('#calendar').fullCalendar('removeEvents');
        $('#calendar').fullCalendar('renderEvents', listEventsMonth);
      }
    }
  });
}
