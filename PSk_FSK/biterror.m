function ber = biterror(eisodos, eksodos)


%μέγεθος της εισόδου
len = length(eisodos);




%υπόλοιπο της διαίρεσης με το 2
diairesi = mod(len, 2);

%αν όχι 
if diairesi ~= 0
%τα επιπλέον bits που προσθέτω
epipleon = 2 - diairesi;
eisodos(len + epipleon) = eisodos(len);
eisodos(len) = 0;
end


ber = sum(eisodos ~= eksodos)/length(eksodos);

end
    
