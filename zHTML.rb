 require_relative 'adm.rb'
 require_relative 'dimencao.rb'
 require_relative 'arquivo.rb'
 require_relative 'criacao.rb'
 require_relative 'perfil.rb'
 require 'sketchup.rb'


#module Web
class Html 
	def initialize
		#puts "initialize------------------------html.rb"
		@list_select_mat=[];@list_select_vidro=[];@list_select_pedra=[];@list_select_metais=[];
		@list_bt_mod=[];@list_bt_vidro=[];@list_bt_pedra=[];@list_bt_metais=[];
		@list_img_mod=[];@list_img_vidro=[];@list_img_pedra=[];@list_img_metais=[];
		@input=[];@list_config=[];
		@list_bt_esp=[];@list_bt_esp.clear
		@esp_porta=[];@esp_fundo=[];@esp_chapa=[];@esp_tamp=[];@nome_comp=[];@layer=[];
		@ck_img=[]
		@ck_leg={};@ck_leg_mod={}
		@pastas=[]
		# @path_thumbnail =__dir__+"/icones/temp/thumbnail.png"
		# @path="C:/Users/user/Documents/3d_dynamic/"
		# @path_img_padrao=__dir__+"/icones/temp/padrao.png"
			
		@arr_leg=[]
		@arr=[]
		@arr2=[]
		@arr_layer=[]
		@pgs=[]
		@menu="menu"
		@id_layer="id|div|layer"
		@arr_img=[]
		@pg=""
		@leg=""
		@bt=""
		@list_img=[]
		@list_esp=[]
		@legenda=[]
		@criarlayers=[]
		@dellayers=[]
		@button=[]
		@arr_legenda=[]
		@arr_button=[]
		@arr_arq=[]
		@legenda_criar=""
		@pagina=""
		@exe = false
		# arq=Arquivo.new		
		# set = arq.List_config()
		# set.each {|chave,valor|
		# case chave
		# 	when "alt_p_gav";@input<<chave;@list_config<<"altura da primeira gaveta:";@list_config<<chave;@list_config<<valor
		# 	when "folga_prat";@input<<chave;@list_config<<"folga das prateleiras:";@list_config<<chave;@list_config<<valor
		# 	when "qtd_prat";@input<<chave;@list_config<<"quantidade de prateleiras:";@list_config<<chave;@list_config<<valor
		# 	when "prof_canal";@input<<chave;@list_config<<"profunddidade da ranhura:";@list_config<<chave;@list_config<<valor
		# 	when "qtd_gav";@input<<chave;@list_config<<"quantidade de gavetas:";@list_config<<chave;@list_config<<valor
		# 	when "prof_regua";@input<<chave;@list_config<<"profundidade das reguas:";@list_config<<chave;@list_config<<valor
		# 	when "comp_gav";@input<<chave;@list_config<<"comprimento das gavetas:";@list_config<<chave;@list_config<<valor
		# 	when "esp_corr";@input<<chave;@list_config<<"espessura da corrediça:";@list_config<<chave;@list_config<<valor
		# 	when "desc_alt_gav";@input<<chave;@list_config<<"desconto da altura das gavetas:";@list_config<<chave;@list_config<<valor
		# 	when "larg_arm";@input<<chave;@list_config<<"largura do armario:";@list_config<<chave;@list_config<<valor
		# 	when "alt_arm";@input<<chave;@list_config<<"altura do armario:";@list_config<<chave;@list_config<<valor
		# 	when "prof_arm";@input<<chave;@list_config<<"profundidade do armario:";@list_config<<chave;@list_config<<valor
		# 	when "folga";@input<<chave;@list_config<<"folga das portas:";@list_config<<chave;@list_config<<valor

		# 	when "esp_porta";@input<<chave;@list_esp<<"Portas";@list_esp<<chave;@list_esp<<valor
		# 	when "esp_fundo";@input<<chave;@list_esp<<"Fundos";@list_esp<<chave;@list_esp<<valor
		# 	when "esp_chapa";@input<<chave;@list_esp<<"Chapa";@list_esp<<chave;@list_esp<<valor	
		# 	when "esp_tamp";@input<<chave;@list_esp<<"Tamponamentos";@list_esp<<chave;@list_esp<<valor

		# 	when "nome_comp";@input<<chave;@nome_comp<<"Componente:";@nome_comp<<chave;@nome_comp<<valor
		# 	when "layer";@input<<chave;@layer<<"Layer:";@layer<<chave;@layer<<valor

		# 	when "mat_caixa";@input<<chave;@list_select_mat<<chave;@list_select_mat<<valor
		# 	when "mat_porta";@input<<chave;@list_select_mat<<chave;@list_select_mat<<valor
		# 	when "mat_tamp";@input<<chave;@list_select_mat<<chave;@list_select_mat<<valor
		# 	when "mat_vidro";@input<<chave;@list_select_vidro<<chave;@list_select_vidro<<valor
		# 	when "mat_metais";@input<<chave;@list_select_metais<<chave;@list_select_metais<<valor
		# 	when "mat_pedra";@input<<chave;@list_select_pedra<<chave;@list_select_pedra<<valor

		# 	when "ck_bt_pedra";@input<<chave;@ck_bt_pedra=valor
		# 	when "ck_bt_vidro";@input<<chave;@ck_bt_vidro=valor
		# 	when "ck_bt_metais";@input<<chave;@ck_bt_metais=valor
		# 	when "ck_bt_mat";@input<<chave;@ck_bt_mat=valor
		# 	when "ck_bt_mod";@input<<chave;@ck_bt_mod=valor
		# 	when "ck_bt_esp";@input<<chave;@ck_bt_esp=valor
			
		# 	when "ck_display";@ck_display=valor

		# 	when "ck_img_p_mat";@input<<chave;@ck_img<<valor+"|mat"
		# 	when "ck_img_p_pedra";@input<<chave;@ck_img<<valor+"|pedra"
		# 	when "ck_img_p_vidro";@input<<chave;@ck_img<<valor+"|vidro"
		# 	when "ck_img_p_metais";@input<<chave;@ck_img<<valor+"|metais"

		# 	when "t_select";@t_select=valor
		# 	when "t_pg";@t_pg=valor
			
		# 	when "ck_leg_massisa";@ck_leg[chave]=valor
		# 	when "ck_leg_guararapes";@ck_leg[chave]=valor
		# 	when "ck_leg_vidro1";@ck_leg[chave]=valor
		# 	when "ck_leg_vidro2";@ck_leg[chave]=valor
		# 	when "ck_leg_pedra1";@ck_leg[chave]=valor
		# 	when "ck_leg_pedra2";@ck_leg[chave]=valor
		# 	when "ck_leg_metais1";@ck_leg[chave]=valor
		# 	when "ck_leg_metais2";@ck_leg[chave]=valor
			
		# 	when "ck_leg_cozinha";@ck_leg_mod[chave]=valor
		# 	when "ck_leg_dormitorio";@ck_leg_mod[chave]=valor
		# 	when "ck_leg_sala";@ck_leg_mod[chave]=valor
		
		# end
		# }

		model = Sketchup.active_model
		layers = model.layers
		layers.each{|lay|@arr_layer<<lay.name}

		arquivo=Arquivo.new
		@pastas_materiais=arquivo.Pastas("Materiais")
		arquivo1=Arquivo.new
		@pastas_faces=arquivo1.Pastas("Faces")
		arquivo2=Arquivo.new
		@pastas_objetos=arquivo2.Pastas("Objetos")
		@pag=[]
		@pastas=@pastas_materiais+@pastas_faces+@pastas_objetos
		@pastas.each{|path1|
			arr = path1.split("/")
			comp=arr.length;
      		arq=arr[comp-1];
      		button=arr[comp-2]
      		legenda=arr[comp-3];
      		pg=arr[comp-4];
      		path=arr[comp-5];

      		@legenda<<pg+"|"+legenda+"|"+button+"|"+arq

      		id = path+"|"+pg+"|"+legenda+"|"+button
	      		
      		if !@arr_leg.include?id
      		@arr_leg<<id
      		end
		}
		@list_img.each{|path|
			if !@pag.include?pg then 
      			@pag<<pg
      		end
		}
		@arr_leg.each{|id| 
	      			arr1 = id.split("|")
	      			@pgs<<arr1[1] 
	      			}    			
	      		@pg_inicio=@pgs.uniq!
	      		@pg_inicio<<@pgs[0]
