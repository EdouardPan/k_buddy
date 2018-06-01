//= require algolia/v3/algoliasearch.min

import "bootstrap";
import { menuVisible } from '../components/addmenu';
import { menuInvisible } from '../components/menuinvisible';
import $ from 'jquery';
import { showCalendar } from '../components/calendar';

import { modal } from '../components/modal';


if (document.getElementById('calendar')){
  $(document).ready(showCalendar());
}

menuVisible();
menuInvisible();

if (document.querySelector('.photo-box')){
  modal();
}
