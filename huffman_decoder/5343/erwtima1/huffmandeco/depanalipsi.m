function [ eksodos,e ] = depanalipsi( leksi ,tempNode,eksodos,e )

%trexon kombos->leksi pros kwdikopoihsh
if  ~isempty(leksi) && ~isempty(tempNode.character)
    eksodos=tempNode.character;
    e=e;
    return
    
elseif isempty(leksi)
    eksodos=tempNode.character;
    e=e;
    return
end

%deksis kombos
%an to dyadiko psifio einai 0
%ayksanw ta psifia pou exoun prospelastei
%gia to gramma pou diabasa meiwnw thn eisodo 
%kai deixnw sto deksi kombo
if ~isempty(tempNode) && strcmp(leksi(1),'0') && ~isempty(tempNode.rightNode)
    e=e+1;
    leksi(1)=[];
    [eksodos,e]=depanalipsi(leksi,tempNode.rightNode,eksodos,e);

    
    

%aristeros kombos   
%an to dyadiko psifio einai 1
%ayksanw ta psifia pou exoun prospelastei
%gia to gramma pou diabasa meiwnw thn eisodo 
%kai deixnw ston aristero kombo
elseif ~isempty(tempNode) && strcmp(leksi(1),'1') && ~isempty(tempNode.leftNode)
    e=e+1;
    leksi(1)=[];
    [eksodos,e]=depanalipsi(leksi,tempNode.leftNode,eksodos,e);
    
end
    
end



