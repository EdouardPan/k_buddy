import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";
 // Note this is important!



if (document.querySelector(".datepicker")){
  flatpickr(".datepicker", {
    altInput: true
  });
}

if (document.querySelector(".datepicker-time")){
  flatpickr(".datepicker-time", {
    noCalendar: true,
    enableTime: true,
    altInput: true
  });
}
