require 'sketchup.rb'
require "json"
require 'json/ext'
require 'json/add/core'
require_relative "dados.rb"
#require_relative "teste.rb"

module ADM 
class Path
  def initialize(path)
    #puts "path   #{path}"
      if path.include?"/" then
      arr = path.split("/")
      arr.pop if arr.last.include?"."
      cont = 0
      arr.each{|pasta|
      @pastas = pasta if cont == 0
      if cont > 0 then
        @pastas+="/"+pasta 
        Dir.mkdir(@pastas)if !Dir.exist?(@pastas)
      end
      cont+=1
      }
  end
  #puts "@pastas   #{@pastas}"
  end
  end
class Render 
  def self.New(path)
    Path.new(path)
      @hash1={}
    Sketchup.active_model.rendering_options.each_pair { |key, value|
    if key == "DrawBackEdges"||key == "DrawDepthQue"||key == "EdgeDisplayMode"||key == "DrawSilhouettes"||key == "ExtendLines"then
      @hash1[key]=value
    end
    }
    @hash ={"DrawBackEdges"=>false,"DrawDepthQue"=>false,"EdgeDisplayMode"=>0,"DrawSilhouettes"=>false,"ExtendLines"=>false}
    @hash.each{|chave,valor|Sketchup.active_model.rendering_options[chave] = valor}

    model = Sketchup.active_model
    entities = model.active_entities
    view = model.active_view
      keys = {
        :filename => path,
        :width => 600,
        :height => 600,
        :antialias => false,
        :compression => 0.9,
        :transparent => true
      }
    model = Sketchup.active_model
    view = model.active_view
    
    view = view.zoom entities
    camera = view.camera
    fov = Sketchup.active_model.active_view.field_of_view
    up = Geom::Vector3d.new(-0.44197, 0.458157, 0.771203)
    eye = Geom::Point3d.new(96.0112, -94.665, 137.368)
    target = Geom::Point3d.new(19.9174, -15.7842, 46.8981)
    
    camera.set eye, target, up
    #camera.height = 133.0
    
    view.write_image keys
    @hash1.each{|chave,valor|Sketchup.active_model.rendering_options[chave] = valor} 
    end
    def self.Save_as(path_local,path_destino)

      #puts "Render.Save_as path_destino   #{path_destino}"
          Path.new(path_destino)
          arr = path_destino.split("/")
          @path_destino = arr.join("/")        
          arq = arr.pop
          arr1 = arq.split(".")
          new_nome = arr1[0]
          arr = path_local.split("/")
          arq = arr.pop
          arr1 = arq.split(".")
          nome = arr1[0] 

      FileUtils.cp(path_local, @path_destino)

      Dir.glob(@path_destino).sort.each{|f|
      filename = File.basename(f,File.extname(f))
      File.rename(f,path+"/"+ new_nome.capitalize + File.extname(f))if filename == nome
      }   
    end
  end
class SKP 
  def initialize(path)
    Path.new(path)
      arr = path.split("/")
      arq = arr.last

      model = Sketchup::active_model
      selection = model.selection 
      
      model.definitions.purge_unused
      model.materials.purge_unused
      model.layers.purge_unused

      model = selection.model
      definition = model.definitions
      description = model.description
      entity1 = model.entities

     definition.each { |definit| puts "definit     #{definit.name}" }
      
      model.start_operation(arq,true)
      #draw_geometry(model)
      model.commit_operation
    rescue => err
      puts err.inspect
      puts err.backtrace
    else # no errors
      model.save( File.join(@button_save,arq) )
    ensure
      model.abort_operation
  end
  end
