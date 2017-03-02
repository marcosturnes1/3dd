#require_relative 'config.rb'
require_relative 'html.rb'
require 'sketchup.rb'
#require_relative 'perfil.rb'
#require_relative 'dimencao.rb'



class Controler
	def initialize
Sketchup.active_model.layers.add_observer(MyLayersObserver.new)
#Sketchup.active_model.materials.add_observer(MyMaterialsObserver.new)
#Sketchup.active_model.selection.add_observer(MySelectionObserver.new)
Sketchup.active_model.active_view.add_observer(MyViewObserver.new)
#Sketchup.active_model.add_observer(MyModelObserver.new)
rendering_options = Sketchup.active_model.rendering_options
rendering_options.add_observer(MyRenderingOptionsObserver.new)
#Sketchup.active_model.pages.add_observer(MyPagesObserver.new)
options_provider = Sketchup.active_model.options["UnitsOptions"]
options_provider.add_observer(MyOptionsProviderObserver.new)
#Sketchup.active_model.definitions[0].add_observer(MyDefObserver.new)
#Sketchup.active_model.definitions.add_observer(MyDefinitionsObserver.new)
#Sketchup.active_model.entities.add_observer(MyEntitiesObserver.new)
#Sketchup.active_model.entities[0].add_observer(MyEntityObserver.new)
#if !$html then
	$html= Html.new 
	$html.Webdialog()
#end


	end
end
class MyLayersObserver < Sketchup::LayersObserver
	def onLayerAdded(layers, layer)
		$html.AddLayer(layer.name)
	end
	def onCurrentLayerChanged(layers, layer)
		$html.SetLayer(layer.name)
	end
	def onLayerChanged(layers, layer)
	  puts "onLayerChanged: #{layer.name}"
	end
	def onLayerRemoved(layers, layer)
		$html.RemoveLayer(layer.name)
	end
	def onRemoveAllLayers(layers)
	    puts "onRemoveAllLayers: #{layers}"
	end
	end
class MyMaterialsObserver < Sketchup::MaterialsObserver
	  def onMaterialAdd(materials, material)
	    puts "onMaterialAdd: #{material}"
	  end
		def onMaterialChange(materials, material)
		  puts "onMaterialChange: #{material}"
		end
		def onMaterialRefChange(materials, material)
		  puts "onMaterialRefChange: #{material}"
		end
		def onMaterialRemove(materials, material)
		  puts "onMaterialRemove: #{material}"
		end
		def onMaterialSetCurrent(materials, material)
		  puts "onMaterialSetCurrent: #{material}"
		end
		def onMaterialUndoRedo(materials, material)
		  puts "onMaterialUndoRedo: #{material}"
		end

		end
class MySelectionObserver < Sketchup::SelectionObserver
  def onSelectionAdded(selection, entity)
  puts "onSelectionAdded: #{entity}"
	end
  def onSelectionBulkChange(selection)
    puts "======onSelectionBulkChange: #{selection}"

    	  	#Dimencao.new(selection)
    	 


  end
  def onSelectionCleared(selection)
  puts "onSelectionCleared: #{selection}"
	end
	def onSelectionRemoved(selection, entity)
    puts "onSelectionRemoved: #{entity}"
  end
	end
class MyViewObserver < Sketchup::ViewObserver
  def onViewChanged(view)  	
  	
  	camera = view.camera
  	ar = camera.aspect_ratio
  	#puts "ar   #{ar}"
  	#puts "camera #{camera}"
  	direction = camera.direction
  	#puts "direction   #{direction}"
  	up = camera.up
  	#puts "up    #{up.inspect}"
  	#h = camera.height
  	#puts "h    #{h.inspect}"
  	w = camera.image_width
  	#puts "w   #{w.inspect}"
  	zaxis = camera.zaxis
  	#puts "zaxis    #{zaxis.inspect}"
  	eye = camera.eye
  	#puts "eye #{eye.inspect}"
  	c = view.center
  	#puts "c #{c}"
  	status4 = camera.perspective?
  	#puts "status4   #{status4.inspect}"
  	  	
	fov = Sketchup.active_model.active_view.field_of_view
	#puts "fov #{fov.inspect}"
	target = view.guess_target
	#puts "target #{target.inspect}"
	
	point = view.screen_coords(ORIGIN)
	#puts "point #{point}"	
	
	#puts "======================================================="
	

  	#view.each{|chave,valor|puts "#{chave.inspect}=>#{valor.inspect}"}
    puts "onViewChanged: #{view}"
  end
	end
