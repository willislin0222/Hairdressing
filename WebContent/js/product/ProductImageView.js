var i

function renderImageFile1() {  
		file = this.files[0];
		var imgReader = new FileReader();
		imgReader.onload = function () {
			var show = document.createElement("img");
			var imageURL = event.target.result;
			show.name="img";
			show.id="imgView"
			show.src=imageURL;
			var imageView=document.getElementById("imageView1");
			while(imageView.childNodes.length >=1){
				imageView.removeChild(imageView.firstChild);				
			}
			imageView.appendChild(show);
			   
		};

		imgReader.readAsDataURL(file);
}

function renderImageFile2() {  
	
	file = this.files[0];
	var imgReader = new FileReader();
	imgReader.onload = function () {
		var show = document.createElement("img");
		var imageURL = event.target.result;
		show.name="img";
		show.id="imgView"
		show.src=imageURL;
		var imageView=document.getElementById("imageView2");
		while(imageView.childNodes.length >=1){
			imageView.removeChild(imageView.firstChild);				
		}
		imageView.appendChild(show);
		   
	};

	imgReader.readAsDataURL(file);
}

function renderImageFile3() {  
	
	file = this.files[0];
	var imgReader = new FileReader();
	imgReader.onload = function () {
		var show = document.createElement("img");
		var imageURL = event.target.result;
		show.name="img";
		show.id="imgView"
		show.src=imageURL;
		var imageView=document.getElementById("imageView3");
		while(imageView.childNodes.length >=1){
			imageView.removeChild(imageView.firstChild);				
		}
		imageView.appendChild(show);
		   
	};

	imgReader.readAsDataURL(file);
}

function renderImageFile4() {  
	
	file = this.files[0];
	var imgReader = new FileReader();
	imgReader.onload = function () {
		var show = document.createElement("img");
		var imageURL = event.target.result;
		show.name="img";
		show.id="imgView"
		show.src=imageURL;
		var imageView=document.getElementById("imageView4");
		while(imageView.childNodes.length >=1){
			imageView.removeChild(imageView.firstChild);				
		}
		imageView.appendChild(show);
		   
	};

	imgReader.readAsDataURL(file);
}


function init(){
	  var files = document.getElementsByName("fileUpload");
	  
	  files[0].addEventListener("change",renderImageFile1,false);
	  files[1].addEventListener("change",renderImageFile2,false);
	  files[2].addEventListener("change",renderImageFile3,false);
	  files[3].addEventListener("change",renderImageFile4,false);
}

window.addEventListener("load",init,false);
	