class Json 
  def initialize(path)
      Path.new(path)
      arr = path.split("/")
      arq = arr.pop
      #comp = arr.length
      #@nome =(arr[comp-4]+"_"+arr[comp-3]+"_"+ arr[comp-2])
      #puts "55555555555555555555555555555555555555555555555555555555"
      #puts "@nome   #{@nome}"
      arr1 = arq.split(".")      
      @arq = arr1[0]
      @ext ="."+arr1[1]
      arr1 = path.split(".")
      #arr<<@arq     
      @pasta = arr.join("/")
      pastas = []
      i = 0
      @hash_gsub = {}
      @material = []
    
      
      model = Sketchup.active_model
      model.start_operation('material', true)
      materials = model.materials
      materials.purge_unused
      entities = model.entities
      
      entities.each{|comp| 
      definition = comp.definition if comp.is_a?(Sketchup::ComponentInstance)
      nome = definition.name if comp.is_a?(Sketchup::ComponentInstance)
      #puts "nome   #{nome}"
      if comp.is_a?(Sketchup::ComponentInstance) && (definition.name == ~ /dinamic\W\d/ || definition.name == "dinamic") then
        @comp = comp        
      end
      }
      #puts "@comp     #{@comp}"
      arr_entity = @comp.explode 
      arr_entity.each{|ent|
        if ent.is_a?(Sketchup::ComponentInstance) then      
          arr = ent.explode 
          arr.each{|f|@material << f.material.display_name if f.is_a?(Sketchup::Face)}
        end
          @material << ent.material.display_name if ent.is_a?(Sketchup::Face)
        
      }if @comp

      @material.uniq!
      comprimento = @material.length
      model.abort_operation

      if comprimento == 1 then
      materials = Sketchup.active_model.materials
      materials.purge_unused      
      materials.each {|material|
      nome = material.display_name
      @material1=material if nome == @material[0]
      @arr_mat = material.attribute_dictionaries if nome == @material[0] 
      }

       #puts "===================================================="
       @arr_teste=[]
        attrdicts = @material1.attribute_dictionaries
        #puts "attrdicts   #{attrdicts}"

        arr = attrdicts.to_a
        arr.each{|dict| @arr_teste<<dict.name
        dict.each{|c,v| @arr_teste<<c;@arr_teste<<v}
        }
       # puts "===================================================="
       # puts "===================================================="
       # puts "===================================================="
       # puts "arr = ["
       # @arr_teste.each{|t|
       #  puts "#{t.inspect},"}
       # puts "]"
       # puts "===================================================="
       # puts "===================================================="
       # puts "===================================================="
      if @arr_mat then
      @arr_mat.each{|dict|
      if dict.name == "VRayInfo"||dict.name == "VRayPlugins" then
        dict.each{|k1,v1|
          #puts "k1  #{k1}    v1    #{v1}"
      if k1 =="class"||k1 == "main_plugin"||k1 == "type" then
        @hash_gsub[v1]="/"+@arq if k1 == "main_plugin"
        #@hash_gsub[v1]=@arq if k1 == "type"
      else 
        hash1 = JSON(v1)
        hash1.each{|k2,v2|
          if k2 == ""|| k2 =="params" then          
            v2.each{|k3,v3|
            if k3 == "file" then
              path = v3.gsub("\\","/")          
              arr = path.split(".")
              ext ="."+ arr[1]  
              arr1 = k1.split("/")
              arr1[1] = @arq
              novo_nome = arr1.join("_")
              @new_arr1 = []                                    
              path_new = @pasta+"/"+novo_nome+ext

              arr_new = @pasta.split("/")
              @arr_new1 = []
              arr_new.each{|c|@arr_new1<<c+"\\"}

              @arr_new1<<novo_nome+ext
              path_new1 = @arr_new1.join("\\")
              puts "231 path_new   #{path_new}"
              Render.Save_as(path,path_new) if path_new


              arr = v3.split("\\")
              @arr_new2 = []
              key_new = arr.join("\\\\")
              @hash_gsub[key_new]=path_new1 

            end
            if v3.class == String then

            else
              v3.each{|k4,v4| puts "k4  #{k4}|||#{k4.class}     v4  #{v4}|||#{v4.class}"}
            end
            }
          end     
        } 
        end
        } 
        end
        }
        end  
        @hash = {} 
        @hash_mat = {}
        @arr_mat.each{|dict|
          dict.each{|k1,v1|
            re = Regexp.union(@hash_gsub.keys)     
            nk1 = k1.gsub(re, @hash_gsub)
            nv1 = v1.gsub(re, @hash_gsub)            
            @hash[nk1] = nv1
        } 
        @hash_mat[dict.name]= @hash
        @hash = {}
        }

      @cont = 0
      @hash_mat.each{|c1,v1|
        cont=0
        v1.each{|c2,v2|
        if v2.include?"{" then
          @a = {c1=>{c2=>JSON(v2)}} 
        else
          @a = {c1=>{c2=>v2}} 
        end
        @hash1 = @a if cont == 0
        hash2 = @a if cont != 0      
        @hash1.merge!(hash2) {|key, a_val, b_val| a_val.merge b_val } if cont != 0
        cont+=1      
        }
        @hash3 = @hash1 if @cont == 0
        hash4 = @hash1 if @cont != 0      
        @hash3.merge!(hash4) {|key, a_val, b_val| a_val.merge b_val } if @cont != 0
        @cont+=1
        }
        
        File.open(File.join(@pasta,@arq+@ext),'w'){|f|         
        @hash3.each{|h|f.write(JSON.pretty_generate(h))}
        f.close}    
         
        else
          UI.messagebox("materiais no componente #{@material}", MB_OK)
        end
    end
  end
