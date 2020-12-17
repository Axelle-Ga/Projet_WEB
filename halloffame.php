<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <title>EscapeGame géographique</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" media="screen" href="style.css">
    <link rel="stylesheet" media="screen" href="menu.css">
    <link rel="icon" type="image/png" href="img/favicon.png">
    <script src="https://kit.fontawesome.com/aed932af5e.js" crossorigin="anonymous"></script>
  </head>

  <header>
    <ul>
      <li><a href="index.php" title="Accueil"><i class="fas fa-home"></i></i></a></li>
      <li><a href="halloffame.php">Score</a></li>
      <li><a href="apropos.php">À propos</a></li>
    </ul>
  </header>

  <body>
    <div class="cadreContainer">
      <div class = "cadre">
        <h1>L'affaire Müller</h1>

        <div class = "hall">
          <h3>Meilleurs scores :</h3>
          <ol>
          <li id="r1"></li>
          <li id="r2"></li>
          <li id="r3"></li>
          <li id="r4"></li>
          <li id="r5"></li>
        </ol>
        </div>
      </div>
    </div>
  <script src="score.js"></script>
  </body>
