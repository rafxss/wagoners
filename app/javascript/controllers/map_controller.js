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
      this.address = JSON.parse(this.mapTarget.dataset.address)[0]; // Getting lat/lng from controller
      this.offices = JSON.parse(this.mapTarget.dataset.offices)

      this.map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10',
        center: [this.address.lng, this.address.lat], 
        zoom: 15
      });


      this.showUserAddress()
      this.showBrancheOffices()
      // this.fitMapToMyLocation()
      this.map.scrollZoom.disable();
    }
  }

  showBrancheOffices() {
    this.offices.forEach((office) => {
      const custom = document.createElement('div')
      custom.classList.add('office-marker')
      console.log(office)
      new mapboxgl.Marker(custom)
        .setLngLat([office.lng, office.lat])
        .addTo(this.map);
    });
  }

  showUserAddress() {
    const address = this.address
    const custom = document.createElement('div')
    custom.classList.add('user-marker')
    console.log(address)
    new mapboxgl.Marker(custom)
      .setLngLat([address.lng, address.lat])
      .addTo(this.map);
  }

  fitMapToMyLocation() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

}