class Model
    def self.New()
      default_style = Sketchup.find_support_file("Materiais.style", "Plugins/3dd/icones/temp")
      styles = Sketchup.active_model.styles
      status = styles.add_style(default_style, true)
      styles.purge_unused

      point = Geom::Point3d.new(0,0,0)
      transform = Geom::Transformation.new(point)
      model = Sketchup.active_model
      entities = model.active_entities
      path = Sketchup.find_support_file("dinamic.skp","Plugins/3dd/icones/temp/")
      definitions = model.definitions
      componentdefinition = definitions.load(path)
      instance = entities.add_instance(componentdefinition,transform) 
      end
      end
class Texture
  def self.New(path)
    #puts "310  path      #{path}"
  @arr = path.split("/")
  comp = @arr.length
  str = @arr.pop
  @arr[5]="Suport_Materiais"
  arr1 = str.split(".")
  @arq = arr1[0]
  @arr << @arq
  new_path = @arr.join("/")
  @pastas = []
#puts "320  new_path    #{new_path}"
  Dir.foreach(new_path){|pasta|
          if pasta !="."  then
            if pasta !=".."  then
              @pastas<<new_path+"/"+pasta
            end
          end
        }
       # puts "328 @pastas     #{@pastas}"
  @pastas.each{|path|
    if path.include?".json" then
      puts " 333 333path    #{path}"
      file = File.read(path)
      file.gsub!("][",",")
      @result = JSON.parse(file)
    end
    if path.include?"_VRayBRDF_TexBitmap_BitmapBuffer.jpg" then
      model = Sketchup.active_model
      materials = model.materials
      @material = materials.add(@arq)
      @material.texture = path
      texture = @material.texture
    end
  }
  
    # puts "===================================================="
    # puts "@result        #{@result}"
    # puts "===================================================="
      #puts "@material   #{@material}"


       attrdicts = @material.attribute_dictionaries

        @attrdict= @material.attribute_dictionary @result[0],true
        @result[1].each{|chave,valor|
          #puts "dict 1 chave  #{chave}    valor  #{valor}"
          @attrdict [chave]=valor}
        @attrdict= @material.attribute_dictionary @result[2],true
        @result[3].each{|chave,valor|
          #puts "dict 2 chave  #{chave}    valor  #{valor}"
          @attrdict [chave]=valor.to_json} 




        #puts "===================================================="
        @arr_teste = []
        attrdicts = @material.attribute_dictionaries
        arr = attrdicts.to_a
        arr.each{|dict| @arr_teste<<dict.name
        dict.each{|c,v| @arr_teste<<c;@arr_teste<<v}
        }  
       # puts "===================================================="
       # puts "===================================================="
       # puts "===================================================="
       # puts "arr1 = ["
       # @arr_teste.each{|t|
       #  puts "#{t.inspect},"}
       # puts "]"
       # puts "===================================================="
       # puts "===================================================="
       # puts "===================================================="

       
  end
end



end