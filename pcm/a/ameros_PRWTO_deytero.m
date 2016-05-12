%erwtima a%

clear;
clc;

%δείγματα
M = 10000; 
t = (randn(M,1)+j*randn(M,1))./sqrt(2);

%σήμα
Ax = abs(t).^2; 

%το Ν
N = 6;
%N = 6;

%ελάχιστη και μέγιστη τιμή 
elaxisti = 0;
megisti = 4;
 
%καλώ τον ομοιόμορφο κβαντιστή 
[xout,kentra] = my_quantizer( Ax,N,elaxisti,megisti )

%ισχύς σήματος
Psig=mean(Ax.^2);
%το κβαντισμένο σήμα
xquan=kentra(xout); 
%ισχύς θορύβου
Pnois=mean((Ax-xquan).^2);

%sqnr υπολογισμένο σε db 
sqnr=10*log10(Psig/Pnois) 
%πειραματική παραμόρφωση

paramorfwsi_peiramatiki = mean((Ax-kentra(xout)).^2);

%θεωρητική παραμόρφωση απο το ολοκλήρωμα
syms x;
paramorfwsi_theoritiki=0;


for i=1:2^N-1
apotel=int((x-kentra(i))^2*exp(-x),+(i-1)*((megisti-elaxisti)/2^(N)),elaxisti+(i)*((megisti-elaxisti)/2^(N)));
paramorfwsi_theoritiki=paramorfwsi_theoritiki+eval(apotel);
end
ypol=eval(int((x-kentra(length(kentra)))^2*exp(-x),x,megisti,inf));
paramorfwsi_theoritiki=paramorfwsi_theoritiki+ypol;


%b πιθανότητα να ξεπεράσει τα όρια 
distortion_overload = numel(Ax(Ax>megisti | Ax<elaxisti))/numel(Ax)
