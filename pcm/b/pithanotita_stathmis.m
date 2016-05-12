function [pithanotita,entropia]= pithanotita_stathmis (x,N,min_value,max_value)




%������������
syms s;
pithanotita = zeros(2^N-1,1);



[~, ~, ~, oria] = lloyd_max_simple(x, N, min_value, max_value);
    
    %���������� ��� 1 ����� +������
    pithanotita(end) = double(int(exp(-s),1,Inf));
        
    
        j = 1 ;
        while j <= size(oria,1)
        pithanotita(j) = double(int(exp(-s),oria(j,1),oria(j,2))); %��������� �����������
        j = j+1 ;
        end
    
   pithanotita(1) = 0;%����� �� 0 � ���������� ����� 0 



end