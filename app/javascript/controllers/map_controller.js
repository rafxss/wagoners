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
      // console.log(this.map)
      // this.map.resize()

      // this.map.on('load', (event) => {
        //   this.map.resize();
        //   console.log('resizing')
        // });

      this.toggleVisibility('map-container')
      this.toggleVisibility('offers-container')
      // this.speedyRafa()
      // console.log('Map toggler')
    })

    // const flyToButon = document.getElementById('flyToButton')
    // flyToButon.addEventListener('click', (event) => {
    //   this.setNewMapCenter();
    //   });

  }

  initMapbox() {
    if (this.mapTarget) { // only build a map if there's a div#map to inject into
      mapboxgl.accessToken = this.mapTarget.dataset.mapboxApiKey;
      this.address = JSON.parse(this.mapTarget.dataset.address)[0]; // Getting lat/lng from controller
      this.offices = JSON.parse(this.mapTarget.dataset.offices)

      this.map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
        zoom: 15
      });

      // console.log(arr)
      this.showUserAddress()
      this.showBrancheOffices()
      this.map.setCenter([this.address.lng, this.address.lat]);
      // this.showCurrentLocation()
      this.fitMap()
      // this.map.scrollZoom.disable()
    }
  }

  showBrancheOffices() {
    this.offices.forEach((office) => {
      const custom = document.createElement('div')
      custom.classList.add('office-marker')
      // console.log(office)
      const popup = new mapboxgl.Popup().setHTML(office.infoWindow); // add this
      new mapboxgl.Marker(custom)
        .setLngLat([office.lng, office.lat])
        .setPopup(popup) // add this
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

  showCurrentLocation() {
    // let currentPos = []
    navigator.geolocation.getCurrentPosition((position) => {
      // console.log(position.coords.latitude, position.coords.longitude)
      // currentPos = [parseFloat(position.coords.latitude).toFixed(3), parseFloat(position.coords.longitude).toFixed(3)]
      const custom = document.createElement('div')
      custom.classList.add('current-marker')
      // console.log(address)
      new mapboxgl.Marker(custom)
        .setLngLat([position.coords.longitude, position.coords.latitude])
        .addTo(this.map);

      this.map.setCenter([position.coords.longitude, position.coords.latitude]);
      this.map.setZoom(14);
    })
    // const address = this.address
    // -12.081561599999999,-76.939264

  }

  fitMap() {
    const bounds = new mapboxgl.LngLatBounds();
    this.offices.forEach(office => bounds.extend([office.lng, office.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
  }

  toggleVisibility(id) {
    const e = document.getElementById(id);
    // console.log(e)
    e.toggleAttribute('hidden')
  }

  // setNewMapCenter(){
  //   const map = this.map
  //   // console.log(this.map)
  //   navigator.geolocation.getCurrentPosition( (position)=> {
  //     console.log(position.coords.latitude, position.coords.longitude)
  //     map.flyTo({
  //       center: [
  //         position.coords.latitude,
  //         position.coords.longitude
  //       ],
  //       essential: true // this animation is considered essential with respect to prefers-reduced-motion

  //     })
  //   })

  // }

}
