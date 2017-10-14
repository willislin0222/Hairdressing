function showMap(){
	var myPosition = new google.maps.LatLng(25.022009,121.29373280000004);
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
		title:'台灣桃園市桃園區莊一街80號'
	});

}


window.addEventListener('load',showMap,false);
