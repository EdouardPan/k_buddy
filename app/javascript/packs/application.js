import "bootstrap";
import $ from 'jquery';

import { showCalendar } from '../components/calendar';

import { modal } from '../components/modal';

import { algoliaAutocomplete } from '../components/autocomplete';

import { openNav } from '../components/sidenav';
import { closeNav } from '../components/sidenav';

import { sliderSymptoms } from '../components/slider';


import { openMenu } from '../components/navmenu';
import { closeMenu } from '../components/navmenu';

// calendar

if (document.getElementById('calendar')){
  $(document).ready(showCalendar());
}

if (document.querySelector('.photo-box')){
  modal();
}

// sidenav
if (document.getElementById('mySidenav')){
  openNav();
  closeNav();
}

// navmenu
if (document.querySelector('.navbar-kbuddy')){
  openMenu();
  closeMenu();
}

// slider
if (document.querySelector('.slidecontainer')){
  sliderSymptoms();
}
