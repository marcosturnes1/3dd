
require 'rubygems'
require 'sketchup.rb'
require  "mysql2"

 #require 'mysql'
#Bundler.require
class Arquivo 
  def initialize
    @path="C:/Users/user/Documents/3d_dynamic/"
    @client = Mysql2::Client.new(:host=>"localhost",:username=>"root")
    use = "USE dinamic"
    @client.query(use)
    @list_arm=[]
    @list_dict_atr=[]
    @list_atr=[]
    @list_config=[]
    @pastas=[]
    @list_mat=[]
    end
def Access_Update(hash,table)
    #puts "arquivo.rb Access_Update --- #{hash}"
    @conexao.Open(@connection)
    recordset = WIN32OLE.new('ADODB.Recordset')
    hash.each{|chave,valor|
      #puts "UPDATE #{table} SET valor='#{valor}' WHERE chave='#{chave}'"
      sql="UPDATE #{table} SET valor='#{valor}' WHERE chave='#{chave}'"
      recordset.Open(sql,@conexao)
    }
    @conexao.close
    #puts "Access_Update"

  end
def Access_Writh(hash,table)
    #puts "Access_Writh --- hash --- table "
    @conexao.Open(@connection)
    hash.each{|chave,valor|
      #puts "INSERT INTO teste (chave,valor) VALUES ('#{chave}','#{valor}')"
      @conexao.Execute("INSERT INTO teste (chave,valor) VALUES ('#{chave}','#{valor}')")
    }
    @conexao.close
    #puts "Access_Writh"
  end
def Access_Atr_Init()
    #puts "Access_atr"
    arr=[]

    sql="SELECT chave,valor FROM DictAtr where DictAtr.grupo='init'"
    @conexao.Open(@connection)
    recordset = WIN32OLE.new('ADODB.Recordset')
    recordset.Open(sql, @conexao)
    recordset.getrows.each { |row| @list_config<<row}
    chave=@list_config[0];valor=@list_config[1];cont=0
    chave.each {|e| arr<<e;arr<<valor[cont];cont=cont+1}
    hash= Hash[*arr]
    @conexao.close
    return hash
  end
def Access_Atr_Group(nome)
    @arr=[]
    @arr_id=[]
    @arr_pref=[]
    @list_config=[]
    puts "Access_Atr_Group nome ==== #{nome}"
    @conexao.Open(@connection)
    recordset = WIN32OLE.new('ADODB.Recordset')
    sql="SELECT idpref FROM ListAtr WHERE listpref='#{nome}'"
    recordset.Open(sql, @conexao)
    recordset.getrows.each { |id| @id=id}

    sql="SELECT idPref FROM RelArmListAtr WHERE idArm=#{@id[0]}"
    recordset = WIN32OLE.new('ADODB.Recordset')
    recordset.Open(sql, @conexao)
    recordset.getrows.each { |row| @arr_id<<row}

    @arr_id[0].each{|id|
      sql="SELECT listpref FROM ListAtr WHERE idpref=#{id}"
      recordset = WIN32OLE.new('ADODB.Recordset')
      recordset.Open(sql, @conexao)
      recordset.getrows.each { |row| @arr_pref<<row}
    }
    v=@arr_pref.join("','")
    s="('"+v+"')"


    sql="SELECT chave,valor FROM DictAtr where DictAtr.grupo in #{s}"
    #puts "#{sql}"
    recordset = WIN32OLE.new('ADODB.Recordset')
    recordset.Open(sql, @conexao)
    recordset.getrows.each { |row| @list_config<<row}
    chave=@list_config[0];valor=@list_config[1];cont=0
    chave.each {|e|@arr<<e;@arr<<valor[cont];cont=cont+1}


    hash= Hash[*@arr]
    @conexao.close
    # puts "======================================================="
    # puts "Access_Atr_Group --- #{hash}"
    # puts "======================================================="

    return hash
  end
def List_config()
    result = @client.query("SELECT chave,valor FROM config")
    @config ={}
    result.each{|rest| arr = rest.to_a
     @config[arr[0][1]] = arr[1][1]      
    }  
    return @config
    end
