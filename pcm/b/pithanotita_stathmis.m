function [pithanotita,entropia]= pithanotita_stathmis (x,N,min_value,max_value)




%αρχικοποίηση
syms s;
pithanotita = zeros(2^N-1,1);



[~, ~, ~, oria] = lloyd_max_simple(x, N, min_value, max_value);
    
    %ολοκλήρωμα απο 1 μέχρι +άπειρο
    pithanotita(end) = double(int(exp(-s),1,Inf));
        
    
        j = 1 ;
        while j <= size(oria,1)
        pithanotita(j) = double(int(exp(-s),oria(j,1),oria(j,2))); %υπόλοιπες πιθανότητες
        j = j+1 ;
        end
    
   pithanotita(1) = 0;%μέχρι το 0 η πιθανότητα είναι 0 



end