

require 'sketchup.rb'
require_relative 'adm.rb'
require_relative 'dados.rb'





class Html 
	def initialize

		@arr_layer = [];@pastas = [];@arr_leg = [];
		@list_esp = [];@list_config = [];@input = []
		@nome_comp = [];@layer = [];@pgs = []
		@arr_toggle = ["menu","id|ul|menu|Materiais","id|ul|menu|Faces",
			"id|ul|menu|Objetos","id|ul|menu|Objetos_Perfurantes","id|div|Layer"]
		@paginas = [];@list_img = []


		@path_dinamic =__dir__+"/icones/temp/dinamic.skp"
		@path_thumbnail =__dir__+"/icones/temp/thumbnail.png"
		@path_img_padrao=__dir__+"/icones/temp/padrao.png"

		@mysql = Dados::MYSQL.new		
		config = @mysql.List_config()
		config.each {|chave,valor|
		case chave
			when "alt_p_gav";@input<<chave;@list_config<<"altura da primeira gaveta:";@list_config<<chave;@list_config<<valor
			when "folga_prat";@input<<chave;@list_config<<"folga das prateleiras:";@list_config<<chave;@list_config<<valor
			when "qtd_prat";@input<<chave;@list_config<<"quantidade de prateleiras:";@list_config<<chave;@list_config<<valor
			when "prof_canal";@input<<chave;@list_config<<"profunddidade da ranhura:";@list_config<<chave;@list_config<<valor
			when "qtd_gav";@input<<chave;@list_config<<"quantidade de gavetas:";@list_config<<chave;@list_config<<valor
			when "prof_regua";@input<<chave;@list_config<<"profundidade das reguas:";@list_config<<chave;@list_config<<valor
			when "comp_gav";@input<<chave;@list_config<<"comprimento das gavetas:";@list_config<<chave;@list_config<<valor
			when "esp_corr";@input<<chave;@list_config<<"espessura da corrediça:";@list_config<<chave;@list_config<<valor
			when "desc_alt_gav";@input<<chave;@list_config<<"desconto da altura das gavetas:";@list_config<<chave;@list_config<<valor
			when "larg_arm";@input<<chave;@list_config<<"largura do armario:";@list_config<<chave;@list_config<<valor
			when "alt_arm";@input<<chave;@list_config<<"altura do armario:";@list_config<<chave;@list_config<<valor
			when "prof_arm";@input<<chave;@list_config<<"profundidade do armario:";@list_config<<chave;@list_config<<valor
			when "folga";@input<<chave;@list_config<<"folga das portas:";@list_config<<chave;@list_config<<valor

			when "esp_porta";@input<<chave;@list_esp<<"Portas";@list_esp<<chave;@list_esp<<valor
			when "esp_fundo";@input<<chave;@list_esp<<"Fundos";@list_esp<<chave;@list_esp<<valor
			when "esp_chapa";@input<<chave;@list_esp<<"Chapa";@list_esp<<chave;@list_esp<<valor	
			when "esp_tamp";@input<<chave;@list_esp<<"Tamponamentos";@list_esp<<chave;@list_esp<<valor

			when "nome_comp";@input<<chave;@nome_comp<<"Componente:";@nome_comp<<chave;@nome_comp<<valor
			when "layer";@input<<chave;@layer<<"Layer:";@layer<<chave;@layer<<valor

			# when "mat_caixa";@input<<chave;@list_select_mat<<chave;@list_select_mat<<valor
			# when "mat_porta";@input<<chave;@list_select_mat<<chave;@list_select_mat<<valor
			# when "mat_tamp";@input<<chave;@list_select_mat<<chave;@list_select_mat<<valor
			# when "mat_vidro";@input<<chave;@list_select_vidro<<chave;@list_select_vidro<<valor
			# when "mat_metais";@input<<chave;@list_select_metais<<chave;@list_select_metais<<valor
			# when "mat_pedra";@input<<chave;@list_select_pedra<<chave;@list_select_pedra<<valor

			# when "ck_bt_pedra";@input<<chave;@ck_bt_pedra=valor
			# when "ck_bt_vidro";@input<<chave;@ck_bt_vidro=valor
			# when "ck_bt_metais";@input<<chave;@ck_bt_metais=valor
			# when "ck_bt_mat";@input<<chave;@ck_bt_mat=valor
			# when "ck_bt_mod";@input<<chave;@ck_bt_mod=valor
			# when "ck_bt_esp";@input<<chave;@ck_bt_esp=valor
			
			# when "ck_display";@ck_display=valor

			# when "ck_img_p_mat";@input<<chave;@ck_img<<valor+"|mat"
			# when "ck_img_p_pedra";@input<<chave;@ck_img<<valor+"|pedra"
			# when "ck_img_p_vidro";@input<<chave;@ck_img<<valor+"|vidro"
			# when "ck_img_p_metais";@input<<chave;@ck_img<<valor+"|metais"

			# when "t_select";@t_select=valor
			# when "t_pg";@t_pg=valor
			
			# when "ck_leg_massisa";@ck_leg[chave]=valor
			# when "ck_leg_guararapes";@ck_leg[chave]=valor
			# when "ck_leg_vidro1";@ck_leg[chave]=valor
			# when "ck_leg_vidro2";@ck_leg[chave]=valor
			# when "ck_leg_pedra1";@ck_leg[chave]=valor
			# when "ck_leg_pedra2";@ck_leg[chave]=valor
			# when "ck_leg_metais1";@ck_leg[chave]=valor
			# when "ck_leg_metais2";@ck_leg[chave]=valor
			
			# when "ck_leg_cozinha";@ck_leg_mod[chave]=valor
			# when "ck_leg_dormitorio";@ck_leg_mod[chave]=valor
			# when "ck_leg_sala";@ck_leg_mod[chave]=valor
		
		end
		}
		
		model = Sketchup.active_model
		layers = model.layers
		layers.each{|lay| @arr_layer<<[lay.name,"Layer"]}

		@materiais= Dados::Pastas.List("Materiais")
		@faces = Dados::Pastas.List("Faces")
		@objetos = Dados::Pastas.List("Objetos")
		@objetos_perfurantes = Dados::Pastas.List("Objetos_Perfurantes")

		@pastas = @materiais+@faces+@objetos+@objetos_perfurantes
		@pastas.each{|path1|
			arr = path1.split("/")
			comp = arr.length;
      		arq = arr[comp-1];bt = arr[comp-2];lg = arr[comp-3];
      		pg = arr[comp-4];tp = arr[comp-5];

      		#@legenda<<tp+"|"+pg+"|"+lg+"|"+bt+"|"+arq

      		id = tp+"|"+pg+"|"+lg+"|"+bt
	      		
      		@arr_leg<<id if !@arr_leg.include?id
		}
		
		@arr_leg.each{|id|arr1 = id.split("|");@pgs<<arr1[1]}    			
	    @pg_inicio = @pgs.uniq!
	    @pg_inicio << @pgs[0]

	    #@list_img.each{|path|@pag<<pg if !@pag.include?pg}


		@dialog = UI::WebDialog.new("3d-Dynamic", true, "3d-Dynamic", 200, 200, 200, 200, true)
