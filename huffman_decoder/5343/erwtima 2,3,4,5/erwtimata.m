
%%---------!!!!!!!!! Erwtima 2   !!!!!!!!--------------------------%%
clear 
clc

%%%%%---------- 1h phgh-------------%%%%%%%%%%%%%%%%%%
%arxikopoihses gia sygkrisi 
alphaeisa='';
dyadikoisa='';
elegxeisa='';

%pithanotites apo wikipedia
pithanotites=[0.08167  0.01492  0.02782  0.04253   0.12702   0.02228  0.02015 0.06094 0.06966  0.00153 0.00772 0.04025 0.02406 0.06749 0.07507 0.01929 0.00095 0.05987 0.06327 0.09056 0.02758 0.00978 0.02361 0.00150 0.01974 0.00074];
% arxikopoihsh to aggliko alfabito 
alphab='abcdefghijklmnopqrstuvwxyz';
%26 theseis gia to kathe gramma
alphabin=[1:26];

%dhmiourgia random pigis A symfwna me ta dedomena
pigiA=randsrc(100,100,[alphabin;pithanotites]);
pigiA=reshape(pigiA,10000,1);
pigiA=num2cell(pigiA,[1 10000]);
%anathesi se cell array
Akelli = cell([10000 3]);

t = 1 ;
while t < size(pigiA{1,1},1)
    
    Akelli{t,1}=alphab(pigiA{1,1}(t));
  t = t+1 ;
end

k = 1 ;
while k < size(Akelli,1)
    
    alphaeisa=strcat(alphaeisa,Akelli{k,1});
    k = k+1;
end

%klisi ths huffmanencodex huffmandecodex me ta parapanw inputs
dyadikoisa=huffmanencodex(alphaeisa,alphab,pithanotites);
elegxeisa=huffmandecodex(dyadikoisa,alphab,pithanotites);
    
if strcmp(alphaeisa,elegxeisa)==1  %sygkrisi twn string an ==1 tote h pigi A kwdikopoiei kai apodikwpoiei
    
   disp('Mpike sto if ara h pigi A einai ok!')
    
end




%%%%%---------- 2h phgh----- exei to idio alphabito me thn 1h--------%%%%%%%%%%%%%%%%%%
%arxikopoihseis kenwn char
alphaisb='';
dyadikoisb='';
elegxeisb='';

%anoigma me ton file pointer toy arxeiou pou dinetai 
fid=fopen('withoutkwords.txt','r');
Bkelli=textscan(fid,'%s');%diabasma
fclose(fid);%kleisimo

h = 1;
while  h < size(Bkelli{1,1},1)
    
    alphaisb=strcat(alphaisb,Bkelli{1,1}{h,1});
    h = h+1;
end

%klisi ths huffmanencodex huffmandecodex me ta parapanw inputs
%gia th phgh b twra
dyadikoisb=huffmanencodex(alphaisb,alphab,pithanotites);
elegxeisb=huffmandecodex(dyadikoisb,alphab,pithanotites);
    
if strcmp(alphaisb,elegxeisb)==1 %sygkrisi twn string an ==1 tote h pigi b kwdikopoiei kai apodikwpoiei
    
   disp(' Mpike sto if ara H pigi B einai ok!')
    
end

%to apotelesna ths huffmandict
dictres=huffmandict(alphab,pithanotites);
L=0;
y = 1 ;
while y < size(dictres,1)
    
    chen=char(dictres.Encoding(y));
    %ypologismos mikos l symfwna me ton typo
    L=L+length(chen)*pithanotites(y);
    y = y+1;
end





%-------------------------------------------------------------------------------------------%


%%---------!!!!!!!!! Erwtima 3  !!!!!!!!--------------------------%%
clear 
clc 

%arxikopoihses gia sygkrisi 
alphaeisa='';
dyadikoisa='';
elegxeisa='';

%------pigi B ------------------------------------------------------
%anoigma arxeiou
fid=fopen('kwords.txt');
%diabasma
Bkelli=textscan(fid,'%s');
%kleisimo
fclose(fid);






% arxikopoihsh to aggliko alfabito mazi me ta kefalaia kai ta  symbola 
alphab='-./''abcdefghijklmnopqrstuvwxyz';
% arxikopoihsh gia tis emfaniseis 
events=zeros(length(alphab),1);
% arxikopoihsh gia tis pithanotites emnfanishs
pithanotites=zeros(length(alphab),1);
grammata=0;


