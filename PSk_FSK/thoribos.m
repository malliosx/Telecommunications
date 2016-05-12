function enthoribo = thoribos(sym_dia, snr)

%�������� �������
Energeia = 1; 
Eb = Energeia / 2;
%�������
No = Eb / (10^(snr/10));
[y,t] = size(sym_dia);
%��������
n = 0;
s = sqrt(No / 2);
%�������� �������
thorubos = n + s * randn(y, t);
enthoribo = sym_dia + thorubos;

end