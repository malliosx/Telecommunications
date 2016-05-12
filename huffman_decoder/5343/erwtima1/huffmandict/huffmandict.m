function [ kwdik ] = huffmandict(alphabito,pithanotites)

%prokeimenou na tairiazoun oi diastaseis kanw reshape sto yparxon kai to
%anathetw sto alphab
alphab=reshape(alphabito,length(alphabito),1);
%kalw th Huffman kai arxikopoiw to pinaka
pinakas=Huffman.empty(length(alphabito),0);
%dhmioyrgia tou alphabitou kai twn pithanotitwn
for k=1:length(pithanotites)
    pinakas(k).probability = pithanotites(k);
    pinakas(k).character = alphab(k);
end


%------------------------------------------------------------------------------------------------------------------%


% dhmiourgia toy tree me tosa epipeda oso to to alphabito - 1
for k=1:size(pinakas,2)-1
  
    [~,point] = sort([pinakas.probability],'descend');%prwto kanw sortarisma tis pithanotites kata descending
    pinakas=pinakas(point);%dhmioyrgia neoy shmeiou
    kombos = Huffman;  %dhmioyrgw neo kombo  
    kombos.probability = pinakas(size(pinakas,2)).probability + pinakas(size(pinakas,2)-1).probability;%prosthetw th nea pithanotita
     pinakas(size(pinakas,2)).code = '0';%epeita eisagw to dyadiko kwdiko 0 
     pinakas(size(pinakas,2)-1).code = '1'; %epeita eisagw to dyadiko kwdiko 1
    kombos.leftNode = pinakas(size(pinakas,2)-1); 
    kombos.rightNode = pinakas(size(pinakas,2));
    pinakas = pinakas(1:size(pinakas,2)-2);%delete toys teleytaious 2
    pinakas = [kombos pinakas]; %o neos pinakas

end
 
rootNode = pinakas(1);%h riza tha einai to prwto stoixeio 
kwd = char.empty;
eksodos=cell.empty;



%--------------------------------------------------------------------------------------------------%
%kathe fora h dhmioyrgia toy tree ginetai epanlhptika apo arxikopoiithei h
%riza  kalw th synarthsh 'epanalipsi' dinontas ths ws eisodo th riza to
%kwd kai thn eksodo

eksodos=epanalipsi(rootNode,kwd,eksodos);
kwdik=cell2table(eksodos,'VariableNames',{'Letter','Encoding','Propability'});
kwdik=sortrows(kwdik,1);%sortarw tis grammes toy pinaka

end