var inputs = document.getElementsByTagName("div");
for(i=0;i<inputs.length;i++){
    try{
        inputs[i].onmouseover = function(){console.log("teste");}
    }catch(e){

    }
}