class MyModelObserver < Sketchup::ModelObserver
	def onPlaceComponent(instance)
	    puts "onPlaceComponent: #{instance}"
	  end
	def onActivePathChanged(model)
	  puts "onActivePathChanged: #{model}"
		end

	def onAfterComponentSaveAs(model)
	  puts "onAfterComponentSaveAs: #{model}"
	end
	def onBeforeComponentSaveAs(model)
	  puts "onBeforeComponentSaveAs: #{model}"
	end
	def onDeleteModel(model)
	  puts "onDeleteModel: #{model}"
	end
	def onEraseAll(model)
	  puts "onEraseAll: #{model}"
	end
	def onExplode(model)
	  puts "onExplode: #{model}"
	end
	def onPidChanged(model, old_pid, new_pid)
	  puts "onPidChanged: #{model}, #{old_pid} => #{new_pid}"
	end
	def onPlaceComponent(model)
	  puts "onPlaceComponent: #{model}"
	end
	def onPostSaveModel(model)
	  puts "onPostSaveModel: #{model}"
	end
	def onPreSaveModel(model)
	  puts "onPreSaveModel: #{model}"
	end
	def onSaveModel(model)
	  puts "onSaveModel: #{model}"
	end
	def onTransactionAbort(model)
	  puts "onTransactionAbort: #{model}"
	end
	def onTransactionCommit(model)
	  puts "onTransactionCommit: #{model}"
	end
	def onTransactionEmpty(model)
	  puts "onTransactionEmpty: #{model}"
	end
	def onTransactionRedo(model)
	  puts "onTransactionRedo: #{model}"
	end
	def onTransactionStart(model)
	  puts "onTransactionStart: #{model}"
	end
	def onTransactionUndo(model)
	  puts "onTransactionUndo: #{model}"
	end


	end
class MyRenderingOptionsObserver < Sketchup::RenderingOptionsObserver
  def onRenderingOptionsChanged(rendering_options, type)
  	
	@hash1 ={"BackgroundColor" => "Color(204, 204, 201, 255)","BandColor" => "Color(  0,   0,   0, 127)","ConstructionColor" => "Color(  0,   0,   0, 255)",
	"DepthQueWidth" => 4,"DisplayColorByLayer" => false,"DisplayDims" => true,"DisplayFog" => false,"DisplayInstanceAxes" => false,
	"DisplaySectionCuts" => true,"DisplaySectionPlanes" => false,"DisplaySketchAxes" => true,"DisplayText" => true,"DisplayWatermarks" => true,
	"DrawBackEdges" => false,"DrawDepthQue" => false,"DrawGround" => false,"DrawHidden" => false,"DrawHorizon" => true,"DrawLineEnds" => false,
	"DrawProfilesOnly" => false,"DrawSilhouettes" => true,"DrawUnderground" => true,"EdgeColorMode" => 1,"EdgeDisplayMode" => 1,"EdgeType" => 0,
	"ExtendLines" => false,"FaceBackColor" => "Color(164, 178, 187, 255)","FaceColorMode" => 0,"FaceFrontColor" => "Color(255, 255, 255, 255)",
	"FogColor" => "Color(204, 204, 201, 255)","FogEndDist" => -1.0,"FogStartDist" => -1.0,"FogUseBkColor" => true,"ForegroundColor" => "Color(  0,   0,   0, 255)",
	"GroundColor" => "Color(210, 208, 185, 255)","GroundTransparency" => 50,"HideConstructionGeometry" => false,"HighlightColor" =>" Color(  0,   1, 255, 255)",
	"HorizonColor" => "Color(  0,   0,   0,   0)","InactiveFade" => 0.25,"InactiveHidden" => false,"InstanceFade" => 0.5,
	"InstanceHidden" => false,"JitterEdges" => false,"LineEndWidth" => 7,"LineExtension" => 2,"LockedColor" => "Color(255,   0,   0, 255)",
	"MaterialTransparency" => true,"ModelTransparency" => false,"RenderMode" => 2,"SectionActiveColor" => "Color(255, 135,   0, 255)",
	"SectionCutDrawEdges" => true,"SectionCutWidth" => 3,"SectionDefaultCutColor" => "Color(  0,   0,   0, 255)","SectionInactiveColor" => "Color(112, 105,  97, 255)",
	"ShowViewName" => true,"SilhouetteWidth" => 2,"SkyColor" => "Color(198, 205, 208, 255)","Texture" => true,"TransparencySort" => 0}
	rendering_options.each_pair { |key, value|
	  puts "#{key.inspect}  padrao=>#{@hash1[key]} : #{value}"if @hash1[key] !=value
	}

    puts "onRenderingOptionsChanged(#{rendering_options}, #{type})"
  end
