import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

/* This code is needed to properly load the images in the Leaflet CSS */
delete L.Icon.Default.prototype._getIconUrl

L.Icon.Default.mergeOptions({
  iconRetinaUrl: require('leaflet/dist/images/marker-icon-2x.png'),
  iconUrl: require('leaflet/dist/images/marker-icon.png'),
  shadowUrl: require('leaflet/dist/images/marker-shadow.png'),
})

function initMap() {
  const mapDiv = document.querySelector('#map')

  if (!mapDiv) return

  const map = L.map(mapDiv)
  const latitude  = mapDiv.dataset.latitude
  const longitude = mapDiv.dataset.longitude
  const defaultCenter = [latitude, longitude]
  const defaultZoom = 15
  const basemap = L.tileLayer('https://cartodb-basemaps-{s}.global.ssl.fastly.net/rastertiles/voyager/{z}/{x}/{y}{r}.png', {
	  attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> &copy; <a href="http://cartodb.com/attributions">CartoDB</a>',
	  subdomains: 'abcd',
	  maxZoom: 19
  })
  const marker = L.marker(defaultCenter)

  map.setView(defaultCenter, defaultZoom)
  map.scrollWheelZoom.disable()
  map.addEventListener('focus', function() {
    map.scrollWheelZoom.enable()
  })
  map.addEventListener('blur', function() {
    map.scrollWheelZoom.disable()
  })
  basemap.addTo(map)
  marker.addTo(map).bindPopup('Mindful Life Therapy')
}

document.addEventListener('turbolinks:load', initMap)
