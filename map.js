var mymap;

function initMap(){
    mymap= L.map('map').fitWorld({animate:false});
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	minZoom: 1,
	maxZoom: 19,
	attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(mymap);
  }


initMap();

let layer = L.featureGroup();

fetch('map.php', {
	method: 'post',
  })
  .then(r => r.json())
  .then(r => {
	console.log(r)
	r.forEach(element => {
		console.log(parseFloat(element.latitude));
		if (element.visible == 1){
			var ico = L.icon({iconUrl : element.icone, iconAnchor : [76,189], popupAnchor : [0,-175]});
			var mark = L.marker([parseFloat(element.latitude), parseFloat(element.longitude)],{icon: ico});
			mark.bindPopup(element.indice);
			layer.addLayer(mark);
		}
			
	});
  })

  mymap.addLayer(layer);