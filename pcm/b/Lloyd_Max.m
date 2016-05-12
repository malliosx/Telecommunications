function [xq,centers,D] = Lloyd_Max(x,N,minv,maxv,Kmax)

%epipeda kbantisis
epipeda = 2 ^ N;



%arxikopoihseis
new_x=zeros(size(x));
xq=zeros(size(x));

centers=zeros(epipeda,1);
new_centers=zeros(epipeda,1);

oria_zwnis = zeros(epipeda-1,1);
%paramorfwsi
D = zeros(Kmax,1);



%kanonikopoihsh eisodou
for j=1:size(x),
    if (x(j) > maxv)
        new_x(j) = maxv;
    elseif (x(j) < minv)
        new_x(j) = minv;
    else
        new_x(j) = x(j);
    end
end



%arxikopoioume ta oria zwnwn
for j = 1 : (epipeda-1)
    oria_zwnis(j) = j*(maxv - minv) / epipeda;
end
oria_zwnis=flipud(oria_zwnis);



if numel(new_x(new_x<=maxv & new_x>oria_zwnis(1))) > 0 
new_centers(1) = mean(new_x(new_x<=maxv & new_x>oria_zwnis(1)));% an to x anhkei sto max vres to kentro

else
    new_centers(1) = (oria_zwnis(1)+maxv)/2;%an oxi valto sto kentro
end


if numel(new_x(new_x<=oria_zwnis(epipeda-1) & new_x>=minv))
    new_centers(epipeda) = mean(new_x(new_x<=oria_zwnis(epipeda-1) & new_x>=minv));% an to x anhkei sto min vres to kentro
    
else
    new_centers(epipeda) = (oria_zwnis(epipeda-1)+minv)/2;%an oxi valto sto kentro
end

for j = 2 : (epipeda-1) %gia oles tis alles zwnes >>
    if numel(new_x(new_x<=oria_zwnis(j-1) & new_x>oria_zwnis(j))) > 0
        new_centers(j) = mean(new_x(new_x<=oria_zwnis(j-1) & new_x>oria_zwnis(j)));
    else
        new_centers(j) = (oria_zwnis(j-1)+oria_zwnis(j))/2;
    end
end

k=2;
D(1) = 0;
D(2) = 1;



while k < Kmax && norm( D(k) - D(k-1) ) >= 10^-16      %oso h diafora de peftei katw apo to eps(10.^-16)
    k = k + 1;
    centers=new_centers;
    for j = 1 : (epipeda-1),
        oria_zwnis(j) = (centers(j) + centers(j+1)) / 2; %epanaypologizw ta akra
    end
    

    xq(new_x<=maxv & new_x>oria_zwnis(1)) = 1; %to kbantismeno
    xq(new_x<=oria_zwnis(epipeda-1) & new_x>=minv) = epipeda;

    for j = 2 : (epipeda-1),
        xq(new_x<=oria_zwnis(j-1) & new_x>oria_zwnis(j)) = j;
    end
    
    D(k) = mean( (new_x - centers(xq)) .^ 2 );%paramorfwsi
   
    
    
    if numel(new_x(new_x<=maxv & new_x>oria_zwnis(1))) > 0
        new_centers(1) = mean(new_x(new_x<=maxv & new_x>oria_zwnis(1)));%ananewnw to akrotato center
    else
        new_centers(1) = centers(1);
    end
    if numel(new_x(new_x<=oria_zwnis(epipeda-1) & new_x>=minv))
        new_centers(epipeda) = mean(new_x(new_x<=oria_zwnis(epipeda-1) & new_x>=minv));%ananewnw to katwtato center
    else
        new_centers(epipeda) = centers(epipeda);
    end
   
    for j = 2 : (epipeda-1),
        if numel(new_x(new_x<=oria_zwnis(j-1) & new_x>oria_zwnis(j))) > 0
            new_centers(j) = mean(new_x(new_x<=oria_zwnis(j-1) & new_x>oria_zwnis(j))); %gia ola ta alla
       else
    
        end
    end
end
D = D';