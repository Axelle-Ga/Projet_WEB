<?php
$link = mysqli_connect('localhost', 'root', 'root', 'objet');

if($result = mysqli_query($link, 'SELECT * FROM tbl_objet')){
    
    while($pinpoint = mysqli_fetch_assoc($result)) {
        
        $all_pinpoint[]=$pinpoint;
    }
}
else {
    echo("La connexion a échoué...");
}

echo json_encode($all_pinpoint);

?>