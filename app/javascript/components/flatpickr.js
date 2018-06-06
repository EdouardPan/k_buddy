import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"; // Note this is important!
import { French } from "flatpickr/dist/l10n/fr.js";

if (document.querySelector(".datepicker")){
  flatpickr(".datepicker", {
    altInput: true,
    locale: French
  });
}
if (document.querySelector(".datepicker-time")){
  flatpickr(".datepicker-time", {
    noCalendar: true,
    enableTime: true,
    altInput: true,
    time_24hr: true
  });
}
