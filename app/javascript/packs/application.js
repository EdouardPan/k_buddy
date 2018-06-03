import "bootstrap";
import { menuVisible } from '../components/addmenu';
import { menuInvisible } from '../components/menuinvisible';
import $ from 'jquery';
import { showCalendar } from '../components/calendar';

import { modal } from '../components/modal';

import { openNav } from '../components/temp';
import { closeNav } from '../components/temp';

if (document.getElementById('calendar')){
  $(document).ready(showCalendar());
}

menuVisible();
menuInvisible();

if (document.querySelector('.photo-box')){
  modal();
}

// temp
openNav();
closeNav();

