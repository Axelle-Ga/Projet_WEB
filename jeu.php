<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title>Retrouvez le meurtrier</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" media="screen" href="style.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
  integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
  crossorigin=""/>
  <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
  integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
  crossorigin=""></script>
  <script src="https://kit.fontawesome.com/aed932af5e.js" crossorigin="anonymous"></script>
  </head>

  <body>
    <div class="jeu">
      <h2>GéoEscape</h2>
      <div id = map></div>
      <div id = "sac">
          <div class = "poche"></div>
          <div class = "poche"></div>
          <div class = "poche"></div>
          <div class = "poche"></div>
      </div>
      <div id = 'timer'>
        <span id = "temps" style="font-size: 2.5rem;">
          <span style="color: #FB8500;">
            <i class="fas fa-stopwatch"></i>
          </span>
          <span id = 'chrono'>00:00:00</span>
        </span>
      </div>
    </div>
    <script type="text/javascript" src="map.js"></script>
  </body>