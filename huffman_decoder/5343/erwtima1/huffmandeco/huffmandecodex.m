function [ lekside ] = huffmandecodex( leksi , alphabito , pithanotites )
%prokeimenou na tairiazoun oi diastaseis kanw reshape sto yparxon kai to
%anathetw sto alphab
alphab=reshape(alphabito,length(alphabito),1);
%kalw th Huffman kai arxikopoiw to pinaka
pinakas=Huffman.empty(length(alphabito),0);
%dhmioyrgia tou alphabitou kai twn pithanotitwn
for i=1:length(pithanotites)
    pinakas(i).probability = pithanotites(i);
    pinakas(i).character = alphab(i);
end

%------------------------------------------------------------------------------------------------------------------%




% dhmiourgia toy tree me tosa epipeda oso to to alphabito - 1
for e=1:size(pinakas,2)-1
  
    [~,point] = sort([pinakas.probability],'descend');%prwto kanw sortarisma tis pithanotites kata descending
    pinakas=pinakas(point);%dhmioyrgia neoy shmeiou
    kombos = Huffman;  %dhmioyrgw neo kombo  
    kombos.probability = pinakas(size(pinakas,2)).probability + pinakas(size(pinakas,2)-1).probability;%prosthetw th nea pithanotita
    pinakas(size(pinakas,2)).code = '0';%epeita eisagw to dyadiko kwdiko 0 
    pinakas(size(pinakas,2)-1).code = '1'; %epeita eisagw to dyadiko kwdiko 1
    kombos.leftNode = pinakas(size(pinakas,2)-1); %anathesi aristeros 
    kombos.rightNode = pinakas(size(pinakas,2)); %anathesi deksis kombos
    pinakas = pinakas(1:size(pinakas,2)-2);%delete toys teleytaious 2
    pinakas = [kombos pinakas]; %o neos kombos sto pinaka

end


rootNode = pinakas(1);
%me th char th metatrepw se xarakthres 
leksien = char(leksi);
eksodos='';
lekside='';
%ta e dyadika pou xrhsimopoiithikan
[decleksi,e]=depanalipsi(leksien,rootNode,eksodos,0);





%------------------------------------------------------------------------------------------------------------------%



while ~isempty(leksien)%otan einai keni ta exw perasei ola ta psifia , oso den einai ta pernaw 
    leksien(1:e)=[];%diagrafi 
    lekside=strcat(lekside,decleksi);%union of outputs
    [decleksi,e]=depanalipsi(leksien,rootNode,eksodos,0);%andromiki klisi 

end


end

