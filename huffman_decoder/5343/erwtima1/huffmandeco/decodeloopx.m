function [ eksodos,e ] = decodeloopx( leksi ,tempNode,eksodos,e )


if  ~isempty(leksi) && ~isempty(tempNode.character)
    eksodos=tempNode.character;
    e=e;
    return
    
elseif isempty(leksi)
    eksodos=tempNode.character;
    e=e;
    return
end

if ~isempty(tempNode) && strcmp(leksi(1),'0') && ~isempty(tempNode.rightNode)
    e=e+1;
    leksi(1)=[];
    [eksodos,e]=decodeloopx(leksi,tempNode.rightNode,eksodos,e);
    
elseif ~isempty(tempNode) && strcmp(leksi(1),'1') && ~isempty(tempNode.leftNode)
    e=e+1;
    leksi(1)=[];
    [eksodos,e]=decodeloopx(leksi,tempNode.leftNode,eksodos,e);
    
end
    
end



