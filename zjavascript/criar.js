
function criarselectmat(str_path) {
			var arr=str_path.split("/");
			var comp=arr.length;
			var arq=arr[comp-1];
			var button=arr[comp-2]
			var legenda=arr[comp-3];
			var pg=arr[comp-4];
			var path=arr[comp-5];
			
			if(pg=="Madeiras"){
				var titulo="Materiais Selecionados";
				var selecao=["Tamponamentos","Caixarias","Frentes"];
			}else{
				var titulo=pg+" Selecionados";
				var selecao=[pg];
			}

			var footer=document.getElementById("id|footer|"+pg);
			if (footer==null){ 
			
			var footer=document.createElement("footer");
			footer.setAttribute("class","select");
			footer.setAttribute("id","id|footer|"+pg);
			var pos1=document.getElementById("id|div|"+pg);
			pos1.appendChild(footer);

			var header=document.createElement("header");
			header.setAttribute("class","titulo");
			header.setAttribute("id","id|header|select|"+pg);
			var pos2=document.getElementById("id|footer|"+pg);
			pos2.appendChild(header);

			var h2=document.createElement("h2");
			h2.setAttribute("class","titulo");
			h2.setAttribute("id","id|h2|"+pg);
			h2.innerHTML=titulo;
			var pos3=document.getElementById("id|header|select|"+pg);
			pos3.appendChild(h2);
			}       
			
			for (var i = 0; i < selecao.length; i++) {        
		 
			var divselect=document.getElementById("id|div|"+pg+"|"+selecao[i]);
			if (divselect==null){
			
			var div1=document.createElement("div");
			div1.setAttribute("class","selecao");
			div1.setAttribute("id","id|div|"+pg+"|"+selecao[i]);
			var posicao=document.getElementById("id|footer|"+pg);
			posicao.appendChild(div1);

			var img=document.createElement("img");
			img.setAttribute("src",str_path);
			img.setAttribute("id","id|img|select|"+pg+"|"+selecao[i]);
			img.setAttribute("onclick","selectimgprincipal('id|img|select|"+pg+"|"+selecao[i]+"')");
			img.setAttribute("title", path+"|"+pg+"|"+legenda+"|"+button+"|"+arq);
			var posicao1=document.getElementById("id|div|"+pg+"|"+selecao[i]);
			posicao1.appendChild(img);

			var footer=document.createElement("footer");
			footer.setAttribute("id","id|footer|"+pg+"|"+selecao[i]);
			posicao1.appendChild(footer);

			var h5=document.createElement("h5");
			h5.setAttribute("class","tituloselect");
			h5.innerHTML=selecao[i];
			var posicao2=document.getElementById("id|footer|"+pg+"|"+selecao[i]);
			posicao2.appendChild(h5);

			}//if
			}//for
			};
function setimgprincipal(str_path){
		 var arr=str_path.split("/");
		 var comp=arr.length;
		 var arq=arr[comp-1];
		 var button=arr[comp-2]
		 var legenda=arr[comp-3];
		 var pg=arr[comp-4];
		 var path=arr[comp-5];
		 
		 document.getElementById("id|img|"+pg).src=str_path;
		 document.getElementById("id|img|"+pg).title=path+"|"+pg+"|"+legenda+"|"+button+"|"+arq;

		 };
function selectimgprincipal(id){
	var arr=id.split("|");
	var comp=arr.length;
	var pg=arr[comp-2];

	var img_p=document.getElementById("id|img|"+pg)
	var srcimg=img_p.getAttribute("src");
	var title=img_p.getAttribute("title");

	document.getElementById(id).src=srcimg;
	document.getElementById(id).title=title;

	window.location.href = 'skp:update@' + title;
	};
function update(ele){
	window.location.href = 'skp:update@' + ele;
	};
function getmat(action) {
	window.location.href = 'skp:get_m@' + action;
	};
function getdisplay(str) {
	window.location.href = 'skp:get_display@'+str ;
	};

