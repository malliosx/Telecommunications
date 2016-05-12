function [ leksien ] = huffmanencodex( leksi , alphabito , pithanotites )

%dhmiourgia eisodou me th huffmandict
eisodos = huffmandict(alphabito,pithanotites);
%arxikopoihsh ths kwdikopoihmenhs leksis
leksien='';



%---------------------------------------------------%



%an dialeksw na kwdikopoihsw ana dyadiko psifio
if iscell(alphabito) == 0 

for p=1:length(leksi)

    for k=1:length(alphabito)
        
        if strcmp(leksi(p),eisodos.Letter(k)) 
            %kwdikopoihsh
            leksien=strcat(leksien,eisodos.Encoding(k));  
           
        end
        
    end
    
end



%---------------------------------------------------%



%an dialeksw na kwdikopoihsw me 2hs takshs epekstash
else 
    
    for p=1:2:length(leksi) % bhma 2 -> 1:2:length

    for k=1:length(alphabito)
        
        %kwdikopoiw ana dyo -> p+1
        if strcmp(leksi(p:p+1),eisodos.Letter(k))
            
            leksien=strcat(leksien,eisodos.Encoding(k));  
           
        end
        
    end
    
    end
    
end
    



