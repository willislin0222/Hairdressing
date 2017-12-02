function showMap(){
	var myPosition = new google.maps.LatLng(24.992903,121.301060);
	console.log(myPosition);
	var options={
		zoom:18,
		center:myPosition,
		mapTypeId:google.maps.MapTypeId.ROADMAP
	};

	var map = new google.maps.Map(document.getElementById("myMap"),options);

	var marker = new google.maps.Marker({
		position:myPosition,
		map:map,
		icon:'images/dgtp.gif',
		title:'桃園市桃園區縣府路1號'
	});

}


window.addEventListener('load',showMap,false);
