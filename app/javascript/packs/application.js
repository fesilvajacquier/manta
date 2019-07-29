import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { reportSubmit } from "reports/report.js";
reportSubmit()
import { search } from "./search";
search();
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();
import { initAutocomplete } from '../plugins/init_autocomplete.js';
initAutocomplete();
import '../components/message'
import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();







