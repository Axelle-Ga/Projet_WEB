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

  var url = window.location.href;
  url = url.replace("jeu.php?","");
  console.log(url);

//on va créer la carte de base en récupérant les objets dans la base de donnée
fetch('map.php', {
	method: 'post',
  })
  .then(r => r.json())
  .then(r => {
	var layer = new L.featureGroup();
	var objets=r;
	var zoomMin = [];
	var visible = [];
	var id = [];
	var utilise = [];
	console.log(r)
	initMap();
	r.forEach(element => {
		var ico = L.icon({iconUrl : element.icone, iconAnchor : [76,189], popupAnchor : [0,-175], id : element.id}); /* Récupération de l'icône et ancrage. */
		var mark;
		/* Placement de l'icône. */
		mark = L.marker([element.latitude, element.longitude],{icon: ico}, {title :element.nom}); 

		mark.bindPopup(element.indice);
		
		layer.addLayer(mark);
		id.push(url+element.icone);
		zoomMin.push(element.minZoom);
		visible.push(element.visible);
		utilise.push(0);
		if(element.visible == 1){
			mark.addTo(mymap);
		}
		
	});

	layer.on("click", function() {onClick(event, visible,layer, objets, id, zoomMin, utilise )});
	mymap.addEventListener("zoomend",function() {onZoom(mymap,zoomMin,visible,layer, objets,id)},true);

  })


  function onZoom(mymap, zoomMin,visible, layer, objets,id,){
	//en fonction du zoom de la carte les marker sont affichés ou non

	//On récupère les couches
	var displayed = layer.getLayers();
	//Pour chaque couche on reagrde si elle doit être affichée ou non
	for (var i = 0 ; i < displayed.length ; i++){

		//Si a couche i est affichée mais que le zoom est trop petit
		if (mymap.hasLayer(displayed[i]) && mymap.getZoom()<zoomMin[i]){
			//On enlève la couche
			mymap.removeLayer(displayed[i]);
		}

		//Si la couche n'est pas affichée alors qu'elle doit l'être (zoom et visbilité ok)
		else if (!(mymap.hasLayer(displayed[i])) && (mymap.getZoom()>=zoomMin[i]) && visible[i]==1){
			//On rajoute la couche
			displayed[i].addTo(mymap);
		}
	}
  }


  function onClick(event, visible, layer, objets, id, zoomMin, utilise){
	
	var displayed = layer.getLayers();

	var url = event.target.src;
	var num = id.indexOf(url);
	console.log(num);
	console.log(id);
	console.log(objets);
	console.log(event.target.src)

	/*var music = new Audio(objets[num].music);
	music.load();
	music.play();*/

	//objet basique qui libère le suivant mais reste sur la carte
	if (objets[num].type ==1) {
		if (utilise[num]==0) {
			visible[num+1]=1;
			if (!(mymap.hasLayer(displayed[num+1])) && (mymap.getZoom()>=zoomMin[num+1]) && visible[num+1]==1){
				displayed[num+1].addTo(mymap);
			}
			utilise[num]=1;
		}
	}
	//objets de type coffre-fort à débloquer par code
	else if (objets[num].type ==2){
		//On récupère le formulaire
		var submit = document.getElementById("form");
		//On ajoute un évènement quand on soumet le formulaire
		submit.addEventListener("submit",function(event) {
			event.preventDefault();
			onSubmit(event, objets,num, visible, displayed);});
		//On libère l'objet suivant
		visible[num+1]=1;
		if (!(mymap.hasLayer(displayed[num+1])) && (mymap.getZoom()>=zoomMin[num+1]) && visible[num+1]==1){
		displayed[num+1].addTo(mymap);
		}
	}
	//objet de type récupérable
	else if (objets[num].type ==4){
		visible[num]=0;
		mymap.removeLayer(displayed[num]);

		visible[num+1]=1;
		if (!(mymap.hasLayer(displayed[num+1])) && (mymap.getZoom()>=zoomMin[num+1]) && visible[num+1]==1){
		displayed[num+1].addTo(mymap);
		}

		var poche = document.getElementById("poche1");
		var img = document.createElement("img");
		img.src=objets[num].icone;
		poche.appendChild(img);

	}
	//objet bloqué par un autre objet
	else if (objets[num].type ==5){
		var poche = document.getElementsByClassName("poche");
		for (var i = 0; i < poche.length; i++) {
			var c = poche[i].childNodes;
			if (poche[i].classList.contains("selection") && c.length>0 && c[0].src == id[num-1]){
				visible[num]=0;
				mymap.removeLayer(displayed[num]);
				visible[num+1]=1;
				if (!(mymap.hasLayer(displayed[num+1])) && (mymap.getZoom()>=zoomMin[num+1]) && visible[num+1]==1){
					displayed[num+1].addTo(mymap);
					}

			}
		}
	}
	//objet dont on ne pourra pas lire le pop-up et qui disparrai après pour laisser place à un autre
	else if (objets[num].type ==6){
		//fin du jeu
	}
  }






  //Ajout d'une sélection sur l'inventaire

  var poche = document.getElementsByClassName("poche");
  for (var i = 0; i < poche.length; i++) {
	  poche[i].addEventListener("click", function() { inventaire(event, poche) });
  }

function inventaire(event, poche){
	//pb quand on clique sur l'image dans la poche ça ne fct pas
	if (event.target.classList.contains("selection")){
		event.target.classList.remove("selection");
	}
	else{
		for (var i = 0; i < poche.length; i++) {
			poche[i].classList.remove("selection");
			event.target.classList.add("selection");
		}
	}
	
}

function onSubmit(event,objets,num, visible, displayed){
	//On empèche la page de se recharger
	event.preventDefault();
	//On récupère la valeur donner par le joueur
	var result = document.getElementById("code").value;

	//Si c'est la bonnne valeur
	if (parseInt(result) == objets[num].code) {
		//On libère l'objet bloqué
		visible[num+3]=1;
		displayed[num+3].addTo(mymap);
		//On enlève le coffre de la map
		visible[num]=0;
		mymap.removeLayer(displayed[num]);	
	}

	//si ce n'est pas le bon code on previent le joueur
	else{
		//On modifie le pop-up pour indiquer l'erreur au jour
		displayed[num].setPopupContent(objets[num].indice+"<p>ERREUR : le code est faux</p>")
		//On remet l'évement sur le submit 
		var submit = document.getElementById("form");
		submit.addEventListener("submit",function(event) { 
			event.stopImmediatePropagation();
			onSubmit(event, objets,num, visible, displayed);
			});
	}
}
	