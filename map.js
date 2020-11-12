var mymap;
/* initMap met en place le fond de carte en spécifiant les limites de zooms possibles et,
bien entendu, la source du fond de carte désiré, ici, OpenStreetMap. */
function initMap(){
    mymap= L.map('map').setView([47.862453,13.1258962],12);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	minZoom: 1,
	maxZoom: 19,
	attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(mymap);
  }


initMap();

/* Ici, on récupère le fichier php et on analyse la base de données des objets pour leur affichage dans la couche layer. */
let layer = new L.featureGroup();

var objets;

fetch('map.php', {
	method: 'post',
  })
  .then(r => r.json())
  .then(r => {
	console.log(r)
	objet=r;
	r.forEach(element => {
		var ico = L.icon({iconUrl : element.icone, iconAnchor : [76,189], popupAnchor : [0,-175]}); /* Récupération de l'icône et ancrage. */
		var mark = L.marker([element.latitude, element.longitude],{icon: ico}); /* Placement de l'icône. */
		mark.bindPopup(element.indice);
		layer.addLayer(mark);		
	});
  })


  mymap.on("zoomend",onZoom);

  function onZoom(event){
	if (mymap.getZoom()<5){
		console.log(mymap.getZoom());
		layer.remove();
	}
	else if (mymap.getZoom()>=5){
		console.log(mymap.getZoom());
		mymap.addLayer(layer);
	}
  }

  layer.on("click", onClick);

  function onClick(event){
	console.log("salut");  		
  }


  