@my_dialog = UI::WebDialog.new("3d-Dynamic", true, "3d-Dynamic", 200, 200, 200, 200, true)
end

def Webdialog()
	
@my_dialog.add_action_callback("get_r"){|web_dialog1,retorno|
	#puts "html.rb get_r #{retorno}"
	case retorno
		when "iniciar"
			@modo=retorno
			if @my_dialog.visible?
		       @my_dialog.bring_to_front
			else
			    WIN ? @my_dialog.show : @my_dialog.show_modal
			end
		@pastas.each{|path|@my_dialog.execute_script("criarpg("+ path.inspect + ")")}	
		@pastas_materiais.each{|path|@my_dialog.execute_script("criarselectmat("+ path.inspect + ")")}		
		
		 -
		 @my_dialog.execute_script("display("+ @pg_inicio.to_s+ ")")
		 @my_dialog.execute_script("toogle("+@menu.inspect+ ")")	
		 @my_dialog.execute_script("toogle("+@id_layer.inspect+ ")")
		 @my_dialog.execute_script("criarbtesp("+@list_esp.to_s+ ")")
		 @my_dialog.execute_script("criarconfig("+@list_config.to_s+ ")")
		 @my_dialog.execute_script("criar("+@path_img_padrao.inspect+ ")")
		@arr_layer.each{|layer|
			lay = [layer,"Layer"]
			@my_dialog.execute_script("adddropdown("+lay.to_s+ ")")
			}
		@legenda_criar = Paginas("Objetos")
		@legenda_criar.each{|array|@my_dialog.execute_script("adddropdown("+array.to_s+ ")")}
		end#case
		@modo="uso"
		}
