import "bootstrap";
import { menuVisible } from '../components/addmenu';
import { menuInvisible } from '../components/menuinvisible';
import $ from 'jquery';
import { showCalendar } from '../components/calendar';


if (document.getElementById('calendar')){
  $(document).ready(showCalendar());
}

menuVisible();
menuInvisible();

