import "bootstrap";
import { reportSubmit } from "reports/report.js";
import { search } from "./search";

reportSubmit()
search();

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import '../components/message'