%erwtima a%

clear;
clc;

%��������
M = 10000; 
t = (randn(M,1)+j*randn(M,1))./sqrt(2);

%����
Ax = abs(t).^2; 

%�� �
N = 6;
%N = 6;

%�������� ��� ������� ���� 
elaxisti = 0;
megisti = 4;
 
%���� ��� ���������� ��������� 
[xout,kentra] = my_quantizer( Ax,N,elaxisti,megisti )

%����� �������
Psig=mean(Ax.^2);
%�� ����������� ����
xquan=kentra(xout); 
%����� �������
Pnois=mean((Ax-xquan).^2);

%sqnr ������������ �� db 
sqnr=10*log10(Psig/Pnois) 
%����������� �����������

paramorfwsi_peiramatiki = mean((Ax-kentra(xout)).^2);

%��������� ����������� ��� �� ����������
syms x;
paramorfwsi_theoritiki=0;


for i=1:2^N-1
apotel=int((x-kentra(i))^2*exp(-x),+(i-1)*((megisti-elaxisti)/2^(N)),elaxisti+(i)*((megisti-elaxisti)/2^(N)));
paramorfwsi_theoritiki=paramorfwsi_theoritiki+eval(apotel);
end
ypol=eval(int((x-kentra(length(kentra)))^2*exp(-x),x,megisti,inf));
paramorfwsi_theoritiki=paramorfwsi_theoritiki+ypol;


%b ���������� �� ��������� �� ���� 
distortion_overload = numel(Ax(Ax>megisti | Ax<elaxisti))/numel(Ax)
