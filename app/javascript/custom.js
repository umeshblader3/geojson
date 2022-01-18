// alert("hi")
var map = L.map('map').setView([51.505, -0.09], 13);
L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoidW1lc2hibGFkZXIiLCJhIjoiY2t5aXI1N3JpMWR0azJ2cG1meXNrYzZhNCJ9.OEBYPKj3qzhl7wQsyRa11A', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoidW1lc2hibGFkZXIiLCJhIjoiY2t5aXI1N3JpMWR0azJ2cG1meXNrYzZhNCJ9.OEBYPKj3qzhl7wQsyRa11A'
}).addTo(map);

var geojsonFeature = {
  "type": "Feature",
  "properties": {},
  "geometry": {
    "type": "Point",
    "coordinates": [
      51.505,
      -0.09
    ]
  }
};

L.geoJSON(geojsonFeature).addTo(map);

var popup = L.popup();

function onMapClick(e) {
    popup
        .setLatLng(e.latlng)
        .setContent("You clicked the map at " + e.latlng.toString())
        .openOn(map);
    document.getElementById("lattitude").value = e.latlng.lat
    document.getElementById("longitude").value = e.latlng.lng
    // $("#lattitude").val(e.latlng.lat)
}

map.on('click', onMapClick);