for   i = 1: length(alphab)
   
    for j = 1:  size(Bkelli{1,1},1)
        %diatrexw gia na brw tis emfaniseis
        events(i,1)=events(i,1)+sum(length(strfind(Bkelli{1,1}{j,1},alphab(i))));
    
    end

 end

for x = 1: size(Bkelli{1,1},1)
   %ta grammata mesa sto keimeno
    grammata=grammata+length(Bkelli{1,1}{x,1});
    
end


for p = 1: length(alphab)
    %pithanotita emfanisis = arithmos / grammata
    pithanotites(p,1)=events(p,1)/grammata;
    
end


for x = 1 : size(Bkelli{1,1},1)
    
    alphaeisa=strcat(alphaeisa,Bkelli{1,1}{x,1});
   
end

%klisi twn huffmanencodex kai huffmandecodex
dyadikoisa=huffmanencodex(alphaeisa,alphab,pithanotites);
elegxeisa=huffmandecodex(dyadikoisa,alphab,pithanotites);
%apotelesma ths  huffmandict
dictres=huffmandict(alphab,pithanotites);
dictres=sortrows(dictres,{'Propability'},{'ascend'});
pithanotites=sort(pithanotites);
L=0;


for   y = 1: size(dictres,1)
    
    chen=char(dictres.Encoding(y));
    %T meso mikos symfwna me ton typo
    L=L+length(chen)*pithanotites(y)
    
end




%----------------------------------------------------------------------------------%
%%---------!!!!!!!!! Erwtima 4  !!!!!!!!--------------------------%%
clear
clc



%arxikopoihseis
alphaeisa='';
dyadikoisa='';
elegxeisa='';

%pithanotites apo wikipedia
pithanothtes=[0.08167  0.01492  0.02782  0.04253   0.12702   0.02228  0.02015 0.06094 0.06966  0.00153 0.00772 0.04025 0.02406 0.06749 0.07507 0.01929 0.00095 0.05987 0.06327 0.09056 0.02758 0.00978 0.02361 0.00150 0.01974 0.00074];
% arxikopoihsh to aggliko alfabito 
alfavito='abcdefghijklmnopqrstuvwxyz';




%2hs taksis epektasi pigis 
alphab=cell.empty(length(alfavito)^2,0);
pithanotites=zeros(length(alfavito)^2,1);
a=0;

for i=1:length(alfavito)
    
    for j=1:length(alfavito)
    
    alphab{a+j,1}=[alfavito(i) alfavito(j)];
    pithanotites(a+j,1)=pithanothtes(i)*pithanothtes(j);
        
    end
    %symplorwnw kata a ta kelia wste na parw ena dyo toys xaraktires
    a=a+j; 
    
end

