function getelement(strinput){
	window.location.href = 'skp:get_t@'+"get.js getelement strinput "+strinput;
	var conteiner=[];
	var arr=strinput.split("|");

	for (var i = 0; i < arr.length; i++) {
		if((arr[i]=="alt_p_gav")||(arr[i]=="esp_corr")||(arr[i]=="comp_gav")||(arr[i]=="prof_reg")||(arr[i]=="alt_arm")||
			(arr[i]=="prof_canal")||(arr[i]=="desc_alt_gav")||(arr[i]=="qtd_prat")||(arr[i]=="folga_prat")|| 			
			(arr[i]=="folga")||(arr[i]=="prof_arm")||(arr[i]=="prof_arm")||(arr[i]=="prof_regua")||(arr[i]=="qtd_gav")||
			(arr[i]=="larg_arm")){
		        var elemento=document.getElementById(arr[i]);
				var valor=elemento.getAttribute("value");
				conteiner.push(arr[i]);
				conteiner.push(valor);
		       }
		if((arr[i]=="ck_bt_esp")){
			var e = document.getElementsByName(arr[i]);
		    for (var cont = 0, l = e.length; cont < l; cont++){
		        if (e[cont].checked){
		        	conteiner.push(arr[i]);
					conteiner.push(e[cont].value);
		        }
		    }
		}
		if((arr[i]=="ck_img_p_mat")||(arr[i]=="ck_img_p_metais")||(arr[i]=="ck_img_p_pedra")||(arr[i]=="ck_img_p_vidro")){
				var pasta=arr[i].split("_")
		        var elemento=document.getElementById("img"+pasta[3]);
				var valor=elemento.getAttribute("src");
				conteiner.push(arr[i]);
				conteiner.push(valor);
		}
		if((arr[i]=="ck_bt_mat")||(arr[i]=="ck_bt_pedra")||(arr[i]=="ck_bt_vidro")||(arr[i]=="ck_bt_metais")){			
			var elements = document.getElementsByName(arr[i]);
		    for (var inc = 0, l = elements.length; inc < l; inc++){
		        if (elements[inc].checked){
		        	var legenda=elements[inc].value;

		        }
		    }
	    			var elem = document.getElementsByName(arr[i]+"|"+legenda);
    		for (var incremento = 0, l = elem.length; incremento < l; incremento++){	
		    	if (elem[incremento].checked){
			        conteiner.push(arr[i]);
			        var pasta=arr[i].split("_");
					conteiner.push(pasta[2]+"|"+elem[incremento].value);
				// query = 'skp:get_t@' + "---chave4---"+arr[i]+"---valor---"+pasta[2]+"|"+elem[incremento].value;
    			// window.location.href = query;
				}
			}
		}
		if((arr[i]=="esp_tamp")||(arr[i]=="esp_fundo")||(arr[i]=="esp_chapa")||(arr[i]=="esp_porta")){	
			var elements = document.getElementsByName(arr[i]);
		    for (var inc = 0, l = elements.length; inc < l; inc++){
		        if (elements[inc].checked){
		        conteiner.push(arr[i]);
		        var esp=elements[inc].value;
		        var valor=esp.split("|");
				conteiner.push(valor[1]);
		        }
		    }
        }
		if((arr[i]=="mat_tamp")||(arr[i]=="mat_metais")||(arr[i]=="mat_porta")||(arr[i]=="mat_caixa")||(arr[i]=="mat_vidro")||(arr[i]=="mat_pedra")){
		        var elemento=document.getElementById("select"+arr[i]);
				var valor=elemento.getAttribute("src");
				conteiner.push(arr[i]);
				conteiner.push(valor);
				 query = 'skp:get_t@' + "---get---"+arr[i]+"---valor---"+valor;
    			 window.location.href = query;
		}
		if((arr[i]=="layer")||(arr[i]=="nome_comp")){
		        var elemento=document.getElementById(arr[i]);
				var valor=elemento.innerHTML
				conteiner.push(arr[i]);
				conteiner.push(valor);
		}
		if(arr[i]=="ck_bt_mod"){
			var elements = document.getElementsByName(arr[i]);
		    for (var inc = 0, l = elements.length; inc < l; inc++){
		        if (elements[inc].checked){
		        	var legenda=elements[inc].value;
		        }
		    }
	    			var elem = document.getElementsByName(arr[i]+"|"+legenda);
    		for (var incremento = 0, l = elem.length; incremento < l; incremento++){
		    	if (elem[incremento].checked){
			        conteiner.push(arr[i]);
			        var pasta=arr[i].split("_");
					conteiner.push(pasta[2]+"|"+elem[incremento].value);

				}
			}
			}
		}
    window.location.href = 'skp:get_value@'+conteiner;
	};
