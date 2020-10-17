import { Controller } from 'stimulus';
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
export default class extends Controller {

  static targets = ['map']

  connect() {
    // console.log("hello from StimulusJS")
    this.initMapbox()
    const mapToggler = document.getElementById('map-toggler')
    mapToggler.addEventListener("click", (event) => {
      event.preventDefault();

      this.toggleVisibility('map-container')
      this.toggleVisibility('offers-container')

      // console.log('Map toggler')
    })
  }

  initMapbox() {
    if (this.mapTarget) { // only build a map if there's a div#map to inject into
      mapboxgl.accessToken = this.mapTarget.dataset.mapboxApiKey;
      this.address = JSON.parse(this.mapTarget.dataset.address)[0]; // Getting lat/lng from controller
      this.offices = JSON.parse(this.mapTarget.dataset.offices)

      this.map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10',
        // center: [this.address.lng, this.address.lat], 
        zoom: 15
      });


      this.showUserAddress()
      this.showBrancheOffices()
      this.fitMap()
      // this.map.scrollZoom.disable();
    }
  }

  showBrancheOffices() {
    this.offices.forEach((office) => {
      const custom = document.createElement('div')
      custom.classList.add('office-marker')
      // console.log(office)
      new mapboxgl.Marker(custom)
        .setLngLat([office.lng, office.lat])
        .addTo(this.map);
    });
  }

  showUserAddress() {
    const address = this.address
    const custom = document.createElement('div')
    custom.classList.add('user-marker')
    // console.log(address)
    new mapboxgl.Marker(custom)
      .setLngLat([address.lng, address.lat])
      .addTo(this.map);
  }

  fitMap() {
    const bounds = new mapboxgl.LngLatBounds();
    this.offices.forEach(office => bounds.extend([office.lng, office.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  toggleVisibility(id) {
    const e = document.getElementById(id);
    // console.log(e)
    e.toggleAttribute('hidden')
  }

}