class MyPagesObserver < Sketchup::PagesObserver
	def onElementAdded(pages, page)
	    puts "onElementAdded: #{page}"
	  end
	def onContentsModified(pages)
	  puts "onContentsModified: #{pages}"
	end
	def onElementAdded(pages, page)
	  puts "onElementAdded: #{page}"
	end
	def onElementRemoved(pages, page)
	  puts "onElementRemoved: #{page}"
	end
	end
	end
class MyOptionsProviderObserver < Sketchup::OptionsProviderObserver
  def onOptionsProviderChanged(provider, name)
    puts "onOptionsProviderChanged: #{name}"
  end
	end
class MyDefObserver < Sketchup::DefinitionObserver
	def onComponentInstanceAdded(definition, instance)
	    puts "onComponentInstanceAdded(#{definition}, #{instance})"
	  end
	def onComponentInstanceRemoved(definition, instance)
	  puts "onComponentInstanceRemoved(#{definition}, #{instance})"
	end
	end
class MyDefinitionsObserver < Sketchup::DefinitionsObserver
	def onComponentAdded(definitions, definition)
	    puts "onComponentAdded: #{definition.name}"
	  end
	def onComponentPropertiesChanged(definitions, definition)
	  puts "onComponentPropertiesChanged: #{definition}"
	end
	def onComponentRemoved(definitions, definition)
	  puts "onComponentRemoved: #{definition}"
	end
	def onComponentTypeChanged(definitions, definition)
	  puts "onComponentTypeChanged: #{definition}"
	end

	end
class MyEntitiesObserver < Sketchup::EntitiesObserver
	def onElementAdded(entities, entity)
	    puts "onElementAdded: #{entity}"
	  end
	def onActiveSectionPlaneChanged(entities)
	  sp = entities.active_section_plane
	  if sp.nil?
	    puts "Section plane is deactivated on #{entities}"
	  else
	    puts "#{sp} is activated on #{entities}"
	  end
	end
	def onElementModified(entities, entity)
	  puts "onElementModified: #{entity}"
	end
	def onElementRemoved(entities, entity_id)
	  puts "onElementRemoved: #{entity_id}"
	end
	def onEraseEntities(entities)
	  puts "onEraseEntities: #{entities}"
	end
	end
class MyEntityObserver < Sketchup::EntityObserver
	def onEraseEntity(entity)
	    puts "onEraseEntity: #{entity}"
	  end
	def onChangeEntity(entity)
	  puts "onChangeEntity: #{entity}"
	end
	end


# 	puts "teste     inicio"

# 	if( not $DM_Create_Loaded)
#     add_separator_to_menu("Plugins")
#     UI.menu("Plugins").add_item("3d-dynamic"){ Controler.new}
#     $DM_Create_Loaded = false
    
# end
# #-----------------------------------------------------------------------------
# file_loaded("controler.rb")