@my_dialog.add_action_callback("get_display"){|web_dialog1,retorno|
			puts "html.rb get_display retorno #{retorno}"
			@arr = retorno.split("|")
			if @arr[0]=="id" then 
				if @arr[2]=="esp"then 
					lista=["esp|esp_porta","esp|esp_fundo","esp|esp_chapa","esp|esp_tamp"]
					lista<<"esp|"+@arr[3]
				else
	      		@arr_leg.each{|id| 
	      			arr1 = id.split("|")
	      			@pgs<<arr1[1] 
	      			}   
	      		@pgs<< "Configurações"	
	      		@pgs<<"Criar"		
	      		lista=@pgs.uniq!
	      		lista<<@arr[2]
			@my_dialog.execute_script("toogle("+@menu.inspect+ ")")
			end
	      	else
	      		@legenda=@arr[2]
	      		@pg=@arr[1]
	      		@path=@arr[0]
	      		@arr_leg.each{|id| 
					arr1 = id.split("|")
					@button1=arr1[3]
		      		@legenda1=arr1[2]
		      		@pg1=arr1[1]
		      		@path1=arr1[0]
	      		if @pg==@pg1  then
	      			@arr2<<@pg1+"|"+@legenda1
	      		end
	      		}	      		
			lista = @arr2.uniq!	
			lista<<@pg + "|" + @legenda
      		end
			@my_dialog.execute_script("display("+lista.to_s+ ")")
			@arr=[]
			}
@my_dialog.add_action_callback("legenda"){|web_dialog1,retorno|
	puts "html.rb legenda retorno #{retorno}"
	if @modo != "iniciar"
		puts "231 @legenda_criar      #{@legenda_criar}"
		if !@legenda_criar.empty? then
			puts "233 @legenda_criar      #{@legenda_criar}"
		 	@legenda_criar.each{|array|@my_dialog.execute_script("deletedropdown("+array.to_s+ ")")}
		 	arr1 = [["id|input|Criar|Pagina",""],["id|input|Criar|Legenda",""],["id|input|Criar|Button",""],["id|input|Criar|Arquivo",""]]
		 	arr1.each{|id|@my_dialog.execute_script("setinput("+id.inspect+")")}
		end
			puts "238 @legenda_criar      #{@legenda_criar}"
			arr = @arr_legenda+@arr_button+@arr_arq
			puts "240 arr      #{arr}"
			arr.each{|array|@my_dialog.execute_script("deletedropdown("+array.to_s+ ")")}
			@legenda_criar = Paginas(retorno)
			@legenda_criar.each{|array|@my_dialog.execute_script("adddropdown("+array.to_s+ ")")}
	end
	}
@my_dialog.add_action_callback("update"){|web_dialog1,retorno|
	puts "html.rb update retorno #{retorno}"
		arr = retorno.split("|")
		if arr[1] != "div" then
			Deletedropdown(retorno)
			Adddropdown(retorno)
		else
			case arr[2]
			when "Pagina"
				@arr10 = @arr_button+@arr_arq
			when "Legenda"
				@arr10 = @arr_arq
			end
			@arr10.each{|array|@my_dialog.execute_script("deletedropdown("+array.to_s+ ")")}
		end
		}#web	