alphain=1:1:size(alphab,1);
%pigi A me 5000 zeygi 
pigiA=randsrc(5000,1,[alphain;pithanotites']);
Akelli=cell([5000 3]);

for i=1:length(pigiA)
 
    Akelli{i,1} = alphab(pigiA(i,1));
  
end



for a=1:size(Akelli,1)
    
    alphaeisa=strcat(alphaeisa,Akelli{a,1});
    
end
%casting se char
alphaeisa=char(alphaeisa);

dyadikoisa=huffmanencodex(alphaeisa,alphab,pithanotites);
elegxeisa=huffmandecodex(dyadikoisa,alphab,pithanotites);

%apotelesma ths huffmandictation
dictres=huffmandict(alphab,pithanotites);
L=0;
s=1;
while  s < size(dictres,1)
    
    chen=char(dictres.Encoding(s));
    %typos MESO MHKOS
    L=L+length(chen)*pithanotites(s)

  
    
    s = s+1 ; 
end

%L = Ln /2  n-osti epektasi 
    L=L/2;



%%---------!!!!!!!!! Erwtima 5  !!!!!!!!--------------------------%%
clear
clc
 
%arxikopoihseis
alphaeisa='';
dyadikoisa='';
elegxeisa='';
 
%pithanotites apo wikipedia
pithanothtes=[0.08167  0.01492  0.02782  0.04253   0.12702   0.02228  0.02015 0.06094 0.06966  0.00153 0.00772 0.04025 0.02406 0.06749 0.07507 0.01929 0.00095 0.05987 0.06327 0.09056 0.02758 0.00978 0.02361 0.00150 0.01974 0.00074];
% arxikopoihsh to aggliko alfabito 
alfavito='abcdefghijklmnopqrstuvwxyz';
 
%2hs taksis epektasi pigis 
alphab=cell.empty(length(alfavito)^2,0);
pithanotites=zeros(length(alfavito)^2,1);
a=0;
 
for i=1:length(alfavito)
    
    for j=1:length(alfavito)
    
    alphab{a+j,1}=[alfavito(i) alfavito(j)];
    pithanotites(a+j,1)=pithanothtes(i)*pithanothtes(j);
        
    end
    %symplorwnw kata a ta kelia wste na parw ena dyo toys xaraktires
    a=a+j; 
    
end
%anoigma arxeiou
fp=fopen('kwords.txt');
%diabasma
Bkelli=textscan(fp,'%s');
%kleisimo
fclose(fp);
 

 
 
a = 0 ;
for a=1:size(Bkelli,1)
    
    alphaeisa=strcat(alphaeisa,Bkelli{a,1});
    
end
%casting se char
alphaeisa=char(alphaeisa);
 
dyadikoisa=huffmanencodex(alphaeisa,alphab,pithanotites);
elegxeisa=huffmandecodex(dyadikoisa,alphab,pithanotites);
 
%apotelesma ths huffmandictation
dictres=huffmandict(alphab,pithanotites);
L=0;
s=1;
while  s < size(dictres,1)
    
    chen=char(dictres.Encoding(s));
    %typos MESO MHKOS
    L=L+length(chen)*pithanotites(s)
 
  
    
    s = s+1 ; 
end
 
%L = Ln /2  n-osti epektasi 
    L=L/2;
 

    
    
    
    
    
    
    %%%%%%%%%%%%%--------------deytero--------------------%%%%%%%%%%%%%%%%%%%%%%%%%

%anoigma arxeiou me ola ta symbola to arxiko 
fid=fopen('kwords.txt');
kelliB=textscan(fid,'%s');
fclose(fid);


%arxikopoihseis
alphaeisa='';
dyadikoisa='';
elegxeisa='';

%arxikopoihsh alphabitou me ola ta symbola
alphabito='-./''abcdefghijklmnopqrstuvwxyz';


alphaB=cell.empty(length(alphabito)^2,0);
pithanotites=zeros(length(alphabito)^2,1);
% arxikopoihsh gia tis emfaniseis 
emfaniseis=zeros(length(alphabito),1);
% arxikopoihsh gia tis pithanotites emnfanishs
pith=zeros(length(alphabito),1);
grammata=0;


for n=1:length(alphabito)
    
    for m=1:size(kelliB{1,1},1)
                %diatrexw gia na brw tis emfaniseis
        emfaniseis(n,1)=emfaniseis(n,1)+sum(length(strfind(kelliB{1,1}{m,1},alphabito(n))));
    
    end

 end

for a=1:size(kelliB{1,1},1)
       %ta grammata mesa sto keimeno

    grammata=grammata+length(kelliB{1,1}{a,1});
end

for a=1:length(alphabito)
    
    pith(a,1)=emfaniseis(a,1)/grammata;
    
end

a=0;

for n=1:length(alphabito)
    
    for m=1:length(alphabito)
    
    alphaB{a+m,1}=[alphabito(n) alphabito(m)];
    pithanotites(a+m,1)=pith(n)*pith(m);
        
    end
    
    a=a+m;%arithmos gia sumplhrwsh keliwn
    
end




for a=1:size(kelliB{1,1},1)
        %pithanotita emfanisis = arithmos / grammata

    
    alphaeisa=strcat(alphaeisa,kelliB{1,1}{a,1});
    
end

%klisi twn huffmanencodex kai huffmandecodex

dyadikoisa=huffmanencodex(alphaeisa,alphaB,pithanotites);
dyadikoisa=huffmandecodex(dyadikoisa,alphaB,pithanotites);
    
%apotelesma ths  huffmandict

dictres=huffmandict(alphaB,pithanotites);
dictres=sortrows(dictres,{'Propability'},{'ascend'});
pithanotites=sort(pithanotites);
L=0;

for a=1:size(dictres,1)
        %T meso mikos symfwna me ton typo

    chen=char(dictres.Encoding(a));
    L=L+length(chen)*pithanotites(a);
    
end

L=L/2;







    