end
def Webdialog()


	@dialog.add_action_callback("inicio"){|web_dialog1,retorno|
		puts "html.rb inicio #{retorno}"
		case retorno
		when "iniciar"
			@modo = retorno
			if @dialog.visible?
		       @dialog.bring_to_front
			else
			    WIN ? @dialog.show : @dialog.show_modal
			end
		@pastas.each{|path|	@dialog.execute_script("pag("+ path.inspect + ")")}		
		@dialog.execute_script("esp("+@list_esp.to_s+ ")")
		@dialog.execute_script("config("+@list_config.to_s+ ")")
		@dialog.execute_script("criar("+@path_img_padrao.inspect+ ")")
		@arr_layer.each{|arr|@dialog.execute_script("dropdown("+arr.to_s+ ")")}		
		@paginas.each{|str|@dialog.execute_script("toggle("+str.inspect+ ")")}
		@arr_toggle.each{|str|@dialog.execute_script("toggle("+str.inspect+ ")")}
		
		@modo = "uso"
		end
		}
	#@dialog.add_action_callback("paginas"){|dialog,ret|	@paginas<<ret}
	@dialog.add_action_callback("digito"){|dialog,ret|
		puts "html.rb digito  #{ret.inspect}"
		if @id_retorno != ret then
			@id_retorno = ret 
			@ret=""
		end
		@ret = @dialog.get_element_value(@id_retorno)
		}
	@dialog.add_action_callback("faces"){|dialog,ret|
		puts "html.rb faces  #{ret.inspect}"
		arr = ret.split("/")
		str = arr.pop
		arr_str = str.split(".")
		arq = arr_str[0]+".skp|suport"
		arr_path = []
		arr.each{|pasta|
			if pasta == "Img" then 
				arr_path << "Suport"
			else
				arr_path << pasta
			end
		}
		arr_path << arq
		perfil = arr_path.join("/")
		Sketchup.active_model.select_tool Perfil.new(perfil)
		}
	@dialog.add_action_callback("obj"){|dialog,ret|
		puts "html.rb objetos  #{ret.inspect}"
		model = Sketchup.active_model
	        show_summary = true
	        status = model.import ret, show_summary
		}
	@dialog.add_action_callback("obj_perf"){|dialog,ret|
		puts "html.rb objetos perfurantes  #{ret.inspect}"
		model = Sketchup.active_model
	        show_summary = true
	        status = model.import ret, show_summary
		}	
	@dialog.add_action_callback("material"){|dialog,ret|
		puts "html.rb materiais  #{ret.inspect}"
		ADM::Texture.New(ret)				
		}
	@dialog.add_action_callback("fabricar"){|dialog,ret|
		puts "html.rb get_fabricar #{ret}"
		if @modo != "iniciar"
		input=@input.join("|")
		@my_dialog.execute_script("getelement('"+ input +"')")
				Criacao.new(ret,@hash1)
		end
		}
	@dialog.add_action_callback("thumbnail"){|dialog,ret|
		puts "html.rb thumbnail  #{ret.inspect}"
		model = Sketchup.active_model
        status = model.import @path_dinamic, true
		}	


	@dialog.add_action_callback("img"){|dialog,ret|
		puts "html.rb img ret #{ret}"
		@del_list=[]
		@list_img.each{|path|
			arr = path.split("/")
			comp = arr.length
	      	pg=arr[comp-4];

	      	arr1=ret.split("|")
	      	pg1=arr1[1]

	      	if pg == pg1 then 
	      		@dialog.execute_script("deletimg("+path.inspect+ ")")
	      		@del_list<<path
	      	end
	      }
	      @del_list.each{|path|	@list_img.delete(path)}
		@pastas.each{|path|
			arr=path.split("/")
			comp=arr.length
			ck=arr[comp-5]+"|"+arr[comp-4]+"|"+arr[comp-3]+"|"+arr[comp-2]
		if ck==ret then
			@dialog.execute_script("criarimg("+path.inspect+ ")")
		end
		}
		}


	
	@dialog.add_action_callback("list_img"){|dialog,ret| @list_img<<ret}


	@dialog.add_action_callback("teste"){|web_dialog1,retorno|
		puts "|T|--|#{retorno.inspect}"
		}

	@dialog.set_file(Sketchup.find_support_file "index.html" ,"Plugins/3dd")
	RUBY_PLATFORM =~ /(darwin)/ ? @dialog.show_modal() : @dialog.show()
	end

def SetLayer(layer)
	puts "==================stelayer++++++++++++#{layer}"
	arr_bt = "id|input|Menu|Layer|"+layer
	@my_dialog.execute_script("setdropdown("+arr_bt.inspect+ ")")
	end
def RemoveLayer(layer)
	arr_bt = [layer,"Layer"]
	@my_dialog.execute_script("deletedropdown("+arr_bt.to_s+ ")")
	end
def AddLayer(layer)
	arr_bt = [layer,"Layer"]
	@my_dialog.execute_script("adddropdown("+arr_bt.to_s+ ")")
	end

end
