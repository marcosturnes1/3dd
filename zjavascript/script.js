
$(".submenu").click(function(){
  $(this).children("ul").slideToggle();
  });
$("ul").click(function(p) {
  p.stopPropagation()   
  });


function empezar(e){
   window.location.href = 'skp:get_t@' +"script.js empezar e "+e ;
   e.dataTransfer.effectAlloowed='move';
   e.dataTransfer.setData("text",e.target.getAttribute('id'));
   var id=e.target.getAttribute(id);
   e.dataTransfer.setDragImage(e.target,0,0);
   window.location.href = 'skp:get_t@' +"script.js empezar ";
   };
function enter(e){
  window.location.href = 'skp:get_t@' +e ;
  window.location.href = 'skp:get_t@' +"script.js enter e "+e ;
   return true;
   };  
function over(e){
   window.location.href = 'skp:get_t@' +"script.js over e "+e ;
   var id=e.target.getAttribute("id");
   var tagimg= document.getElementById(id);
   var div=tagimg.parentNode;
   var id1=div.getAttribute("id");
   var esarrastrable=e.dataTransfer.getData("text");
    for(var i = 0, length1 = 20; i < length1; i++) {
       if (id== "div"+i)
       return false;
       }
     };
function drop(e){
   window.location.href = 'skp:get_t@' +"script.js drop e "+e ;

   var iddest=e.target.getAttribute('id');
   var esarrastrable=e.dataTransfer.getData("text");
   var tagimg= document.getElementById(esarrastrable);
   var div=tagimg.parentNode;
   var divmove=div.getAttribute("id");
   var tagimgdest= document.getElementById(iddest);
   var divdest=tagimgdest.parentNode;
   var iddivdest=divdest.getAttribute("id");
   var pai=document.getElementById(iddivdest);
   var filho=document.getElementById(iddest);
   pai.removeChild(filho);

   var pai1=document.getElementById(divmove)
   var filho1=document.getElementById(esarrastrable);
   pai1.removeChild(filho1);
   var posicao1=document.getElementById(divmove);
   posicao1.appendChild(tagimgdest);
   var posicao=document.getElementById(iddivdest);
   posicao.appendChild(tagimg);
   window.location.href = 'skp:get_t@' +"script.js drop ";
   };