def Configuracao(armario)

      @conexao.Open(@connection)
      recordset = WIN32OLE.new('ADODB.Recordset')
      sql="SELECT idArm FROM Arm WHERE NomeArm='#{armario}'"
      recordset.Open(sql, @conexao)
      recordset.getrows.each { |id| @id_tipo=id}

      recordset = WIN32OLE.new('ADODB.Recordset')
      sql="SELECT p.idPeca,p.peca, p.stagio FROM Peca p INNER JOIN RelArmPeca rel ON rel.idPeca = p.idPeca where rel.idArm = #{@id_tipo[0]}"
      @list_pecas=[]
      recordset.Open(sql, @conexao)
      recordset.getrows.each { |row| @list_pecas<<row}
      @conexao.close
      id_pecas=@list_pecas[0];nome_comp=@list_pecas[1];stagio=@list_pecas[2]
      cont=0
      @config=[]
      @list_pecas[1].each{|nome_comp|
        arr=["nome_peca",nome_comp,"stagio",@list_pecas[2][cont]]
        @config<<arr
        cont+=1
      }

      cont1=0
      @conexao.Open(@connection)
      id_pecas.each {|id|
        recordset = WIN32OLE.new('ADODB.Recordset')
        sql="SELECT a.pref,a.perfil,a.material,a.comp,a.larg,a.esp,a.angle,a.vetor,a.angle1,a.vetor1,a.posicao FROM Atr a where a.idPeca = #{id}"
        recordset.Open(sql, @conexao)
        x=0
        recordset.getrows.each { |row|
          case x
          when 0; @config[cont1]<<"pref";@config[cont1]<<row[0]
          when 1; @config[cont1]<<"perfil";@config[cont1]<<row[0]
          when 2; @config[cont1]<<"material";@config[cont1]<<row[0]
          when 3; @config[cont1]<<"comp";@config[cont1]<<row[0]
          when 4; @config[cont1]<<"larg";@config[cont1]<<row[0]
          when 5; @config[cont1]<<"esp";@config[cont1]<<row[0]
          when 6; @config[cont1]<<"angle";@config[cont1]<<row[0]
          when 7; @config[cont1]<<"vetor";@config[cont1]<<row[0]
          when 8; @config[cont1]<<"angle1";@config[cont1]<<row[0]
          when 9; @config[cont1]<<"vetor1";@config[cont1]<<row[0]
          when 10; @config[cont1]<<"posicao";@config[cont1]<<row[0]
          end
          x+=1
        }
        recordset = WIN32OLE.new('ADODB.Recordset')
        #sql="SELECT DictAtr.chave,DictAtr.valor FROM DictAtr INNER JOIN RelPecaDictAtr rel ON rel.idDictAtr = DictAtr.idDictAtr where rel.idPeca = #{id}"
        sql="SELECT chave,valor FROM DictAtr where grupo = '#{@list_pecas[1][cont1]}'"
        #puts "#{sql}"
        recordset.Open(sql, @conexao)
        j=0
        recordset.getrows.each { |atr|
          case j
          when 0;@chave=atr;j=1
          when 1;@valor=atr;j=0
          end
        }
        k=0
        @atributos={}
        @chave.each{|v| @atributos[v]=@valor[k];k+=1}
        @config[cont1]<<"atributos"
        @config[cont1]<<@atributos
        cont1+=1
      }
      @conexao.close
      var=0
      @lista=[]
      @config.each{|arr|
        @hash={}
        arr.each{|valor|
          if var==0 then
            @key=valor
            var=1
          else
            @hash[@key]=valor
            var=0
          end
        }
        @lista<<@hash

      }
      @lista<<@id_tipo[0]
      #puts "arquivo.rb configuracao "
      return @lista
    end
def Pastas(path)
      # puts "Arquivo.rb Pastas __________ #{path}"
      @list_button=[];@legend=[];@radio=[];@lista=[]
      
    if path == "Materiais"then     
        Dir.foreach(@path+path){|pasta|
          if pasta !="."  then
            if pasta !=".."  then
              @pastas<<@path+path+"/"+pasta
            end
          end
        }
    else 
      @pastas = [@path+path]
    end
      @pastas.each{|path1|
        Dir.foreach(path1){|leg|
          if leg !="." then
            if leg !=".." then
              @legend<<path1+"/"+leg

            end
          end
        }
      }

      @legend.each {|path2|Dir.foreach(path2) {|radio|
          if radio !="." then
            if radio !=".." then
              @radio <<path2+"/"+radio

            end
          end
        }
        @list_button+=@radio.to_a
        @radio.clear
      }      
      @list_button.each{|path3|
        Dir.foreach(path3) {|mat|
          if mat !="." then
            if mat !=".."  then
              if !mat.include?(".skb")then
                @list_mat<<path3+"/"+mat

              end
            end
          end
        }
      }
      
      #puts "Arquivo.rb List_Img --- @list_mat === #{@list_mat}"
      #puts "================================================"
      return @list_mat
    end
    def Excel_Read()
      #puts "Arquivo.rb Excel_Read"
      #excel = WIN32OLE.connect('excel.Application')
      @arr=[]
      excel = WIN32OLE.new("excel.application")
      book = excel.workbooks.Open(@excel)
      excel.visible = true;
      sheets = book.worksheets("config");
      cells = sheets.Range("a1:b31").value;
      cells.each{|c| @arr+=c}
      @hash= Hash[*@arr]
      excel.ActiveWorkbook.Close(0);
      excel.Quit();
      #puts "Arquivo.rb Excel_Read --- hash"
      return @hash
    end
    def Excel_Writh(hash)
      #puts "Arquivo.rb Excel_Writh --- hash"
      arr1=[]
      hash.each{|chave,valor| arr=[]
        arr<<chave;arr<<valor
      arr1<<arr }
      excel = WIN32OLE.connect("excel.application")
      book = excel.workbooks.Open(@excel);
      excel.visible = true;
      sheets = book.worksheets("config");
      cont=1
      arr1.each{|val| sheets.Range("a#{cont}:b#{cont}").value=val;
      cont+=1}
      book.save() ;
      excel.ActiveWorkbook.Close(0);
      excel.Quit();
      #puts "Arquivo.rb Excel_Writh"
    end
  end