function adddropdown(arr){
		var pg = arr[1];
		var li = arr[0];
		switch(pg) {
		case "Layer":
				var id = "sup"; 
				var id1 ="id|input|Menu|Layer";
				break;
		case "Pagina":
				var id = "id|div|Criar";
				var id1 = "id|input|Criar|Pagina";
				break;
		case "Legenda":
				var id = "id|div|Criar";
				var id1 = "id|input|Criar|Legenda";
				break;
		case "Button":
				var id = "id|div|Criar";
				var id1 = "id|input|Criar|Button";
				break;    
		case "Arquivo":
				var id = "id|div|Criar";
				var id1 = "id|input|Criar|Arquivo";
				break;    
		}
		var layer1=document.getElementById("id|div|"+pg);
		var div=document.createElement("div");
		if (layer1==null){ 
		var div=document.createElement("div");
		div.setAttribute("id","id|div|"+pg);
		div.setAttribute("class",pg);
		var pospg=document.getElementById(id);
		pospg.appendChild(div);
		}
		var lilayer=document.getElementById("id|li|"+pg+"|"+li);
		if (lilayer==null){
		
		var li1=document.createElement("li");
		li1.setAttribute("id","id|li|"+pg+"|"+li);
		var posdiv=document.getElementById("id|div|"+pg);
		posdiv.appendChild(li1);

		var a=document.createElement("a");
		a.setAttribute("id", 'id|a|'+pg+"|"+li);
		a.setAttribute("onclick","setdropdown('"+id1+"|"+li+"')");
		a.innerHTML=li; 
		var pos1=document.getElementById("id|li|"+pg+"|"+li);
		pos1.appendChild(a);
		}
		 // window.location.href = 'skp:get_t@'+ "criar.js adddropdown  _________________________" ;
		};
function deletedropdown(arr){
	 // window.location.href = 'skp:get_t@'+ "criar.js deletdropdown  "+arr ;
			var pg = arr.pop();
			// window.location.href = 'skp:get_t@'+ "criar.js deletdropdown  pg "+pg+"   arr  "+arr ;
			for (var i = 0; i < arr.length; i++) {

			var pai1=document.getElementById("id|li|"+pg+"|"+arr[i])
			var filho1=document.getElementById('id|a|'+pg+"|"+arr[i]);
			pai1.removeChild(filho1)

			var pai=document.getElementById("id|div|"+pg)
			pai.removeChild(pai1)
		}
			// window.location.href = 'skp:get_t@'+ "criar.js deletdropdown  _________________________" ;
			};
function setdropdown(id_value){
		// window.location.href = 'skp:get_t@'+ "criar.js setdropdown  id_value  "+id_value ;
		var arr = id_value.split("|");
		var id = arr[0]+"|"+arr[1]+"|"+arr[2]+"|"+arr[3];
		var value=arr[4];
		var layer1=document.getElementById(id);
		layer1.setAttribute("value",value)
		//layer1.innerHTML=value;
		var x = document.getElementById("id|div|"+arr[3]);
		x.style.display = 'none';
		if ((arr[3]=="Pagina")||(arr[3]=="Legenda")||(arr[3]=="Button")||(arr[3]=="Faces")||(arr[3]=="Arquivo")){
			 window.location.href = 'skp:update@'+ id_value
		}
		 // window.location.href = 'skp:get_t@'+ "criar.js setdropdown  _________________"
		};
function deletimg(str_path){
			var arr=str_path.split("/");
			var comp=arr.length;
			var arq=arr[comp-1];
			var button=arr[comp-2]
			var legenda=arr[comp-3];
			var pg=arr[comp-4];
			var path=arr[comp-5];
			if (pg=="Img_Objetos"){
				var pai1=document.getElementById("id|div|"+pg+"|"+legenda+"|"+button+"|"+arq)
			var filho1=document.getElementById("id|a|"+pg+"|"+legenda+"|"+button+"|"+arq);
			pai1.removeChild(filho1)

			var pai=document.getElementById("id|div|"+pg+"|"+legenda+"|"+button)
			pai.removeChild(pai1);
			}else{
			var pai1=document.getElementById("id|div|"+pg+"|"+legenda+"|"+button+"|"+arq)
			var filho1=document.getElementById("id|img|"+pg+"|"+legenda+"|"+button+"|"+arq);
			pai1.removeChild(filho1)

			var pai=document.getElementById("id|div|"+pg+"|"+legenda+"|"+button)
			pai.removeChild(pai1);
			}
			};
