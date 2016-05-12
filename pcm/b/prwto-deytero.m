clear 
clc

         %---------------loyd ---------------------------
bn = [10 500 5000]
[y,Fs] = audioread('speech.wav');

%------------ n =2 ---------------------
[Aq1,centers1,D]=Lloyd_Max(y,2,min(y),max(y),10);
        
 Psig1=mean(y.^2);
 ykbant1=centers1(Aq1); %to kvantismeno shma
 Pnois1 = mean((y-ykbant1).^2);

 %upologismos tou sqnr se db
 loydsqnr1=10*log10(Psig1/Pnois1); 
 
 [Aq2,centers2,D]=Lloyd_Max(y,2,min(y),max(y),500);
        
 Psig2=mean(y.^2);
 ykbant2=centers2(Aq2); %to kvantismeno shma
 Pnois2 = mean((y-ykbant2).^2);

 %upologismos tou sqnr se db
 loydsqnr2=10*log10(Psig2/Pnois2); 
 
 [Aq3,centers3,D]=Lloyd_Max(y,2,min(y),max(y),5000);
        
 Psig3=mean(y.^2);
 ykbant3=centers3(Aq3); %to kvantismeno shma
 Pnois3 = mean((y-ykbant3).^2);

 %upologismos tou sqnr se db
 loydsqnr3=10*log10(Psig3/Pnois3); 
 
 
 
 loydsqnr_2 = [loydsqnr1 loydsqnr2 loydsqnr3 ];
 
 
 
 
 
 %------------ n =4 ---------------------

[y,Fs] = audioread('speech.wav');

 
[Aq1,centers1,D]=Lloyd_Max(y,4,min(y),max(y),10);
        
 Psig1=mean(y.^2);
 ykbant1=centers1(Aq1); %to kvantismeno shma
 Pnois1 = mean((y-ykbant1).^2);

 %upologismos tou sqnr se db
 loydsqnr1=10*log10(Psig1/Pnois1); 
 
 [Aq2,centers2,D]=Lloyd_Max(y,4,min(y),max(y),500);
        
 Psig2=mean(y.^2);
 ykbant2=centers2(Aq2); %to kvantismeno shma
 Pnois2 = mean((y-ykbant2).^2);

 %upologismos tou sqnr se db
 loydsqnr2=10*log10(Psig2/Pnois2); 
 
 [Aq3,centers3,D]=Lloyd_Max(y,4,min(y),max(y),5000);
        
 Psig3=mean(y.^2);
 ykbant3=centers3(Aq3); %to kvantismeno shma
 Pnois3 = mean((y-ykbant3).^2);

 %upologismos tou sqnr se db
 loydsqnr3=10*log10(Psig3/Pnois3);
 
 loydsqnr_4 = [loydsqnr1 loydsqnr2 loydsqnr3 ];

 
 
 %------------ n = 6 ---------------------

[y,Fs] = audioread('speech.wav');

 
 
[Aq1,centers1,D]=Lloyd_Max(y,6,min(y),max(y),10);
        
 Psig1=mean(y.^2);
 ykbant1=centers1(Aq1); %to kvantismeno shma
 Pnois1 = mean((y-ykbant1).^2);

 %upologismos tou sqnr se db
 loydsqnr1=10*log10(Psig1/Pnois1); 
 
 [Aq2,centers2,D]=Lloyd_Max(y,6,min(y),max(y),500);
        
 Psig2=mean(y.^2);
 ykbant2=centers2(Aq2); %to kvantismeno shma
 Pnois2 = mean((y-ykbant2).^2);

 %upologismos tou sqnr se db
 loydsqnr2=10*log10(Psig2/Pnois2); 
 
 [Aq3,centers3,D]=Lloyd_Max(y,6,min(y),max(y),5000);
        
 Psig3=mean(y.^2);
 ykbant3=centers3(Aq3); %to kvantismeno shma
 Pnois3 = mean((y-ykbant3).^2);

 %upologismos tou sqnr se db
 loydsqnr3=10*log10(Psig3/Pnois3);
 
 
 loydsqnr_6 = [loydsqnr1 loydsqnr2 loydsqnr3 ];
     
  loydsqnr = [loydsqnr_2 loydsqnr_4 loydsqnr_6] ;
        



plot(bn,loydsqnr_2,'b',bn,loydsqnr_4,'r',bn,loydsqnr_6,'g');
         legend('6','4','2')
         xlabel('epanalipseis')
        ylabel('sqnr')

        
        
     
        
        
        
       
        
        
        
        
        
        
        %----------------------------------------------
%omoiomorfo
%---------------------------------------------------------

%diabazw to sima 
[y,fs]=audioread('speech.wav');

  %-----------N =2 ---------------%   
%gia ton omoiomorfo me min = -1 max = 1
[xq1,centers1]=my_quantizer(y,2,min(y),max(y));
%ypologismos toy sqnr
    
 Psig=mean(y.^2);
 ykbant=centers1(xq1); %to kvantismeno shma
 Pnois = mean((y-ykbant).^2);

%upologismos tou sqnr se db
omoiomsqnr1=10*log10(Psig/Pnois); 


  %-----------N = 4  ---------------%   


[xq2,centers2]=my_quantizer(y,4,min(y),max(y));
%ypologismos toy sqnr
    
 Psig=mean(y.^2);
 ykbant=centers2(xq2); %to kvantismeno shma
 Pnois = mean((y-ykbant).^2);

%upologismos tou sqnr se db
omoiomsqnr2=10*log10(Psig/Pnois); 


  %-----------N = 6 ---------------%   

[xq3,centers3]=my_quantizer(y,6,min(y),max(y));
%ypologismos toy sqnr
    
 Psig=mean(y.^2);
 ykbant=centers3(xq3); %to kvantismeno shma
 Pnois = mean((y-ykbant).^2);

%upologismos tou sqnr se db
omoiomsqnr3=10*log10(Psig/Pnois); 

omoiomsqnr = [omoiomsqnr1, omoiomsqnr2 ,omoiomsqnr3];


        