# @my_dialog.add_action_callback("get_list_img"){|web_dialog1,retorno|
# 	#puts "html.rb get_list_img retorno #{retorno}"
# 	@list_img<<retorno
# 	}	
@my_dialog.add_action_callback("get_m"){|web_dialog1,retorno|
	puts "html.rb get_m retorno #{retorno}"
	@del_list=[]
	@list_img.each{|path|
		arr = path.split("/")
		comp = arr.length
      	pg=arr[comp-4];

      	arr1=retorno.split("|")
      	pg1=arr1[1]

      	if pg == pg1 then 
      		@my_dialog.execute_script("deletimg("+path.inspect+ ")")
      		@del_list<<path
      	end
      }
      @del_list.each{|path|	@list_img.delete(path)}
	@pastas.each{|path|
		arr=path.split("/")
		comp=arr.length
		ck=arr[comp-5]+"|"+arr[comp-4]+"|"+arr[comp-3]+"|"+arr[comp-2]
	if ck==retorno then
		@my_dialog.execute_script("criarimg("+path.inspect+ ")")
	end
	}
	}
@my_dialog.add_action_callback("salvar"){|web_dialog1,retorno|
	puts "html.rb salvar retorno #{retorno}"
	arr = retorno.split("|")
	pag = arr[0]
	function = arr[1]
	pasta = arr.last

	case function
	when "Salvar"		
		pagina = @my_dialog.get_element_value("id|input|Criar|Pagina")
		legenda = @my_dialog.get_element_value("id|input|Criar|Legenda")
		button = @my_dialog.get_element_value("id|input|Criar|Button")
		arquivo = @my_dialog.get_element_value("id|input|Criar|Arquivo")
		case pasta
			when "Materiais"		
				path = @path+"Materiais/"+pagina+"/"+legenda+"/"+button+"/"+arquivo+".png"										
				path_suport = @path+"Suport_Materiais/"+pagina+"/"+legenda+"/"+button+"/"+arquivo+"/"+arquivo+".json"			
				ADM::Render.Save_as(@path_thumbnail,path)
				ADM::Json.new(path_suport)
			when "Objetos" 
				path = @path+"/"+pagina+"/"+legenda+"/"+button+"/"+arquivo+".png"				
				path_suport = @path+"/Suport_"+pagina+"/"+legenda+"/"+button+"/"+arquivo+".skp"
				#Thumbnail(path)
				ADM::SKP.new(path_suport)
			when "Faces"
				path = @path+"/"+pagina+"/"+legenda+"/"+button+"/"+arquivo+".png"				
				path_suport = @path+"/Suport_"+pagina+"/"+legenda+"/"+button+"/"+arquivo+".skp"
				Sketchup.undo
				#Thumbnail(path)
				ADM::SKP.new(path_suport)
			end
		
		Sketchup::set_status_text "Arquivo salvo!!!!Você deve reiniciar 3d_dynamic"
		arr = [["id|input|Criar|Arquivo",""]]
		arr.each{|array|@my_dialog.execute_script("setinput("+array.to_s+")")}	

	when "Gerar follow-me"
		@my_dialog.execute_script("setthumbnail("+@path_padrao.inspect+ ")")
		if pasta == "Faces" then
				puts "==============#{pasta}========="
				model = Sketchup.active_model
				selection = model.selection
				entities = model.active_entities
				rel = @my_dialog.get_element_value("id|input|Criar|Gerar follow-me")
			if rel.empty?
				Sketchup::set_status_text "Você deve digitar uma relacão para gerar '''Follow-me'''" 
			else
				relacao = rel.to_i
		        model.start_operation("thumbnail" , true )
		        points = []
	        	points << Geom::Point3d.new(0,0,0)
	        	points << Geom::Point3d.new(relacao/2,relacao/2,-relacao/2)
	        	points << Geom::Point3d.new(relacao,relacao/2,-relacao/2)
	        	points << Geom::Point3d.new(relacao,relacao/2,relacao/4)
	
	        selection.each {|fc| @face=fc if fc.is_a?(Sketchup::Face)} 
	        if !@face.is_a?(Sketchup::Face)
	        Sketchup::set_status_text "Você deve selecionar uma '''face'''" 
	    	else
		        edge = entities.add_edges(points)
		        puts "points   #{points}" 
		        @face.reverse! 
		    	@face.followme(edge)	
		    	model.commit_operation
	    	end
			end
 			else
 			Sketchup::set_status_text "Você deve estar no modo de criação de '''faces'''"

 			end

	when "Criar Thumbnail"	
			@my_dialog.execute_script("setthumbnail("+@path_padrao.inspect+ ")")
			ADM::Render.New(@path_thumbnail)		
			@my_dialog.execute_script("setthumbnail("+@path_thumbnail.inspect+ ")")			

	when "Deletar"
		ret = UI.messagebox "Você está prestes a deletar o arquivo #{@img}",MB_OKCANCEL
		if ret == 1 then
		@my_dialog.execute_script("setthumbnail("+@path_padrao.inspect+ ")")

		@pastas_user.delete_if {|x| x == @img }
		@pastas_img.delete_if {|x| x == @img }
		arr_img = @img.split("/")
		comp = arr_img.length
		arquivo = arr_img[comp-1]
		button = arr_img[comp-2]
		legenda = arr_img[comp-3]
		pasta = arr_img[comp-4]

		@vazio = true
		if pasta == "Materiais" then
		path = [@path_user+"/"+legenda+"/"+button ,@path_user+"/"+legenda]
		File.delete(@img) if File.exist?(@img)
		end
		if pasta != "Materiais" then
			arr = arquivo.split(".")
		path1 = [@path_img+"/"+pasta+"/"+legenda+"/"+button+"/"+arr[0]+".png",
			@path_suport+"/"+pasta+"/"+legenda+"/"+button+"/"+arr[0]+".skp",
			@path_suport+"/"+pasta+"/"+legenda+"/"+button+"/"+arr[0]+".skb"]
		path1.each{|file|File.delete(file) if File.exist?(file)}

		path =[@path_img+"/"+pasta+"/"+legenda+"/"+button ,@path_img+"/"+pasta+"/"+legenda,			
			@path_suport+"/"+pasta+"/"+legenda+"/"+button,@path_suport+"/"+pasta+"/"+legenda]
		end
		path.each{|file|
			Dir.foreach(file){|pasta|
          if pasta !="."  then 
            if pasta !=".."  then
                @vazio = false
            end
         end
        }
        Dir.delete(file)if @vazio
        @vazio = true
    	}
		array = [arquivo,"Arquivo"]
		@my_dialog.execute_script("deletedropdown("+array.to_s+ ")")
		Sketchup::set_status_text "Você deve reiniciar 3d_dynamic"
		arr = [["id|input|Criar|retorno","Você deve reiniciar 3d_dynamic"],["id|input|Criar|Arquivo",""],
				["id|input|Criar|Button",""],["id|input|Criar|Legenda",""],["id|input|Criar|Pagina",""]]
		arr.each{|array|@my_dialog.execute_script("setinput("+array.to_s+")")}
	end
	end #case
		}
