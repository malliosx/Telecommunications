function enthoribo = thoribos(sym_dia, snr)

%ενέργεια σήματος
Energeia = 1; 
Eb = Energeia / 2;
%θόρυβος
No = Eb / (10^(snr/10));
[y,t] = size(sym_dia);
%κατανομή
n = 0;
s = sqrt(No / 2);
%προσθήκη θορύβου
thorubos = n + s * randn(y, t);
enthoribo = sym_dia + thorubos;

end