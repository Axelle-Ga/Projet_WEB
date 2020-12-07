<?php
$link = mysqli_connect('localhost', 'root', 'root', 'highscore');

if($result = mysqli_query($link, 'SELECT * FROM scores ORDER BY time ASC LIMIT 5')){

    while($pinpoint = mysqli_fetch_assoc($result)) {

        $all_pinpoint[]=$pinpoint;
    }
}
else {
    echo("La connexion a échoué...");
}

echo json_encode($all_pinpoint, JSON_NUMERIC_CHECK);

?>