@my_dialog.add_action_callback("get_value"){|web_dialog1,retorno|
	puts "html.rb get_value #{retorno}"
		if @modo != "iniciar"
		arquivar=Arquivo.new
		arr = retorno.split(",")
		@hash1={}
		cont=0
		par=1
		arr.each{|v|
			if cont==0 then
				@chave=v
				cont=1
			else
				@hash1[@chave]=v
				cont=0
			end
		}
		arquivar.Access_Update(@hash1,"config")
		end
		}
# @my_dialog.add_action_callback("get_fabricar"){|web_dialog1,retorno|
# 	puts "html.rb get_fabricar #{retorno}"
# 	if @modo != "iniciar"
# 	input=@input.join("|")
# 	@my_dialog.execute_script("getelement('"+ input +"')")
# 				Criacao.new(retorno,@hash1)
# 		end
# 		}
@my_dialog.add_action_callback("set_leg"){|web_dialog1,retorno|
		puts "html.rb set_leg #{retorno}"
		if @modo != "iniciar"
			arr=retorno.split("|")
			@ck_display="pg"+ arr[1]
			arr1=arr[0].split("/")
				@ck_leg["ck_leg_"+arr1[2]]=arr[0]
				arquivar=Arquivo.new
				arquivar.Access_Update(@ck_leg,"config")
		end
		}
@my_dialog.add_action_callback("get_perfil"){|web_dialog1,retorno|
	puts "html.rb get_perfil  #{retorno.inspect}"	
		Sketchup.active_model.select_tool Perfil.new(retorno)
			}
