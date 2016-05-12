
[y,Fs] = audioread('speech.wav');

%------------ n =2 ---------------------
[Aq1,centers1,D]=lloyd_max_simple(y,2,-1,1);
        
 
 ykbant1=centers1(Aq1); %to kvantismeno shma
 mse2 = mean((y-ykbant1).^2);

 %------------ n =4 ---------------------

[Aq2,centers2,D2]=lloyd_max_simple(y,4,-1,1);
        
 
 ykbant2=centers2(Aq2); %to kvantismeno shma
 mse4 = mean((y-ykbant2).^2);

 
 
 %------------ n = 6 ---------------------

[Aq3,centers3,D3]=lloyd_max_simple(y,6,-1,1);
        
 
 ykbant3=centers3(Aq3); %to kvantismeno shma
 mse6 = mean((y-ykbant3).^2);
 
 mse = [mse2 mse4 mse6]
 

        
        
        
         
plot(mse','r')
hold on 
legend('mean squared error')
 
 