function criarimg(str_path) {
			var arr=str_path.split("/");
			var comp=arr.length;
			var arq=arr[comp-1];
			var button=arr[comp-2]
			var legenda=arr[comp-3];
			var pg=arr[comp-4];
			var path=arr[comp-5];
		 
			var divimgpg=document.getElementById("id|div|"+pg+"|"+legenda+"|"+button);
			if (divimgpg==null){ 
			if(pg!="Objetos"){
			document.getElementById("id|img|"+pg).src=str_path;
			document.getElementById("id|img|"+pg).title=path+"|"+pg+"|"+legenda+"|"+button+"|"+arq;
			}
			var div3=document.createElement("div");
			div3.setAttribute("class","divimg");
			div3.setAttribute("id","id|div|"+pg+"|"+legenda+"|"+button);
			var pospg=document.getElementById("id|div|"+pg);
			pospg.appendChild(div3);
			}// ck div conteiner imgs
			
			var dimg=document.getElementById("id|div|"+pg+"|"+legenda+"|"+button+"|"+arq);
			if (dimg==null){ 

			var div1=document.createElement("div");
			div1.setAttribute("class","image");
			div1.setAttribute("id","id|div|"+pg+"|"+legenda+"|"+button+"|"+arq);
			// div1.setAttribute("ondragenter","return enter(event)");
			// div1.setAttribute("ondragover","return over(event)");
			// div1.setAttribute("ondrop","return drop(event)");
			var pos=document.getElementById("id|div|"+pg+"|"+legenda+"|"+button);
			pos.appendChild(div1);
			if(pg=="Objetos"){
				var arr_obj=str_path.split("/");
			var arq1=arr_obj.pop();
			var nome=arq1.split(".");
			var nome_arq=nome[0]+".skp";
			var arr_obj1=[];
			for (var i = 0; i < arr_obj.length; i++) {
				if(arr_obj[i]=="Objetos"){arr_obj1.push("Suport_Objetos")
				}else{arr_obj1.push(arr_obj[i])}
			}
			arr_obj1.push(nome_arq)
			var suport = arr_obj1.join("/");
			var a=document.createElement("a");      
			a.setAttribute("id","id|a|"+pg+"|"+legenda+"|"+button+"|"+arq);
				a.setAttribute("href",suport);
				a.setAttribute("name",suport);
				a.setAttribute("ondragstart","dragModel(event)");
				 
			var pos1=document.getElementById("id|div|"+pg+"|"+legenda+"|"+button+"|"+arq);
			pos1.appendChild(a);
			//$("id|a|"+pg+"|"+legenda+"|"+button+"|"+arq).css('background-image', "url('"+str_path+"')");
			document.getElementById("id|a|"+pg+"|"+legenda+"|"+button+"|"+arq).style.backgroundImage="url('"+str_path+"')";
			}else{
			var img=document.createElement("img");
			img.setAttribute("src",str_path);
			img.setAttribute("id","id|img|"+pg+"|"+legenda+"|"+button+"|"+arq);
			img.setAttribute("onclick","setimgprincipal('"+str_path+"')");
			img.setAttribute("title", path+"|"+pg+"|"+legenda+"|"+button+"|"+arq);
			// img.setAttribute("draggable","true");
			// img.setAttribute("ondrop","return drop(event)");
			// img.setAttribute("ondragstart","return empezar(event)");
			// img.setAttribute("ondragend","return end(event)");
			var pos1=document.getElementById("id|div|"+pg+"|"+legenda+"|"+button+"|"+arq);
			pos1.appendChild(img);
			}
			window.location.href = 'skp:get_list_img@' + str_path;
			}// ck div img
			};
