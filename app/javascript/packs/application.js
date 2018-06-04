import "bootstrap";
// import { menuVisible } from '../components/addmenu';
// import { menuInvisible } from '../components/menuinvisible';
import $ from 'jquery';
import { showCalendar } from '../components/calendar';

import { modal } from '../components/modal';

import { openNav } from '../components/sidenav';
import { closeNav } from '../components/sidenav';

import { openMenu } from '../components/navmenu';
import { closeMenu } from '../components/navmenu';

if (document.getElementById('calendar')){
  $(document).ready(showCalendar());
}

// menuVisible();
// menuInvisible();

if (document.querySelector('.photo-box')){
  modal();
}

// sidenav
openNav();
closeNav();

// navmenu

openMenu();
closeMenu();

