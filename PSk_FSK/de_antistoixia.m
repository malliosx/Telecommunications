function eksodos = de_antistoixia(symbols, epilogh, gray)
%Μετατροπή σε gray 
if gray == 1
    symbols = gray2bin(symbols, epilogh, 4);
end


%μετατροπή σε δυαδικό απο δεκαδικό
eksodos = dec2bin(symbols);

%αποθήκευση των διαστάσεων της εξόδου
[grammes, stiles] = size(eksodos);

%ανασχηματισμός της εξόδου
eksodos = reshape(eksodos', grammes*stiles, 1);
eksodos = double(eksodos) - 48;

end