function setinput(arr){
		// window.location.href = 'skp:get_t@' + "criar.js setinput id "+id;
		var id = arr[0];
		var valor = arr[1]
		
		var element= document.getElementById(id);
		element.setAttribute("value",valor);   
		// window.location.href = 'skp:get_t@' + "criar.js setinput  ";
		}; 

function Getmateriais(str){
		window.location.href = 'skp:Getmateriais@' + str;
		};			 
function novo(str){
		window.location.href = 'skp:get_novo@' + str;
		};

function getlegenda(value){   
		window.location.href = 'skp:legenda@'+value ;
		};
function criarmenupg(pg){
		// window.location.href = 'skp:get_t@' + "criar.js criarmenupg pg "+pg;

		var li=document.createElement("li");
		li.setAttribute("id","limenu"+pg);
		var pos=document.getElementById("pg");
		pos.appendChild(li);

		var a=document.createElement("a");
		a.setAttribute("id", 'menu'+pg);
		a.setAttribute("onclick","display('pg"+pg+"')");
		a.innerHTML=pg; 
		var pos1=document.getElementById("limenu"+pg);
		pos1.appendChild(a);

		// window.location.href = 'skp:get_t@' + "criar.js criarmenupg ";
		};
function getradio(valor){
		var elements = document.getElementsByName("name|input|Criar");
		for (var inc = 0, l = elements.length; inc < l; inc++){
			if (elements[inc].checked){
			var valor1=elements[inc].value;
			}
			}
			window.location.href = 'skp:salvar@' + valor+"|"+valor1;
			};
function digitar(id){
		var input = document.getElementById(id);
		// var valor=input.getAttribute("value");
		var valor = input.innerHTML
		window.location.href = 'skp:digito@' + id;
		};
function getfaces(path){
	window.location.href = 'skp:faces@' + path;
	};
function getmaterial(id){
		var elem=document.getElementById(id);
		var src=elem.getAttribute("src");
		window.location.href = 'skp:material@' + src;
		};

