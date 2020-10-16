import { Controller } from 'stimulus';
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
export default class extends Controller {

  static targets = ['map']

  connect() {
    console.log("hello from StimulusJS")
    this.initMapbox()
  }

  initMapbox() {
    if (this.mapTarget) { // only build a map if there's a div#map to inject into
      mapboxgl.accessToken = this.mapTarget.dataset.mapboxApiKey;
      this.address = JSON.parse(this.mapTarget.dataset.address);

      console.log(this.user_address)

      this.map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10',
        center: [this.address.lng, this.address.lat], //TODO: Pass User address lat and long
        zoom: 15
      });


      this.showBrancheOffices()
      // this.fitMapToMyLocation()
      this.map.scrollZoom.disable();
    }
  }

  showBrancheOffices() {
    console.log("TODO: Show offices around the map")
  }

  fitMapToMyLocation() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

}