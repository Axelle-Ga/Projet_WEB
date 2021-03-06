<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title>Retrouvez le meurtrier</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" media="screen" href="style.css">
    <link rel="icon" type="image/png" href="img/favicon.png">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
  integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
  crossorigin=""/>
  <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
  integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
  crossorigin=""></script>
  <script src="https://kit.fontawesome.com/aed932af5e.js" crossorigin="anonymous"></script>
  </head>

  <body>
    <a href="index.php" title="Accueil"><i id = "home" class="fas fa-home"></i></a>
    <div class="jeu">
      <h2 id="titre_jeu">L'affaire Müller</h2>
      <div id = map></div>
      <div id = "sac">
          <div class = "poche" id = "poche1"></div>
          <div class = "poche" id = "poche2"></div>
          <div class = "poche" id = "poche3"></div>
          <div class = "poche" id = "poche4"></div>
      </div>
      <div id = 'timer'>
        <span id = "temps" style="font-size: 2.5rem;">
          <span style="color: #FB8500;">
            <i class="fas fa-stopwatch"></i>
          </span>
          <span id = 'chrono'>0:0:0</span>
        </span>
      </div>
    </div>

    <div style="display:none">
      <audio loop="true" autoplay="true" controls>
        <source src="music/POL-desert-temple-short.mp3" type="audio/mpeg">
        <source src="music/POL-desert-temple-short.waw" type="audio/wav">
      </audio>
    </div>
    
    <script type="text/javascript" src="map.js"></script>
  </body>