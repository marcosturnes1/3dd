function iniciar() {
	 window.location.href = 'skp:inicio@' + "iniciar";
	 };
function criarpg(str_path){
			window.location.href = 'skp:teste@     ' +str_path;
			
			var arr=str_path.split("/");
			var comp=arr.length;
			
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
			var divpg=document.createElement("div");
			divpg.setAttribute("class","pag");
			divpg.setAttribute("id","id|div|"+tp+"|"+pg);
			var poslinha=document.getElementById("linha");
			poslinha.appendChild(divpg);			

			var header=document.createElement("header");
			header.setAttribute("class","headpg");
			header.setAttribute("id","id|header|"+tp+"|"+pg);
			var pospg=document.getElementById("id|div|"+tp+"|"+pg);
			pospg.appendChild(header);
			
			var h2=document.createElement("h2");
			h2.setAttribute("class","titulo");
			h2.setAttribute("id","id|h2|"+tp+"|"+pg);
			h2.innerHTML=pg;
			var posheader=document.getElementById("id|header|"+tp+"|"+pg);
			posheader.appendChild(h2);
			
			var divbuttons=document.createElement("div");
			divbuttons.setAttribute("class","button");
			divbuttons.setAttribute("id","id|div1|"+tp+"|"+pg);
			posheader.appendChild(divbuttons);
			
			var fildset=document.createElement("fildset");
			fildset.setAttribute("id","id|fildset|"+tp+"|"+pg);
			var pos1=document.getElementById("id|div1|"+tp+"|"+pg);
			pos1.appendChild(fildset);
			
			var legend=document.createElement("legend");
			legend.setAttribute("class","legend");
			legend.setAttribute("id","id|legend|"+tp+"|"+pg);
			var pos2=document.getElementById("id|fildset|"+tp+"|"+pg);
			pos2.appendChild(legend);
			
			var b=document.createElement("b");
			b.setAttribute("id","id|b|"+tp+"|"+pg);
			var pos3=document.getElementById("id|legend|"+tp+"|"+pg);
			pos3.appendChild(b);

			var li=document.createElement("li");
			li.setAttribute("id","id|li|menu|"+tp+"|"+pg);
			var posmenu=document.getElementById("pg");
			posmenu.appendChild(li);

			var a=document.createElement("a");
			a.setAttribute("id", 'id|a|menu|'+tp+"|"+pg);
			a.setAttribute("onclick","getdisplay('id|div|"+tp+"|"+pg+"')");
			a.innerHTML=pg; 
			var poslimenu=document.getElementById("id|li|menu|"+tp+"|"+pg);
			poslimenu.appendChild(a);

			}
			
			var legend=document.getElementById("id|input|"+tp+"|"+pg+"|"+lg);
			if (legend==null){ 
			ck_leg=true;
			var input=document.createElement("input");
			input.setAttribute("type","radio");
			input.setAttribute("name","name|input|"+tp+"|"+pg);
			input.setAttribute("value","value|input|"+tp+"|"+pg+"|"+lg);
			input.setAttribute("id","id|input|"+tp+"|"+pg+"|"+lg); 
			if(ck){input.setAttribute("checked","checked");}
			var posicao=document.getElementById("id|b|"+tp+"|"+pg);
			posicao.appendChild(input);
			
			var lbl=document.createElement("label");
			lbl.setAttribute("for","id|input|"+tp+"|"+pg+"|"+lg);
			lbl.setAttribute("class","legend");
			lbl.setAttribute("id","id|lbl|"+tp+"|"+pg+"|"+lg);
			lbl.setAttribute("onclick","getdisplay('"+tp+"|"+pg+"|"+lg+"')");
			lbl.innerHTML=lg;
			posicao.appendChild(lbl);
			
			var div=document.createElement("div");
			div.setAttribute("id","id|div|"+tp+"|"+pg+"|"+lg);
			div.setAttribute("class","divbt");
			var posicao1=document.getElementById("id|header|"+tp+"|"+pg);
			posicao1.appendChild(div);
			
			}
			
			var radio=document.getElementById("id|input|"+tp+"|"+pg+"|"+lg+"|"+bt);
			if (radio==null){  

			var input1=document.createElement("input");
			input1.setAttribute("type","radio");
			input1.setAttribute("name","name|input|"+tp+"|"+pg+"|"+lg);
			input1.setAttribute("value","value|input|"+tp+"|"+pg+"|"+lg+"|"+bt);
			input1.setAttribute("id","id|input|"+tp+"|"+pg+"|"+lg+"|"+bt);
			if(ck_leg){input1.setAttribute("checked","checked");}
			var posicao2=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg);
			posicao2.appendChild(input1);
			var lbl1=document.createElement("label");
			lbl1.setAttribute("for","id|input|"+tp+"|"+pg+"|"+lg+"|"+bt);
			lbl1.setAttribute("class","radio");
			lbl1.setAttribute("id","id|lbl|"+tp+"|"+pg+"|"+lg+"|"+bt);
			lbl1.setAttribute("onclick","getmat('"+tp+"|"+pg+"|"+lg+"|"+bt+"')");
			// lbl1.setAttribute("value",arr[i]);
			lbl1.innerHTML=bt;
			posicao2.appendChild(lbl1);
 		
			}
			
			var leg=document.getElementById("id|input|"+tp+"|"+pg+"|"+lg);
			var cked_lg=leg.getAttribute("checked");
			var btn=document.getElementById("id|input|"+tp+"|"+pg+"|"+lg+"|"+bt);
			var cked_bt=btn.getAttribute("checked");
			
			if ((cked_lg=="checked") && (cked_bt=="checked")){
				
			var divimgpg=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg+"|"+bt);
			if (divimgpg==null){ 

			var div3=document.createElement("div");
			div3.setAttribute("class","divimg");
			div3.setAttribute("id","id|div|"+tp+"|"+pg+"|"+lg+"|"+bt);
			var pospg=document.getElementById("id|div|"+tp+"|"+pg);
			pospg.appendChild(div3);
			}// ck div conteiner imgs
			
			var dimg=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);
			if (dimg==null){ 

			var div1=document.createElement("div");
			div1.setAttribute("class","image");
			div1.setAttribute("id","id|div|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);
			// div1.setAttribute("ondragenter","return enter(event)");
			// div1.setAttribute("ondragover","return over(event)");
			// div1.setAttribute("ondrop","return drop(event)");
			var pos=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg+"|"+bt);
			pos.appendChild(div1);
		 	
		 	
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
			
			var a=document.createElement("a");
			a.setAttribute("class","mini");
			a.setAttribute("href",suport);
			a.setAttribute("name",suport);
			a.setAttribute("id","id|a|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);
			a.setAttribute("ondragstart","dragModel(event)");      
			// img.setAttribute("draggable","true");
			// img.setAttribute("ondrop","return drop(event)");
			// img.setAttribute("ondragstart","return empezar(event)");
			// img.setAttribute("ondragend","return end(event)");
			var pos1=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);
			pos1.appendChild(a);
			//$("id|a|"+pg+"|"+legenda+"|"+button+"|"+arq).css('background-image', "url('"+str_path+"')");
			document.getElementById("id|a|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq).style.backgroundImage="url('"+str_path+"')";

			// a.body.style.backgroundImage = "url('"+str_path+"')";
		 }else{
			var img=document.createElement("img");
			img.setAttribute("src",str_path);
			img.setAttribute("class","mini");
			img.setAttribute("id","id|img|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);      
			if (pg == "Faces"){img.setAttribute("onclick","getfaces('"+str_path+"')");
			}else{
				img.setAttribute("onclick","settexture('"+str_path+"')");}
			img.setAttribute("title",+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);
			// img.setAttribute("draggable","true");
			// img.setAttribute("ondrop","return drop(event)");
			// img.setAttribute("ondragstart","return empezar(event)");
			// img.setAttribute("ondragend","return end(event)");
			var pos1=document.getElementById("id|div|"+tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq);
			pos1.appendChild(img);
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
			window.location.href = 'skp:teste@fim   ';
			};
function display(arr_display) {
			var on = arr_display.pop();
			
			for(var i = 0, length = arr_display.length; i < length; i++){
			if (arr_display[i]!=on){
				document.getElementById("id|div|"+arr_display[i]).style.display="none";
			}else{
				document.getElementById("id|div|"+arr_display[i]).style.display = 'block';
			}
			}
			};
function toogle(id) {
		// window.location.href = 'skp:get_t@'+ "criar.js toogle  id  "+id ;
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
		// window.location.href = 'skp:update@'+ id;
		}
		// window.location.href = 'skp:get_t@'+ "criar.js toogle ________________________";
		};