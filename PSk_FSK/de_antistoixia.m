function eksodos = de_antistoixia(symbols, epilogh, gray)
%��������� �� gray 
if gray == 1
    symbols = gray2bin(symbols, epilogh, 4);
end


%��������� �� ������� ��� ��������
eksodos = dec2bin(symbols);

%���������� ��� ���������� ��� ������
[grammes, stiles] = size(eksodos);

%�������������� ��� ������
eksodos = reshape(eksodos', grammes*stiles, 1);
eksodos = double(eksodos) - 48;

end