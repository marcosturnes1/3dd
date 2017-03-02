

require 'sketchup.rb'
#require_relative 'adm.rb'
require_relative 'dados.rb'





class Html 
	def initialize

		@arr_layer = [];@pastas = [];@arr_leg = [];@menu="menu"
		@list_esp = [];@list_config = [];@input = []
		@nome_comp = [];@layer = [];@pgs = []

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
		layers.each{|lay| @arr_layer<<lay.name}

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
	    @pg_inicio=@pgs.uniq!
	    @pg_inicio<<@pgs[0]

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
		puts "=========================================="
		@pastas.each{|path|	@dialog.execute_script("criarpg("+ path.inspect + ")")}
		puts "=========================================="
		
		@dialog.execute_script("criardropdown("+@arr_layer.to_s+ ")")


		@dialog.execute_script("display("+ @pg_inicio.to_s+ ")")
		@dialog.execute_script("toogle("+@menu.inspect+ ")")
		@dialog.execute_script("criarbtesp("+@list_esp.to_s+ ")")
		@dialog.execute_script("criarconfig("+@list_config.to_s+ ")")

		
	@modo = "uso"
	end
	}

	@dialog.add_action_callback("teste"){|web_dialog1,retorno|
		puts "|T|--|#{retorno.inspect}"
		}
	#@dialog.add_action_callback("list_img"){|dialog,ret| @list_img<<ret}




	@dialog.set_file(Sketchup.find_support_file "index.html" ,"Plugins/3dd")
	RUBY_PLATFORM =~ /(darwin)/ ? @dialog.show_modal() : @dialog.show()
	end
end
