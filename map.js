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


/* Ici, on récupère le fichier php et on analyse la base de données des objets pour leur affichage dans la couche layer. */




fetch('map.php', {
	method: 'post',
  })
  .then(r => r.json())
  .then(r => {
	var layer = new L.featureGroup();
	var objets=r;
	var zoomMin = [];
	var visible = [];
	console.log(r)
	initMap();
	r.forEach(element => {
		var ico = L.icon({iconUrl : element.icone, iconAnchor : [76,189], popupAnchor : [0,-175]}); /* Récupération de l'icône et ancrage. */
		var mark = L.marker([element.latitude, element.longitude],{icon: ico}, {title :element.nom}); /* Placement de l'icône. */
		mark.bindPopup(element.indice);
		
		layer.addLayer(mark);
		zoomMin.push(element.minZoom);
		visible.push(element.visible);
		if(element.visible == 1){
			mark.addTo(mymap);
		}
		
	});
	layer.addEventListener("click", function() {onClick(event, visible,layer)});
	mymap.addEventListener("zoomend",function() {onZoom(mymap,zoomMin,visible,layer)},true);
	
  })


  function onZoom(mymap, zoomMin,visible, layer){
	var displayed = layer.getLayers();
	console.log(mymap.getZoom());
	for (var i = 0 ; i < displayed.length ; i++){
		if (mymap.hasLayer(displayed[i]) && mymap.getZoom()<zoomMin[i]){
			mymap.removeLayer(displayed[i]);
		}
		else if (!(mymap.hasLayer(displayed[i])) && (mymap.getZoom()>=zoomMin[i]) && visible[i]==1){
			displayed[i].addTo(mymap);
		}
	}
  }


  function onClick(event, visible, layer){
	visible[1]=1;
	console.log(visible);	
  }


  
