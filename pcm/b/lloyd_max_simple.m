function [xq,centers,D,ranges]=lloyd_max_simple (x,N,min_value,max_value)


%elegw oti brsketai se morfi vector 
megethosx=size(x);
if megethosx(2)~=1 && megethosx(1)==1
    x=x';
elseif megethosx(2)~=1 && megethosx(1)>1
    error('not vector')
end


%kanonikopoisi  sth dynamikh perioxh
if min_value<min(x)
    min_value=min(x);
end
if max_value>max(x)
    max_value=max(x);
end


deiktis=x;%anafora 
xq=zeros(size(x));%eksodos

centers_of_x=x;%ypologismos distortion


D=(max_value-min_value)/2^N; %bima 


ranges=[min_value:D:max_value-D;min_value+D:D:max_value]';%epipeda kbantisis

centers=zeros(size(ranges,1),1);%ypologismos kentrwn
deiktis(deiktis<min_value)=min_value;
deiktis(deiktis>max_value)=max_value;
for i=1:numel(centers)
    centers(i)=mean(deiktis(deiktis>=ranges(i,1) & deiktis<=ranges(i,2)));
   
    centers_of_x(deiktis>=ranges(i,1) & deiktis<=ranges(i,2))=centers(i);
end




D=[0 mean((x-centers_of_x).^2)]; %mesi paramorfwsi
j=2; % th prwth fora einai 0 

while abs(D(j)-D(j-1))>=eps
    
    
    
    %aristero kai deksi akro
    ranges(:,1)=[min_value;(centers(1:end-1)+centers(2:end))/2];
    ranges(:,2)=[(centers(1:end-1)+centers(2:end))/2;max_value];
    for i=1:numel(centers)

        
        
        %kenra kathe perioxis
        centers(i)=mean(deiktis(deiktis>=ranges(i,1) & deiktis<=ranges(i,2)));
        
        
        xq(deiktis>=ranges(i,1) & deiktis<=ranges(i,2))=i; %kbantismos simatos
       
        centers_of_x(deiktis>=ranges(i,1) & deiktis<=ranges(i,2))=centers(i);
    end
   
    
    D=[D mean((x-centers_of_x).^2)]; %nea epipeda paramorfwsis
    j=j+1; %epomeni epanalipsi
end
D=D(2:end);
xq(xq>=0 & xq<=0)=1;%afairw midenika
