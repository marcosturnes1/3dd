function iniciar() {
	 window.location.href = 'skp:inicio@' + "iniciar";
	 };
function dragModel(e){
	// If we're on a Mac, we need a callback to Ruby to import the model.
	// If on Windows, the drag-n-drop of the href will import it.
	window.location.href = 'skp:get_t@'+'dragModel';
	if( navigator.platform.indexOf('Mac') > -1 ){
		callback(e.target.name);
	}
	};
function callback(name, data) {
	// Defer with a timer in order to allow the UI to update.
	window.location.href = 'skp:get_t@'+'callback';
	setTimeout(function() {
		window.location = "skp:objetos@" + name;
	}, 0);
	};
function toogle(id) {
		window.location = "skp:teste@script.js toggle id "+id;
		var x = document.getElementById(id);
	 
		if (x.style.display === 'none') {
				x.style.display = 'block';
		} else {
				x.style.display = 'none';
		}
		if (id=="id|div|Pagina"){
		var input = document.getElementById("id|input|Criar|Legenda");
		input.setAttribute("value","");
		var y = document.getElementById("id|div|Legenda");
			if (!y.style.display !== 'none') {
				y.style.display = 'none';
		}
		
		}
		if ((id=="id|div|Legenda")||(id=="id|div|Pagina")){
		var input = document.getElementById("id|input|Criar|Button");
		input.setAttribute("value","");
		var w = document.getElementById("id|div|Button");
			if (!w.style.display !== 'none') {
				w.style.display = 'none';
		}
		
		}
		if ((id=="id|div|Button")||(id=="id|div|Legenda")||(id=="id|div|Pagina")){
		var input = document.getElementById("id|input|Criar|Arquivo");
		input.setAttribute("value","");
		var z = document.getElementById("id|div|Arquivo");
			if (z.style.display !== 'none') {
			 z.style.display = 'none';       
		}
		}
		};
function setthumbnail(path){
	window.location = "skp:teste@script.js toggle id "+id;    

		document.getElementById("id|img|Criar").src=path;
		document.getElementById("id|img|thumbnail").src=path;
		// sleep(2000);
		// window.location.href = 'skp:get_t@' +"setthumbnail  ________________________ ";
		};
function paginas(str) {
	 window.location.href = 'skp:paginas@' + str;
	 };





//estao em testes
function getmat(action) {
	window.location.href = 'skp:teste@script.js getmat action' + action;
	};
function getdisplay(str) {
	window.location.href = 'skp:teste@script.js getdisplay str'+str ;
	};