let rang=[r1,r2,r3,r4,r5];
fetch('scoreboard.php', {
	method: 'post',
  })
  .then(r => r.json())
  .then(r => {
		r.forEach(element => {
			console.log("salut");
		})