function criarbtmod(str) {
			// window.location.href = 'skp:get_t@' + "criar.js criarbtmod str "+str;
			var arr=str.split("|");
			var legend;
			var cont=0;
			var pg="mod";
			var titulo="modulos";
			var menu=true;
			for(var i = 0, length = arr.length; i < length; i++){
			if (cont==0) {
			if (legend!=arr[i]) { 
			legend=arr[i];
			if (menu) {
			 var divpg=document.createElement("div");
			 divpg.setAttribute("class","pag");
			 divpg.setAttribute("id","pg"+pg);
			 var poslinha=document.getElementById("linha");             
			 poslinha.appendChild(divpg);

			 var header=document.createElement("header");
			 header.setAttribute("class","headmod");
			 header.setAttribute("id","h"+pg);
			 var pospg=document.getElementById("pg"+pg);
			 pospg.appendChild(header);
			 
			 var h2=document.createElement("h2");
			 h2.setAttribute("class","titulo");
			 h2.setAttribute("id","t"+pg);
			 h2.innerHTML=titulo; 
			 var posheader=document.getElementById("h"+pg);  
			 posheader.appendChild(h2);
			 
			 var div1=document.createElement("div");
			 div1.setAttribute("class","buttonmod");
			 div1.setAttribute("id","divbt"+pg);
			 posheader.appendChild(div1);

			 var fildset=document.createElement("fildset");
			 fildset.setAttribute("id","filbt"+pg);
			 var pos1=document.getElementById("divbt"+pg);
			 pos1.appendChild(fildset);
			 
			 var leg=document.createElement("legend");
			 leg.setAttribute("class","legend");
			 leg.setAttribute("id","leg"+pg);
			 var pos2=document.getElementById("filbt"+pg);
			 pos2.appendChild(leg);
			 
			 var b=document.createElement("b");
			 b.setAttribute("id","b"+pg);
			 var pos3=document.getElementById("leg"+pg);
			 pos3.appendChild(b);
			 menu=false;
			 }
			
			 var input=document.createElement("input");
			 input.setAttribute("type","radio");
			 input.setAttribute("name","ck_bt_mod");
			 input.setAttribute("value",legend);
			 input.setAttribute("id",legend);     
			 var posicao1=document.getElementById("b"+pg);
			 posicao1.appendChild(input);

			 var lbl=document.createElement("label");
			 lbl.setAttribute("for",legend);
			 lbl.setAttribute("class","legend");
			 lbl.setAttribute("id",legend);
			 lbl.setAttribute("onclick","display('"+legend+"')");
			 lbl.innerHTML=legend;
			 posicao1.appendChild(lbl);

			 var novodiv=document.createElement("div");
			 novodiv.setAttribute("id","div"+legend);
			 novodiv.setAttribute("class","divmod");
			 var posicao2=document.getElementById("leg"+pg);
			 posicao2.appendChild(novodiv);

			 };
			 cont=1;
			 } else {

			 var input1=document.createElement("input");
			 input1.setAttribute("type","radio");
			 input1.setAttribute("name","ck_bt_mod|"+legend);
			 input1.setAttribute("id",legend+"|"+arr[i]);
			 input1.setAttribute("value",legend+"|"+arr[i]);
			 var posicao3=document.getElementById("div"+legend);
			 posicao3.appendChild(input1);

			 var lbl1=document.createElement("label");
			 lbl1.setAttribute("for",legend+"|"+arr[i]);
			 lbl1.setAttribute("class","radio");
			 lbl1.setAttribute("id","lbl"+arr[i]);
			 lbl1.setAttribute("value",arr[i]);
			 lbl1.setAttribute("onclick","getmat('"+pg+"|"+legend+"|"+arr[i]+"')");
			 lbl1.innerHTML=arr[i];
			 posicao3.appendChild(lbl1);

			 cont=0;
			 };
			 };
			// window.location.href = 'skp:get_t@' + "criar.js criarbtmod ";
			 };//function
function criarmod(str) {
			// window.location.href = 'skp:get_t@' + "criar.js criarmod str "+str;
			var arr=str.split("!");
			var ck=arr.pop();
			var arr1=ck.split("|");
			var pg=arr1[0];
			var legend=arr1[1];
			var radio=arr1[2];

			var div1=document.createElement("div");
			div1.setAttribute("class","divimgmod");
			div1.setAttribute("id","divimg"+pg);
			var pos=document.getElementById("pg"+pg);
			pos.appendChild(div1);
			for(var i = 0, length1 = arr.length; i < length1; i++){ 
		 
			var div=document.createElement("div");
			div.setAttribute("class","imgmod");
			div.setAttribute("id","dimg"+pg+i);
			// div.setAttribute("onclick","onclick","fabricar('"+arr[i]+"')");
			div.setAttribute("ondragenter","return enter(event)");
			div.setAttribute("ondragover","return over(event)");
			div.setAttribute("ondrop","return drop(event)");
			var posicao=document.getElementById("divimg"+pg);
			posicao.appendChild(div);

			var img=document.createElement("img");
			img.setAttribute("src", 'ico/'+pg+'/'+legend+'/'+radio+'/'+arr[i]);
			img.setAttribute("id", pg+arr[i]);
			img.setAttribute("onclick","fabricar('"+arr[i]+"')");
			img.setAttribute("title", arr[i]);
			img.setAttribute("draggable","true");
			// novoimg.setAttribute("ondrop","return drop(event)");
			img.setAttribute("ondragstart","return empezar(event)");
			img.setAttribute("ondragend","return end(event)");
			var posicao1=document.getElementById("dimg"+pg+i);
			posicao1.appendChild(img);
			
			};
			// window.location.href = 'skp:get_t@' + "criar.js criarmod ";
		 };
