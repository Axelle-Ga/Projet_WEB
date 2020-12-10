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

var util = new Object;

//On récupère l'url courante pour l'utiliser lors d'évènement
var url = window.location.href;
url = url.replace("jeu.php?","");

//On definit l'élement dragged pour le drag n drop des objets récupérable
var draggedItem;

//on va créer la carte de base en récupérant les objets dans la base de donnée
fetch('map.php', {
	method: 'post',
  })
  .then(r => r.json())
  .then(r => {
	//Création d'un feature group dans lequel on va mettre les marker représentant les objets
	var layer = new L.featureGroup();

	var objets=r;
	var zoomMin = [];
	var visible = [];
	var id = [];
	var utilise = [];
	var tentative = [];

	//On initialise la carte
	initMap();

	r.forEach(element => {
		/* Récupération de l'icône et ancrage. */
		var ico = L.icon({iconUrl : element.icone, iconSize:[element.taille_x, element.taille_y],iconAnchor : [element.taille_x/2,element.taille_y], popupAnchor : [0,-(element.taille_y+5)], id : element.id});
		var mark;
		//On crée le marker associé à l'objet
		mark = L.marker([element.latitude, element.longitude],{icon: ico}, {title :element.nom}); 
		//On associe un popup au marker
		mark.bindPopup(element.texte,{
			className: 'stylePopup'
		  });
		//On ajoute le marker à la couche
		layer.addLayer(mark);

		//On ajoute l'id du marker au tableau id
		id.push(url+element.icone);
		//On ajoute le zoom minimal de visualisation au tableau zoomMin
		zoomMin.push(element.minZoom);
		//On ajoute le statue de visibilité (0 si invisible 1 sinon) au tableau visible
		visible.push(element.visible);
		//On ajoute 0 au tableau utilise pour indiquer que l'objet n'a pas encore été utlisé
		utilise.push(0);

		tentative.push(0);

		//Si l'objet est visible on l'ajoute à la carte
		if(element.visible == 1){
			mark.addTo(mymap);
		}

	});

	util.objets = objets;
	util.layer =layer;
	util.id = id;
	util.zoomMin = zoomMin;
	util.visible= visible;
	util.utilise = utilise;
	util.tentative=tentative;

	//On ajoute l'intéraction avec les markers
	layer.on("click", function() {onClick(event, visible,layer, objets, id, zoomMin, utilise, tentative )});
	//On ajoute l'eventListener qui permet de faire apparaitre ou disparaitre les marker en fonction du niveau de zoom
	mymap.addEventListener("zoomend",function() {onZoom(mymap,zoomMin,visible,layer, objets,id)},true);

	/*mymap.addEventListener("popupopen",function() {openPopup(event, visible,layer, objets,id, tentative)},true);
*/
	mymap.addEventListener("popupclose",function() {closePopup(event, visible,layer, objets,id, tentative)},true);

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


  function debloque(objets, visible, zoomMin, num, displayed){
	//Debloque l'objet à débloquer

	//Rend l'objet à débloquer visible
	visible[objets[num].debloque]=1;

	//Ajoute à la carte l'objet à débloquer si il faut
	if (!(mymap.hasLayer(displayed[objets[num].debloque])) && (mymap.getZoom()>=zoomMin[objets[num].debloque]) && visible[objets[num].debloque]==1){
		displayed[objets[num].debloque].addTo(mymap);
	}
  }


 /* function openPopup(event,visible,layer, objets,id, tentative) {
	  
	var displayed = layer.getLayers();

	var url = event.target.src;
	var num = id.indexOf(url);

	//Si le popup contient un bouton indice
	if (document.getElementsByClassName("bouton_indice")[0]) {
			console.log(document.getElementsByClassName("bouton_indice"));
			var bouton = document.getElementsByClassName("bouton_indice")[0];

			//Quand on clique sur le bouton on rajoute l'indice dans le popup et on supprime le bouton
			bouton.addEventListener("click", debloque_indice);
	}
  }*/

  function closePopup(event,visible,layer, objets,id) {
	var displayed = layer.getLayers();

	var url = event.target.src;
	var num = id.indexOf(url);
	console.log(event);

	if (document.getElementsByClassName("bouton_indice")[0]) {
		console.log("true");
		var bouton = document.getElementsByClassName("bouton_indice")[0];
		//Quand on clique sur le bouton on rajoute l'indice dans le popup et on supprime le bouton
		bouton.removeEventListener("click",debloque_indice);
		console.log("removed event");
  	}
}



  function onClick(event, visible, layer, objets, id, zoomMin, utilise, tentative){
	
	var displayed = layer.getLayers();

	var url = event.target.src;
	var num = id.indexOf(url);

	//Si le popup contient un bouton indice
	if (document.getElementsByClassName("bouton_indice")[0]) {
			console.log(document.getElementsByClassName("bouton_indice"));
			var bouton = document.getElementsByClassName("bouton_indice")[0];

			//Quand on clique sur le bouton on rajoute l'indice dans le popup et on supprime le bouton
			bouton.addEventListener("click", debloque_indice);
	}

	/*var music = new Audio(objets[num].music);
	music.load();
	music.play();*/

	//objet basique qui libère le suivant mais reste sur la carte
	if (objets[num].type ==1) {
		if (utilise[num]==0) {
			debloque(objets, visible, zoomMin, num, displayed);
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
			onSubmit(event, objets,num, visible, displayed, tentative);});
		//On libère l'objet suivant
		debloque(objets, visible, zoomMin, num, displayed);
	}

	//objet de type récupérable
	else if (objets[num].type ==4){
		

		var inventaire = document.getElementsByClassName("poche");
		console.log(inventaire.length);
		for (var i = 0; i<inventaire.length; i++){
			console.log(inventaire[i]);
			if (inventaire[i].childNodes.length==0) {

				visible[num]=0;
				mymap.removeLayer(displayed[num]);

				//On libère l'objet suivant
				debloque(objets, visible, zoomMin, num, displayed);
				
				//On rajoute l'objet dans l'inventaire
				var img = document.createElement("img");
				img.src=objets[num].icone;
				img.style.maxHeight = "80px"; //trouver un moyen de mettre ça en pourcentage de la taille de la div pour s'adapter aux =! écrans
				img.draggable= true;
				inventaire[i].appendChild(img);

				img.addEventListener("click", function () {
					selection(img);
				})

				//On ajoute de eventListener pour pouvoir déplacer les objets dans l'inventaire
				img.addEventListener("dragstart",function () {
					draggedItem = img;
					setTimeout(() => {
						draggedItem.style.display = "none";
					}, 0);
				})
				img.addEventListener("dragend", function () {
					setTimeout(() => {
						draggedItem.style.display = "block";
						draggedItem = null;
					}, 0);					
				})

				//On casse la boucle car l'objet est ajouté à l'inventaire
				break;
			}
		}
	}

	//objet bloqué par un autre objet de type aéroport
	else if (objets[num].type ==5){
		var poche = document.getElementsByClassName("poche");
		for (var i = 0; i < poche.length; i++) {
			var c = poche[i].childNodes;
			if (poche[i].classList.contains("selection") && c.length>0 && c[0].src == id[num-1]){
				poche[i].removeChild(poche[i].firstChild);
				poche[i].classList.remove("selection");
				visible[num]=0;
				mymap.removeLayer(displayed[num]);
				//On libère l'objet suivant
				debloque(objets, visible, zoomMin, num, displayed);
				//Change la vue de la map quand on prend l'avion
				mymap.setView([objets[objets[num].debloque].latitude,[objets[objets[num].debloque].longitude]],objets[objets[num].debloque].minZoom);

			}
		}
	}

	//objet dont on ne pourra pas lire le pop-up et qui disparrai après pour laisser place à un autre
	else if (objets[num].type ==6){
		//fin du jeu
	}
  }

//Debloque l'indice quand on clique sur le bouton indice
  function debloque_indice() {
	var objets = util.objets;
	var layer = util.layer;
	var id = util.id;
	var zoomMin = util.zoomMin;
	var visible = util.visible;
	var utilise = util.utilise;
	var tenatative = util.tentative;

	console.log("dans la fonction debloque indice");
	//On change le texte du popup
	displayed[num].setPopupContent(objets[num].texte.replace("<p id ='indice_texte' style='text-align:center;'><button class = 'bouton_indice'>Indice</button> </p>" ,"")+objets[num].indice)
	//Si le popup contient un submit on met un eventlistener dessus
	if (document.getElementById("form")) {
		console.log("submit dans le debloque indice");
		var submit = document.getElementById("form");
		submit.addEventListener("submit",function(event) { 
			//On empèche la page de se recharger
			event.stopImmediatePropagation();
			onSubmit(event, objets,num, visible, displayed, tentative);
			});
	}

}



  //Ajout d'une sélection sur l'inventaire et d'un drag n drop

  var poche = document.getElementsByClassName("poche");
  for (var i = 0; i < poche.length; i++) {
	//
	  poche[i].addEventListener("dragover",function (event) {
			event.preventDefault();		  
	  })
	  //On modifie le style de la poche quand on entre dedans
	  poche[i].addEventListener("dragenter",function (event) {
		event.preventDefault();	
		this.classList.add("selection2");
	  })

	  //On revient au style de base quand on sort de la poche
	  poche[i].addEventListener("dragleave", function () {
		if (this.classList.contains("selection")) {
			this.classList.remove("selection");
		}
		this.classList.remove("selection2");		  
	  })
	  
	  //On drop l'objet dans la poche si elle est vide
	  poche[i].addEventListener("drop", function (event) {
		  	//On previent le default event sinon ça ouvre l'image dans firefox
			event.preventDefault();
			//On drop l'élément
			if (this.childNodes.length==0) {
			this.appendChild(draggedItem);
			}
			this.classList.remove("selection2");		  
	  })
  }


//Fonction de sélection à supprimer quand le drag n drop fonctionnera
function selection(img){
	//Ne fct que si on clique sur l'image
	if (img.parentElement.classList.contains("selection")){
		img.parentElement.classList.remove("selection");
	}
	else{
		for (var i = 0; i < poche.length; i++) {
			poche[i].classList.remove("selection");
		}
		img.parentElement.classList.add("selection");
	}
	
}

function onSubmit(event,objets,num, visible, displayed, tentative){
	//On empèche la page de se recharger
	event.preventDefault();
	//On récupère la valeur donner par le joueur
	var result = document.getElementById("code").value;

	//Si c'est la bonnne valeur
	if (parseInt(result) == objets[num].code) {
		//On libère l'objet bloqué
		visible[objets[num].code_debloque]=1;
		displayed[objets[num].code_debloque].addTo(mymap);
		//On enlève le coffre de la map
		visible[num]=0;
		mymap.removeLayer(displayed[num]);	
	}

	//si ce n'est pas le bon code on previent le joueur
	else if (tentative[num] ==0){
		//On modifie le pop-up pour indiquer l'erreur au jour
		var content = displayed[num].getPopup().getContent();
		displayed[num].setPopupContent(content +"<p>ERREUR : le code est faux</p>")
		//On remet l'évement sur le submit 
		var submit = document.getElementById("form");
		submit.addEventListener("submit",function(event) { 
			//On empèche la page de se recharger
			event.stopImmediatePropagation();
			onSubmit(event, objets,num, visible, displayed, tentative);
			});

		if (document.getElementsByClassName("bouton_indice")[0]) {
			console.log("true");
			var bouton = document.getElementsByClassName("bouton_indice")[0];
			//Quand on clique sur le bouton on rajoute l'indice dans le popup et on supprime le bouton
			bouton.addEventListener("click", function () { debloque_indice(objets, num,displayed,visible,tentative)});
		}

		tentative[num] = 1;
	}
}
	