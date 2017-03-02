require 'sketchup.rb'
require  "mysql2"



module Dados
	class MYSQL
		def initialize
			@client = Mysql2::Client.new(:host=>"localhost",:username=>"root")
    		@use = "USE dinamic"
    		@client.query(@use)
		end
def List_config()
    result = @client.query("SELECT chave,valor FROM config")
    @config ={}
    result.each{|rest| arr = rest.to_a
     @config[arr[0][1]] = arr[1][1]      
    }  
    return @config
    end


	end
class Pastas
	def self.List(tp)
		@path= ENV["home"]+"/documents/3d_dynamic/"+tp
		@pg = [];@lg = [];@bt = [];@arq = []

		Dir.foreach(@path){|pg|
          if pg !="."  then
            if pg !=".."  then
              @pg<<@path+"/"+pg
            end
          end
        }        
      @pg.each{|path1|
        Dir.foreach(path1){|lg|
          if lg !="." then
            if lg !=".." then
              @lg<<path1+"/"+lg
            end
          end
        }
      }
      @lg.each{|path1|
        Dir.foreach(path1){|bt|
          if bt !="." then
            if bt !=".." then
              @bt<<path1+"/"+bt
            end
          end
        }
      }
      @bt.each{|path1|
        Dir.foreach(path1){|arq|
          if arq !="." then
            if arq !=".." then
              	@arq<<path1+"/"+arq if !arq.include?(".skb")
            end
          end
        }
      }
    return @arq
	end

end
end