# @my_dialog.add_action_callback("get_thumbnail"){|web_dialog1,retorno|
# 	puts "html.rb get_thumbnail  #{retorno.inspect}"	
# 		ADM::Thumbnail.New(@path_thumbnail)
# 			}
@my_dialog.add_action_callback("get_dimencao"){|web_dialog1,retorno|
	puts "html.rb get_dimencao   #{retorno.inspect}"	
		#Sketchup.active_model.select_tool MySelectionObserver.new
		Sketchup.active_model.select_tool Dimencao.new
			}
# @my_dialog.add_action_callback("digito"){|web_dialog1,retorno|
# 	puts "html.rb digito  #{retorno.inspect}"
# 	if @id_retorno != retorno then
# 		@id_retorno = retorno 
# 		@ret=""
# 	end
# 	@ret = @my_dialog.get_element_value(@id_retorno)
# 	}
# @my_dialog.add_action_callback("faces"){|web_dialog1,retorno|
# 	puts "html.rb faces  #{retorno.inspect}"
# 	arr = retorno.split("/")
# 	str = arr.pop
# 	arr_str = str.split(".")
# 	arq = arr_str[0]+".skp|suport"
# 	arr_path = []
# 	arr.each{|pasta|
# 		if pasta == "Img" then 
# 			arr_path << "Suport"
# 		else
# 			arr_path << pasta
# 		end
# 	}
# 	arr_path << arq
# 	perfil = arr_path.join("/")
# 	Sketchup.active_model.select_tool Perfil.new(perfil)
# 	}
# @my_dialog.add_action_callback("objetos"){|web_dialog1,retorno|
# 	puts "html.rb objetos  #{retorno.inspect}"
# 	model = Sketchup.active_model
#         show_summary = true
#         status = model.import retorno, show_summary
# 	}
# @my_dialog.add_action_callback("material"){|web_dialog1,retorno|
# 	puts "html.rb materiais  #{retorno.inspect}"
# 	arr = retorno.split("/")
# 	arq = arr.last
# 	arr_arq = arq.split(".")

# 	model = Sketchup.active_model
# 	materials=model.materials
# 	m = materials.add arr_arq[0]
#     m.texture = retorno
#     texture = m.texture
# 	filename = texture.filename
# 	imageheight = texture.image_height
# 	height = texture.height
# 	imagewidth1 = texture.image_width
# 	imagewidth = texture.width
# 	width_height = texture.size = [imagewidth1/10,imageheight/10]
# 	puts "imagewidth  #{imagewidth}   imagewidth1  #{imagewidth1}"
# 	puts "imageheight  #{imageheight}   height  #{height}"
# 	puts "texture    #{texture}"
# 	alpha = m.alpha
# 	#m.alpha = 0.5
# 	h, l, s = m.colorize_deltas
# 	type = m.colorize_type
# 	type1 = m.materialType

# 	puts "alpha  #{alpha}   type  #{type}     type1  #{type1}"
# 	puts "h  #{h}   l  #{l}   s  #{s}"
	
# 	}
@my_dialog.add_action_callback("Getmateriais"){|web_dialog1,retorno|
	puts "html.rb Getmateriais--|#{retorno.inspect}"
	ADM::Model.New()
	}	
@my_dialog.add_action_callback("get_texture"){|web_dialog1,retorno|
	puts "|Texture|--|#{retorno.inspect}"
	ADM::Texture.New(retorno)
	}	
@my_dialog.add_action_callback("get_t"){|web_dialog1,retorno|
	puts "|T|--|#{retorno.inspect}"
	}

	html_path = Sketchup.find_support_file "index.html" ,"Plugins/3dd"
	@my_dialog.set_file(html_path)
	#@my_dialog.show()
	RUBY_PLATFORM =~ /(darwin)/ ? @my_dialog.show_modal() : @my_dialog.show()
	end

def Paginas(str)
	case str
	when "Materiais"
		@pasta = "Materiais"
		arr_bt = []
		arr_button = []
		puts "543 @arr_leg    #{@arr_leg}"
		@arr_leg.each{|leg|
		arr = leg.split("|")
			if arr[0]==@pasta then
				arr_button << arr[1]
			end	
		}
		button = arr_button.uniq!
		button.each{|bt|arr_bt << [bt,"Pagina"]}
	return arr_bt
	when "Faces"
		@pasta = "Img"
		arr_bt = [["Faces","Pagina"]]
		return arr_bt
	when "Objetos"
		@pasta = "Img"
		arr_bt = [["Objetos","Pagina"]]
		return arr_bt
	end
	end
