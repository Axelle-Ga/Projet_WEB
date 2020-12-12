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

<?php
$link = mysqli_connect('localhost', 'root', 'root', 'highscore');

if(isset($_POST['submit'])){
    if (!empty($_POST['username'])) {
        $username = $_POST['username'];
        $time = '00:00:00';

        $requete = "insert into scores(username,time) values('$username', '$time')";

        $run = mysqli_query($link,$requete) or die(mysqli_error());

    }
}
else {
    echo("La connexion a échoué...");
}


?>

<body>
    <div class="cadreContainer">
      <div class = "cadre">
        <h1> <?php echo($username); ?></h3>
        <p>Votre temps : <?php echo($time);?></p>
      </div>
    </div>
    <img class="madame" src="img/madame.png">
  </body>