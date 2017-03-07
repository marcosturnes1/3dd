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
function toggle(id) {
	window.location = "skp:teste@script.js toggle id "+id;
	var id_block=[];

	switch(id) {
    case 'id|div|Layer':
        	id_block.push(id)
        break;
    case 'menu':
        id_block.push(id)
        break;       
    default: 
    	var pai=document.getElementById(id).parentElement;
    	var id_pai=pai.getAttribute("id");
    	var filho= pai.children; 
		for (var i = 0; i < filho.length; i++) {			
			var id_filho=filho[i].getAttribute("id");
			var arr=id_filho.split("|")
		    	if (!((arr[1]=="h2")||(arr[1]=="a")||(arr[1]=="div1")||(arr[1]=="fieldset"))){
		    		id_block.push(id_filho)
			    }
		    }//for
		}//case		

		for (var i = 0; i < id_block.length; i++) {	

			if (id_block[i]==id){				
				var ele=document.getElementById(id_block[i])				
				if ((ele.style.display=="none")||(ele.style.display=="")){		
					ele.style.display='block';
				}else{ele.style.display='none';}
			}else{				
				var ele=document.getElementById(id_block[i])
								
				ele.style.display='none';
			}
			}//for
		window.location = "skp:teste@_________________________________________";
		};
function setthumbnail(path){
	window.location = "skp:teste@script.js toggle id "+id;    

		document.getElementById("id|img|Criar").src=path;
		document.getElementById("id|img|thumbnail").src=path;
		// sleep(2000);
		// window.location.href = 'skp:get_t@' +"setthumbnail  ________________________ ";
		};
function digito(id){
		var input = document.getElementById(id);
		var valor = input.innerHTML
		window.location.href = 'skp:digito@' + id;
		};
function img(action) {
	window.location.href = 'skp:img@' + action;
	};		
function material(str){
			window.location.href = 'skp:material@' + str;
			};	
function thumbnail(str){
			window.location.href = 'skp:thumbnail@' + str;
			};