def Adddropdown(str)
	#puts "Adddropdown  str   #{str}"
	arr = str.split("|")
	case arr[3]				
	when "Pagina";@pagina=arr[4];input = "Legenda";ind = 4
	when "Legenda";@legenda=arr[4];input = "Button";ind = 3
	when "Button";@button=arr[4];input = "Arquivo";ind = 2;
		
	end
	@arr_path = @pastas
	if arr[3] != "Arquivo" then
			arr_button=[]
			@arr_path.each{|leg|
				arr1 = leg.split("/")
				comp = arr1.length
				if arr[4]==arr1[comp-ind] then
						arr_button << arr1[comp-ind+1]
				end	
				}#arrleg
			if arr_button.length>1 && input != "Arquivo" then
				button = arr_button.uniq!
			else
				button = arr_button
			end
			arr_bt = []
			puts "587 button   #{button}"
			button.each{|bt|
				if arr[3] == "Button" then			
					bt1 = bt.split(".")
					arr_bt << [bt1[0],input]#button
				else
					arr_bt << [bt,input]#button
				end
			}
	case arr[3]				
		when "Pagina";@arr_legenda = arr_bt
		when "Legenda";@arr_button = arr_bt
		when "Button";@arr_arq = arr_bt
	end
		arr_bt.each{|array|@my_dialog.execute_script("adddropdown("+array.to_s+ ")")}
	else
		arr_button=[]
		@arr_path.each{|path|
		arr1 = path.split("/")
		comp = arr1.length
		
		if @pagina == arr1[comp-4] && @button == arr1[comp-2] && (arr[4]+".jpg" == arr1[comp-1] ||arr[4]+".png" == arr1[comp-1] ) then 
		puts "pasando  #{path.inspect}"	
		@my_dialog.execute_script("setthumbnail("+path.inspect+ ")")
				
		@img=path
		end		
		}

	end
	end
def Deletedropdown(str)	
	#puts "Deletedropdown    #{str}"
	#puts "@pagina    #{@pagina}"
	arr = str.split("|")
	if arr[3] != "Arquivo" then
	case arr[3]
	when "Pagina"
		@arr_id = [["id|input|Criar|Legenda",""],["id|input|Criar|Button",""],["id|input|Criar|Arquivo",""]]
		arr = @arr_legenda+@arr_button+@arr_arq
		@arr_legenda.clear
		@arr_button.clear
		@arr_arq.clear
	when "Legenda"
		@arr_id = [["id|input|Criar|Button",""],["id|input|Criar|Arquivo",""]]
		arr =@arr_button+@arr_arq
		@arr_button.clear
		@arr_arq.clear
	when "Button"
		@arr_id = [["id|input|Criar|Arquivo",""]]
		arr = @arr_arq
		@arr_arq.clear
	end
	@arr_id.each{|id|@my_dialog.execute_script("setinput("+id.inspect+")")}
	arr.each{|array|@my_dialog.execute_script("deletedropdown("+array.to_s+ ")")}
	end	
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
# def Add_Model_Material()
# 	Sketchup.active_model.rendering_options.each_pair { |key, value|
#   	puts "#{key} : #{value}"
# 	}
# 	@hash ={"DrawBackEdges"=>false,"DrawDepthQue"=>false,"EdgeDisplayMode"=>0,"DrawSilhouettes"=>false,"ExtendLines"=>false}

# 	default_style = Sketchup.find_support_file("Materiais.style", "Plugins/3dd/icones/temp")
# 	puts "default_style    #{default_style}"
# 	styles = Sketchup.active_model.styles
# 	status = styles.add_style(default_style, true)
# 	styles.purge_unused

# 	point = Geom::Point3d.new(0,0,0)
# 	transform = Geom::Transformation.new(point)
# 	model = Sketchup.active_model
# 	entities = model.active_entities
# 	path = Sketchup.find_support_file("material.skp","Plugins/3dd/icones/temp/")
# 	definitions = model.definitions
# 	componentdefinition = definitions.load(path)
# 	instance = entities.add_instance(componentdefinition,transform)	


# 	@hash.each{|chave,valor|Sketchup.active_model.rendering_options[chave] = valor}	

	
# 	end
end


