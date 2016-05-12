function [Ax,kentra] = my_quantizer( x,N,minvalue,maxvalue )

%���� �������������� ���� ������ ���� ������� ��� �������� ���� 
input=x;
input(input>maxvalue)=maxvalue; 
input(input<minvalue)=minvalue; 





D =(maxvalue-minvalue)/2^(N);%�� ���� �


akra(1)=minvalue;
for j=2:2^(N)+1
    akra(j)=akra(j-1)+D; % ��������� �� ����
end


for i=1:2^N
    kentra(i)=(akra(i)+akra(i+1))/2;% �� ������
    kat = normcdf([kentra(i)-D/2 , kentra(i)+ D/2], 0, sqrt(1));
   
end

mikoseis=max(size(x,1),size(x,2));%����� �������

Ax=zeros(mikoseis,1);%init
for j=1:mikoseis
    flag=true;
    k=1;
    while(flag)
        if(input(j)<=akra(k+1))
            Ax(j)=k;
            flag=false;
        else
            k=k+1;
        end
    end
end

kentra=kentra';
end