function setesp(id){
			// window.location.href = 'skp:get_t@' + "criar.js setesp id "+id;
			var element= document.getElementById("esp|"+id);
			element.setAttribute("checked","checked"); 
			// window.location.href = 'skp:get_t@' + "criar.js setesp ";
			};
function criarperfil(pg){

			// window.location.href = 'skp:get_t@' + "criar.js criarperfil pg "+pg;
			// var pg=arr.pop();
			// var titulo=arr.pop();
			// var legend=0;
			// var cont=0;

			 var divpg=document.createElement("div");
			 divpg.setAttribute("class","pag");
			 divpg.setAttribute("id","pg"+pg);
			 var poslinha=document.getElementById("linha");
			 poslinha.appendChild(divpg);       

			 

			 var input1=document.createElement("input");
			 input1.setAttribute("type","radio");
			 input1.setAttribute("name","ck_bt_"+pg);
			 input1.setAttribute("value",pg);
			 input1.setAttribute("id",pg);
			 var posicao2=document.getElementById("pg"+pg);
			 posicao2.appendChild(input1);

			 var lbl1=document.createElement("label");
			 lbl1.setAttribute("for",pg);
			 lbl1.setAttribute("class","radio");
			 lbl1.setAttribute("id","lbl"+pg);
			 lbl1.setAttribute("onclick","perfil('suport|sanca|sanca-150X400.skp')");
			 lbl1.setAttribute("value","sanca");
			 lbl1.innerHTML="sanca";
			 posicao2.appendChild(lbl1);
			 
			 var input2=document.createElement("input");
			 input2.setAttribute("type","radio");
			 input2.setAttribute("name","ck_bt_"+pg+"1");
			 input2.setAttribute("value",pg+"1");
			 input2.setAttribute("id",pg+"1");
			 // var posicao2=document.getElementById("pg"+pg);
			 posicao2.appendChild(input2);

			 var lbl2=document.createElement("label");
			 lbl2.setAttribute("for",pg+"1");
			 lbl2.setAttribute("class","radio");
			 lbl2.setAttribute("id","lbl"+pg+"1");
			 lbl2.setAttribute("onclick","perfil('face|parede|parede1')");
			 lbl2.setAttribute("value","parede");
			 lbl2.innerHTML="parede";
			 posicao2.appendChild(lbl2);
			 
			 var input3=document.createElement("input");
			 input3.setAttribute("type","radio");
			 input3.setAttribute("name","ck_bt_"+pg+"2");
			 input3.setAttribute("value",pg+"2");
			 input3.setAttribute("id",pg+"2");
			 // var posicao2=document.getElementById("pg"+pg);
			 posicao2.appendChild(input3);

			 var lbl3=document.createElement("label");
			 lbl3.setAttribute("for",pg+"2");
			 lbl3.setAttribute("class","radio");
			 lbl3.setAttribute("id","lbl"+pg+"2");
			 lbl3.setAttribute("onclick","thumbnail('on')");
			 lbl3.setAttribute("value","thumbnail");
			 lbl3.innerHTML="thumbnail";
			 posicao2.appendChild(lbl3);

			 var input4=document.createElement("input");
			 input4.setAttribute("type","radio");
			 input4.setAttribute("name","ck_bt_"+pg+"3");
			 input4.setAttribute("value",pg+"3");
			 input4.setAttribute("id",pg+"3");
			 // var posicao2=document.getElementById("pg"+pg);
			 posicao2.appendChild(input4);

			 var lbl4=document.createElement("label");
			 lbl4.setAttribute("for",pg+"3");
			 lbl4.setAttribute("class","radio");
			 lbl4.setAttribute("id","lbl"+pg+"3");
			 lbl4.setAttribute("onclick","dimencao('on')");
			 lbl4.setAttribute("value","dimencao");
			 lbl4.innerHTML="dimencao";
			 posicao2.appendChild(lbl4);
			 
			 
				// window.location.href = 'skp:get_t@' + "criar.js criarbt ";
			
			};
function settexture(str){
			window.location.href = 'skp:get_texture@' + str;
			};			