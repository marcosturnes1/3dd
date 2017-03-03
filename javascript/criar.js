function pag(str_path){
			// window.location.href = 'skp:teste@     ' +str_path;
			
			var arr=str_path.split("/");
			var comp=arr.length;
			var ele;
			var pos;
			var arq=arr[comp-1];
			var bt=arr[comp-2]
			var lg=arr[comp-3];
			var pg=arr[comp-4];
			var tp=arr[comp-5];
			var ck=false;
			var ck_leg=false;			

			var pagina=document.getElementById("id|div|"+tp+"|"+pg);
			if (pagina==null){ 
			ck =true;
			// cria menu de tipos
			var linha=document.getElementById("id|li|menu|"+tp);
			if (linha==null){

			ele=document.createElement("li");
			ele.setAttribute("onclick","toogle('id|ul|menu|"+tp+"')");
			ele.setAttribute("id","id|li|menu|"+tp);			
			pos=document.getElementById("pg");
			pos.appendChild(ele);			

			ele=document.createElement("a");
			ele.setAttribute("class",'a_menu');
			ele.setAttribute("id",'id|a|menu|'+tp);
			ele.innerHTML=tp; 
			pos=document.getElementById("id|li|menu|"+tp);
			pos.appendChild(ele);		

			ele=document.createElement("span");
			ele.setAttribute("class","span_menu");
			ele.setAttribute("id","id|span|menu|"+tp);
			pos=document.getElementById('id|a|menu|'+tp);
			pos.appendChild(ele);

			ele=document.createElement("i");
			ele.setAttribute("class","icon-down");
			ele.setAttribute("id","id|i|menu|"+tp);
			pos=document.getElementById("id|span|menu|"+tp);
			pos.appendChild(ele);
			}
			// cria sub_menus de tipos
			var ul1=document.getElementById("id|ul|menu|"+tp);
			if (ul1==null){

			ele=document.createElement("ul");
			ele.setAttribute("id","id|ul|menu|"+tp);
			pos=document.getElementById("id|li|menu|"+tp);
			pos.appendChild(ele);
			}
			var li1=document.getElementById("id|li|menu|"+tp+"|"+pg);
			if (li1==null){
			
			ele=document.createElement("li");
			ele.setAttribute("class","sub_menu")
			ele.setAttribute("onclick","toogle('id|div|"+tp+"|"+pg+"')");
			ele.setAttribute("id","id|li|menu|"+tp+"|"+pg);			
			pos=document.getElementById("id|ul|menu|"+tp);
			pos.appendChild(ele);

			ele=document.createElement("a");
			ele.setAttribute("class", 'a_menu');
			ele.setAttribute("id",'id|a|menu|'+tp+"|"+pg);			
			ele.innerHTML=pg; 
			pos=document.getElementById("id|li|menu|"+tp+"|"+pg);
			pos.appendChild(ele);
			}
		   	//comeca a criar a pagina 

		   	window.location.href = "skp:paginas@id|div|"+tp+"|"+pg;

			ele=document.createElement("div");
			ele.setAttribute("class","pag");
			ele.setAttribute("id","id|div|"+tp+"|"+pg);
			pos=document.getElementById("linha");

			pos.appendChild(ele);			
			ele=document.createElement("header");
			ele.setAttribute("class","headpg");
			ele.setAttribute("id","id|header|"+tp+"|"+pg);
			pos=document.getElementById("id|div|"+tp+"|"+pg);
			pos.appendChild(ele);

			ele=document.createElement("h2");
			ele.setAttribute("class","titulo");
			ele.setAttribute("id","id|h2|"+tp+"|"+pg);
			ele.innerHTML=pg;
			pos=document.getElementById("id|header|"+tp+"|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("div");
			ele.setAttribute("class","button");
			ele.setAttribute("id","id|div1|"+tp+"|"+pg);
			pos=document.getElementById("id|header|"+tp+"|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("fildset");
			ele.setAttribute("id","id|fildset|"+tp+"|"+pg);
			pos=document.getElementById("id|div1|"+tp+"|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("legend");
			ele.setAttribute("class","legend");
			ele.setAttribute("id","id|legend|"+tp+"|"+pg);
			pos=document.getElementById("id|fildset|"+tp+"|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("b");
			ele.setAttribute("id","id|b|"+tp+"|"+pg);
			pos=document.getElementById("id|legend|"+tp+"|"+pg);
			pos.appendChild(ele);
			
			}
			var legend=document.getElementById("id|input|"+tp+"|"+pg+"|"+lg);
			if (legend==null){ 
			ck_leg=true;

			ele=document.createElement("input");
			ele.setAttribute("type","radio");
			ele.setAttribute("name","name|input|"+tp+"|"+pg);
			ele.setAttribute("value","value|input|"+tp+"|"+pg+"|"+lg);
			ele.setAttribute("id","id|input|"+tp+"|"+pg+"|"+lg); 
			if(ck){ele.setAttribute("checked","checked");}
			pos=document.getElementById("id|b|"+tp+"|"+pg);
			pos.appendChild(ele);

			ele=document.createElement("label");
			ele.setAttribute("for","id|input|"+tp+"|"+pg+"|"+lg);
			ele.setAttribute("class","legend");
			ele.setAttribute("id","id|lbl|"+tp+"|"+pg+"|"+lg);
			ele.setAttribute("onclick","getdisplay('"+tp+"|"+pg+"|"+lg+"')");
			ele.innerHTML=lg;
			pos=document.getElementById("id|b|"+tp+"|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("div");
			ele.setAttribute("id","id|div|"+tp+"|"+pg+"|"+lg);
			ele.setAttribute("class","divbt");
			pos=document.getElementById("id|header|"+tp+"|"+pg);
			pos.appendChild(ele);
			
			}
			var radio=document.getElementById("id|input|"+tp+"|"+pg+"|"+lg+"|"+bt);
			if (radio==null){  

			ele=document.createElement("input");
			ele.setAttribute("type","radio");
			ele.setAttribute("name","name|input|"+tp+"|"+pg+"|"+lg);
			ele.setAttribute("value","value|input|"+tp+"|"+pg+"|"+lg+"|"+bt);
			ele.setAttribute("id","id|input|"+tp+"|"+pg+"|"+lg+"|"+bt);
			if(ck_leg){ele.setAttribute("checked","checked");}
			pos=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg);
			pos.appendChild(ele);

			ele=document.createElement("label");
			ele.setAttribute("for","id|input|"+tp+"|"+pg+"|"+lg+"|"+bt);
			ele.setAttribute("class","radio");
			ele.setAttribute("id","id|lbl|"+tp+"|"+pg+"|"+lg+"|"+bt);
			ele.setAttribute("onclick","getmat('"+tp+"|"+pg+"|"+lg+"|"+bt+"')");
			// lbl1.setAttribute("value",arr[i]);
			ele.innerHTML=bt;
			pos=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg);
			pos.appendChild(ele);
 		
			}
			var leg=document.getElementById("id|input|"+tp+"|"+pg+"|"+lg);
			var cked_lg=leg.getAttribute("checked");
			var btn=document.getElementById("id|input|"+tp+"|"+pg+"|"+lg+"|"+bt);
			var cked_bt=btn.getAttribute("checked");
			
			if ((cked_lg=="checked") && (cked_bt=="checked")){
				
			var divimgpg=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg+"|"+bt);
			if (divimgpg==null){ 

			eleele=document.createElement("div");
			ele.setAttribute("class","divimg");
			ele.setAttribute("id","id|div|"+tp+"|"+pg+"|"+lg+"|"+bt);
			pos=document.getElementById("id|div|"+tp+"|"+pg);
			pos.appendChild(ele);
			}// ck div conteiner imgs

			var dimg=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);
			if (dimg==null){ 

			ele=document.createElement("div");
			ele.setAttribute("class","image");
			ele.setAttribute("id","id|div|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);
			pos=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg+"|"+bt);
			pos.appendChild(ele);
		 	
		 	
		   if (pg=="Objetos"){			
			var nome=arq.split(".");
			var nome_arq=nome[0]+".skp";
			var arr_obj1=[];
			for (var i = 0; i < arr_obj.length; i++) {
				if(arr_obj[i]=="Objetos"){arr_obj1.push("Suport_Objetos")
				}else{arr_obj1.push(arr_obj[i])}
			}
			arr_obj1.push(nome_arq)
			var suport = arr_obj1.join("/");
			
			ele=document.createElement("a");
			ele.setAttribute("class","mini");
			ele.setAttribute("href",suport);
			ele.setAttribute("name",suport);
			ele.setAttribute("id","id|a|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);
			ele.setAttribute("ondragstart","dragModel(event)");      
			pos=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);
			pos.appendChild(ele);

			document.getElementById("id|a|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq).style.backgroundImage="url('"+str_path+"')";
			
		 }else{
			ele=document.createElement("img");
			ele.setAttribute("src",str_path);
			ele.setAttribute("class","mini");
			ele.setAttribute("id","id|img|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);      
			if (pg == "Faces"){ele.setAttribute("onclick","getfaces('"+str_path+"')");
			}else{
			ele.setAttribute("onclick","settexture('"+str_path+"')");}
			ele.setAttribute("title",+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);
			pos=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);
			pos.appendChild(ele);
			}
			if (tp == "Materiais"){window.location.href = 'skp:list_img@'+str_path;}
			}// ck div img
			}// ck button ck
			
			var leg_ck = legend.getAttribute("checked");
			if (leg_ck == "checked"){
				 document.getElementById("id|div|"+tp+"|"+pg+"|"+lg).style.display = 'block';
			}else{
				 document.getElementById("id|div|"+tp+"|"+pg+"|"+lg).style.display = 'none';
			}
			 // window.location.href = 'skp:teste@criou a pagina   ';
			};
function esp(arr_config){
			window.location.href = 'skp:teste@criar.js esp arr_config' +arr_config;
			// var arr=str.split("|");
			var legend;
			var chave;
			var check;
			var ele;
			var pos;
			var cont=arr_config.length/3;
			var pg="Configurações";
			var titulo="Seleção de espessuras";
			var ck=true;
			// for(var i = 0, comp = arr.length; y < comp; i++){
			for(var i = 0, cont; i < cont; i++){ 
			var id=i;
			var x=id*3;
			legend=arr_config[x];
			chave=arr_config[x+1];
			check=arr_config[x+2];
			switch (chave) {
				case "esp_chapa":
						var valores=["15","18","25"];
					 break;
				case "esp_fundo":
						var valores=["3","5","10","15"];
					 break;
				case "esp_porta":
						var valores=["15","18"];
					 break;
				case "esp_tamp":
						var valores=["15","18","25","30","50"];
					 break;
			} 
			var dpg=document.getElementById("id|div|"+pg);
			if (dpg==null){
			 
			ele=document.createElement("div");
			ele.setAttribute("class","pag");
			ele.setAttribute("id","id|div|"+pg);
			ele.setAttribute("onclick","toggle('id|div|"+pg+"')");
			pos=document.getElementById("linha");             
			pos.appendChild(ele);

			ele=document.createElement("li");
			ele.setAttribute("id","id|li|menu|"+pg);
			pos=document.getElementById("pg");
			pos.appendChild(ele);

			ele=document.createElement("a");
			ele.setAttribute("id", 'id|a|menu|'+pg);
			//ele.setAttribute("onclick","getdisplay('id|div|"+pg+"')");
			ele.innerHTML=pg; 
			pos=document.getElementById("id|li|menu|"+pg);
			pos.appendChild(ele);
			}
			var headerpg=document.getElementById("id|header|esp|"+pg);
			if (headerpg==null){
			 
			ele=document.createElement("header");
			ele.setAttribute("class","headpg");
			ele.setAttribute("id","id|header|esp|"+pg);
			pos=document.getElementById("id|div|"+pg);
			pos.appendChild(ele);
			 
			ele=document.createElement("h2");
			ele.setAttribute("class","titulo");
			ele.setAttribute("id","id|h2|esp|"+pg);
			ele.innerHTML=titulo; 
			pos=document.getElementById("id|header|esp|"+pg);  
			pos.appendChild(ele);
			 
			ele=document.createElement("div");
			ele.setAttribute("class","buttonmat");
			ele.setAttribute("id","id|div|esp|"+pg);
			pos=document.getElementById("id|header|esp|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("fildset");
			ele.setAttribute("id","id|fieldset|esp|"+pg);
			pos=document.getElementById("id|div|esp|"+pg);
			pos.appendChild(ele);
			ele=document.createElement("legend");
			ele.setAttribute("class","legend");
			ele.setAttribute("id","id|legend|esp|"+pg);
			pos=document.getElementById("id|fieldset|esp|"+pg);
			pos.appendChild(ele);
			 
			ele=document.createElement("b");
			ele.setAttribute("id","id|b|esp|"+pg);
			pos=document.getElementById("id|legend|esp|"+pg);
			pos.appendChild(ele); 
			} 

			ele=document.createElement("input");
			ele.setAttribute("type","radio");
			ele.setAttribute("name","name|input|esp|"+pg);
			ele.setAttribute("id","id|input|esp|"+chave);
			ele.setAttribute("value",chave);
			if (ck){
			ck=false
			ele.setAttribute("checked","checked");
			}
			pos=document.getElementById("id|b|esp|"+pg);
			pos.appendChild(ele);
		
			ele=document.createElement("label");
			ele.setAttribute("for","id|input|esp|"+chave);
			ele.setAttribute("class","legend");
			ele.setAttribute("id","id|label|esp|"+legend);
			ele.setAttribute("onclick","getdisplay('"+"id|div|esp|"+chave+"')");
			ele.innerHTML=legend; 
			pos=document.getElementById("id|b|esp|"+pg);  
			pos.appendChild(ele);
		 
			ele=document.createElement("div");     
			ele.setAttribute("id","id|div|esp|"+chave);
			ele.setAttribute("class","divicone");
			pos=document.getElementById("id|div|esp|"+pg);
			pos.appendChild(ele);
			for(var y = 0, comp = valores.length; y < comp; y++){ 
		 
			ele=document.createElement("input");
			ele.setAttribute("type","radio");
			ele.setAttribute("name",chave);
			ele.setAttribute("id",chave+"|"+valores[y]);
			ele.setAttribute("value",chave+"|"+valores[y]);
			if (check==valores[y]) {ele.setAttribute("checked","checked");} 
			pos=document.getElementById("id|div|esp|"+chave);
			pos.appendChild(ele);
		 
			ele=document.createElement("label");
			ele.setAttribute("for",chave+"|"+valores[y]);
			ele.setAttribute("onclick","update('"+chave+"|"+valores[y]+"')");
			ele.setAttribute("class","radio");
			ele.setAttribute("id","id|label|esp|"+chave+"|"+valores[y]);
			ele.setAttribute("value",valores[y]);
			ele.innerHTML=valores[y]+".MM"; 
			pos=document.getElementById("id|div|esp|"+chave); 
			pos.appendChild(ele);
			};//for

			var legendck=document.getElementById("id|input|esp|"+chave);
			var cklegend=legendck.getAttribute("checked")
			if (cklegend=="checked"){
				document.getElementById("id|div|esp|"+chave).style.display = 'block';
			}else{
				document.getElementById("id|div|esp|"+chave).style.display = 'none';
			}
			};//for arr
			document.getElementById("id|div|"+pg).style.display = 'none';
			window.location.href = 'skp:teste@_______________________________________________';
			};//function
function config(arr){
			window.location.href = 'skp:teste@' + "criar.js config arr "+arr;
			var ele;
			var pos;
			var titulo;
			var chave;
			var cont=0;
			var pg="Configurações";
			var menu=true;
			
			var dpg=document.getElementById("id|div|"+pg);
			if (dpg==null){ 
			ele=document.createElement("div");
			ele.setAttribute("class","pag");
			ele.setAttribute("id","id|div|"+pg);
			pos=document.getElementById("linha");
			pos.appendChild(ele);

			ele=document.createElement("li");
			ele.setAttribute("id","id|li|menu|"+pg);
			ele.setAttribute("onclick","toggle('id|div|"+pg+"')");
			pos=document.getElementById("pg");
			pos.appendChild(ele);
			window.location.href = 'skp:teste@criar.js config id|div|'+pg;

			ele=document.createElement("a");
			ele.setAttribute("id", 'id|a|menu|'+pg);
			//ele.setAttribute("onclick","getdisplay('id|div|"+pg+"')");
			ele.innerHTML=pg; 
			var pos=document.getElementById("id|li|menu|"+pg);
			pos.appendChild(ele);

			}
			for(var i = 0, length1 = arr.length; i < length1; i++){
			if (cont==0) {
			 titulo=arr[i];
			 cont=1;
			} else if (cont==1) {
				chave=arr[i];
				cont=2;
			} else {
				if (menu) {
			ele=document.createElement("div");
			ele.setAttribute("class","divform");
			ele.setAttribute("id","id|div|form|"+pg);
			pos=document.getElementById("id|div|"+pg);
			pos.appendChild(ele);

			ele=document.createElement("h2");
			ele.setAttribute("id","id|h2|form|"+pg);
			ele.innerHTML=pg; 
			pos=document.getElementById("id|div|form|"+pg);
			pos.appendChild(ele);
	 
			ele=document.createElement("table");
			ele.setAttribute("class","form");
			ele.setAttribute("id","id|table|form|"+pg);			
			pos=document.getElementById("id|div|form|"+pg);
			pos.appendChild(ele);
			menu=false;

			}
			ele=document.createElement("tr");
			ele.setAttribute("id","id|tr|form|"+chave);
			pos=document.getElementById("id|table|form|"+pg);
			pos.appendChild(ele);
		 
			ele=document.createElement("td");
			ele.setAttribute("class","tdform");
			ele.setAttribute("id","id|td|form|"+chave);
			pos=document.getElementById("id|tr|form|"+chave);
			pos.appendChild(ele);
		 
			ele=document.createElement("label");
			ele.setAttribute("id","id|lbl|form|"+chave);
			ele.setAttribute("class","texto");
			ele.setAttribute("id","radio"+arr[i]);
			ele.innerHTML=titulo; 
			pos=document.getElementById("id|td|form|"+chave);
			pos.appendChild(ele);

			ele=document.createElement("td");
			ele.setAttribute("class","tdform");
			ele.setAttribute("id","id|td1|form|"+chave);
			pos=document.getElementById("id|tr|form|"+chave);
			pos.appendChild(ele);
		 
			ele=document.createElement("input");
			ele.setAttribute("id","id|input|form|"+chave);
			ele.setAttribute("class","valor");
			ele.setAttribute("value",arr[i]);
			ele.setAttribute("onkeyup","digitar('id|input|form|"+chave+"')"); 
			pos=document.getElementById("id|td1|form|"+chave);
			pos.appendChild(ele); 
			cont=0;
			} 
			
			}
			window.location.href = 'skp:teste@____________________________________________';
			};
function criar(path){
			window.location.href = 'skp:teste@criar.js criar path '+path;
			var ele;
			var pos;
			var arq="Arquivo";
			var button=["Pagina","Legenda","Button","Arquivo"];
			var legenda=["objetos perfurantes",
			"Objetos","Materiais","Faces"];
			var selecao=["Gerar follow-me","Criar Thumbnail","Salvar","Deletar"];
			var pg="Criar";
			
			
			var pagina=document.getElementById("id|div|"+pg);
			if (pagina==null){ 

			ele=document.createElement("div");
			ele.setAttribute("class","pag");
			ele.setAttribute("id","id|div|"+pg);
			pos=document.getElementById("linha");
			pos.appendChild(ele);
			
			ele=document.createElement("img");
			ele.setAttribute("class","imagem_principal");
			ele.setAttribute("id","id|img|"+pg);
			ele.setAttribute("value",path);
			ele.setAttribute("src",path);
			ele.setAttribute("title","");
			pos=document.getElementById("id|div|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("header");
			ele.setAttribute("class","headpg");
			ele.setAttribute("id","id|header|"+pg);
			pos=document.getElementById("id|div|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("h2");
			ele.setAttribute("class","titulo");
			ele.setAttribute("id","id|h2|"+pg);
			ele.innerHTML=pg;
			pos=document.getElementById("id|header|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("div");
			ele.setAttribute("class","buttonmat");
			ele.setAttribute("id","id|div1|"+pg);
			pos=document.getElementById("id|header|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("fildset");
			ele.setAttribute("id","id|fildset|"+pg);
			pos=document.getElementById("id|div1|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("legend");
			ele.setAttribute("class","legend");
			ele.setAttribute("id","id|legend|"+pg);
			pos=document.getElementById("id|fildset|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("b");
			ele.setAttribute("id","id|b|"+pg);
			pos=document.getElementById("id|legend|"+pg);
			pos.appendChild(ele);

			ele=document.createElement("li");
			ele.setAttribute("id","id|li|menu|"+pg);
			ele.setAttribute("onclick","toggle('id|div|"+pg+"')");
			pos=document.getElementById("pg");
			pos.appendChild(ele);
			window.location.href = 'skp:teste@criar.js criar toggle  id|div|'+pg;
			ele=document.createElement("a");
			ele.setAttribute("id", 'id|a|menu|'+pg);
			//ele.setAttribute("onclick","getdisplay('id|div|"+pg+"')");
			ele.innerHTML=pg; 
			pos=document.getElementById("id|li|menu|"+pg);
			pos.appendChild(ele);

			}
			
			ck=true;
			for (var i = 0; i < legenda.length; i++) {  
			
			var legend=document.getElementById("id|input|"+pg+"|"+legenda[i]);
			if (legend==null){ 
			
			ele=document.createElement("input");
			ele.setAttribute("type","radio");
			ele.setAttribute("name","name|input|"+pg);
			ele.setAttribute("value","value|input|"+pg+"|"+legenda[i]);
			ele.setAttribute("id","id|input|"+pg+"|"+legenda[i]);      
			if(ck){
				ck=false;
				window.location.href = 'skp:legenda@'+legenda[i] ;
				ele.setAttribute("checked","checked");}      
			pos=document.getElementById("id|b|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("label");
			ele.setAttribute("for","id|input|"+pg+"|"+legenda[i]);
			ele.setAttribute("class","legend");
			ele.setAttribute("id","id|lbl|"+pg+"|"+legenda[i]);
			ele.setAttribute("onclick","getlegenda('"+legenda[i]+"')");
			ele.innerHTML=legenda[i];
			pos=document.getElementById("id|b|"+pg);
			pos.appendChild(ele);
						
			}
			}
	
			ele=document.createElement("div");
			ele.setAttribute("id","id|div|"+pg+"|legenda");
			ele.setAttribute("class","divbt");
			pos=document.getElementById("id|header|"+pg);
			pos.appendChild(ele);


			for (var i = 0; i < button.length; i++) {
			 
			ele=document.createElement("table");
			ele.setAttribute("class","form");
			ele.setAttribute("id","id|table|"+pg+"|"+pg);
			pos=document.getElementById("id|header|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("tr");
			ele.setAttribute("id","id|tr|"+pg+"|"+button[i]);
			pos=document.getElementById("id|table|"+pg+"|"+pg);
			pos.appendChild(ele);

			ele=document.createElement("td");
			ele.setAttribute("class","tdform");
			ele.setAttribute("id","id|td|"+pg+"|"+button[i]);
			pos=document.getElementById("id|tr|"+pg+"|"+button[i]);
			pos.appendChild(ele);

			ele=document.createElement("label");
			ele.setAttribute("id","id|lbl|"+pg+"|"+button[i]);
			ele.setAttribute("class","radio");
			ele.innerHTML=button[i]; 
			pos=document.getElementById("id|td|"+pg+"|"+button[i]);
			pos.appendChild(ele);

			ele=document.createElement("td");
			ele.setAttribute("class","tdform");
			ele.setAttribute("id","id|td1|"+pg+"|"+button[i]);
			pos=document.getElementById("id|tr|"+pg+"|"+button[i]);
			pos.appendChild(ele);

			ele=document.createElement("input");
			ele.setAttribute("id","id|input|"+pg+"|"+button[i]);
			ele.setAttribute("type","input");
			ele.setAttribute("class","valor");
			ele.setAttribute("onkeyup","digitar('id|input|"+pg+"|"+button[i]+"')");
			ele.setAttribute("value",""); 
			pos=document.getElementById("id|td1|"+pg+"|"+button[i]);
			pos.appendChild(ele); 

			ele=document.createElement("td");
			ele.setAttribute("class","tdform");
			ele.setAttribute("id","id|td2|"+pg+"|"+button[i]);
			pos=document.getElementById("id|tr|"+pg+"|"+button[i]);
			pos.appendChild(ele);

			ele=document.createElement("span");
			ele.setAttribute("class","tdform");
			ele.setAttribute("id","id|span|"+pg+"|"+button[i]);
			pos=document.getElementById("id|td2|"+pg+"|"+button[i]);
			pos.appendChild(ele);

			ele=document.createElement("i");
			ele.setAttribute("class","icon-down");
			ele.setAttribute("onclick","toogle('id|div|"+button[i]+"')");
			ele.setAttribute("id","id|i|criar|"+button[i]);
			pos=document.getElementById("id|span|"+pg+"|"+button[i]);
			pos.appendChild(ele);
			}//final da criacao dos buttons
			var dimg=document.getElementById("id|div|thumbnail");
			if (dimg==null){ 
			
			ele=document.createElement("div");
			ele.setAttribute("class","divmini");
			ele.setAttribute("id","id|div|thumbnail");			
			pos=document.getElementById("id|div|"+pg);
			pos.appendChild(ele);

			ele=document.createElement("img");
			ele.setAttribute("class","mini");
			ele.setAttribute("value",path);
			ele.setAttribute("src",path);
			ele.setAttribute("id","id|img|thumbnail");
			ele.setAttribute("onclick","Getmateriais('Materiais')");
			pos=document.getElementById("id|div|thumbnail");
			pos.appendChild(ele);
			
			}// ck button ck

			ele=document.createElement("footer");
			ele.setAttribute("class","select");
			ele.setAttribute("id","id|footer|"+pg);
			pos=document.getElementById("id|div|"+pg);
			pos.appendChild(ele);
			
			ele=document.createElement("div");
			ele.setAttribute("class","divmini");
			ele.setAttribute("id","id|div|thumbnail|button");
			pos=document.getElementById("id|footer|"+pg);
			pos.appendChild(ele);

			for (var i = 0; i < selecao.length; i++) {        

			ele=document.createElement("label");
			ele.setAttribute("for","id|input|"+pg+"|"+selecao[i]);
			ele.setAttribute("class","radio");
			ele.setAttribute("id","id|lbl|"+pg+"|"+selecao[i]);
			ele.setAttribute("onclick","getradio('"+pg+"|"+selecao[i]+"')");
			ele.innerHTML=selecao[i];
			pos=document.getElementById("id|div|thumbnail|button");
			pos.appendChild(ele);
			
			ele=document.createElement("span");
			ele.setAttribute("class","tdform");
			ele.setAttribute("id","id|span|"+pg+"|"+selecao[i]);
			pos=document.getElementById("id|lbl|"+pg+"|"+selecao[i]);
			pos.appendChild(ele);

			ele=document.createElement("i");
			if (selecao[i] == "Criar Thumbnail"){ele.setAttribute("class","icon-camera");}
			if (selecao[i] == "Salvar"){ele.setAttribute("class","icon-ok");}
			if (selecao[i] == "Deletar"){ele.setAttribute("class","icon-cancel");}
			if (selecao[i] == "Gerar follow-me"){ele.setAttribute("class","icon-imagem");}
			// icriar.setAttribute("onclick","novo('"+pg+"|"+button[i]+"')");
			ele.setAttribute("id","id|i|"+pg+"|"+selecao[i]);
			pos=document.getElementById("id|span|"+pg+"|"+selecao[i]);
			pos.appendChild(ele);
			
			if (selecao[i] == "Gerar follow-me"){
			ele=document.createElement("input");
			ele.setAttribute("id","id|input|"+pg+"|"+selecao[i]);
			ele.setAttribute("type","text");
			ele.setAttribute("class","relacao");
			pos=document.getElementById("id|div|thumbnail|button");
			pos.appendChild(ele); 
			}
			}//for

			ele=document.createElement("div");
			ele.setAttribute("class","divretorno");
			ele.setAttribute("id","id|div|thumbnail|label");
			pos=document.getElementById("id|footer|"+pg);
			pos.appendChild(ele);

			ele=document.createElement("input");
			ele.setAttribute("id","id|input|"+pg+"|retorno");
			ele.setAttribute("class","valor");
			pos=document.getElementById("id|div|thumbnail|label");
			pos.appendChild(ele);

			 document.getElementById("id|div|"+pg).style.display = 'none';
			 window.location.href = 'skp:teste@________________________________';
			 };
function dropdown(arr){
		window.location.href = 'skp:teste@criar.js dropdown arr   '+arr;
		var ele;
		var pos;
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
			
		ele=document.createElement("div");
		ele.setAttribute("id","id|div|"+pg);
		ele.setAttribute("class",pg);
		pos=document.getElementById(id);
		pos.appendChild(ele);
		}
		var lilayer=document.getElementById("id|li|"+pg+"|"+li);
		if (lilayer==null){
		
		ele=document.createElement("li");
		ele.setAttribute("id","id|li|"+pg+"|"+li);
		pos=document.getElementById("id|div|"+pg);
		pos.appendChild(ele);

		ele=document.createElement("a");
		ele.setAttribute("id", 'id|a|'+pg+"|"+li);
		ele.setAttribute("onclick","setdropdown('"+id1+"|"+li+"')");
		ele.innerHTML=li; 
		pos=document.getElementById("id|li|"+pg+"|"+li);
		pos.appendChild(ele);
		}
		window.location.href = 'skp:teste@______________________________________';
		};