let nom_rang=['r1','r2','r3','r4','r5'];
let rang=[];
for (var i = 0; i<nom_rang.length;i++){
  rang.push(document.getElementById(nom_rang[i]));
};
fetch('scoreboard.php', {
    method: 'post',
  })
  .then(r => r.json())
  .then(r => {
        for (var i = 0; i<r.length;i++) {
            rang[i].innerHTML=r[i].username+' '+r[i].time;
        };
    })
