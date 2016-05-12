function symbola = antistoixia(dyadiki, epilogh, gray)

megethos = length(dyadiki);

%��������� �� ������� �� ��� ������ ����� ��� ����������� � ��� �� �� ���
res = mod(megethos, 2);

%�� ���������� �� �� 2
div_dyad = dyadiki(1 : (megethos - res), :);

%������� reshape �� ���� 
resd = reshape(div_dyad, 2, (megethos - res) / 2);

%����������� �� bit
for i = 1: (megethos - res) / 2
    symbola(i) = bin2dec(num2str(resd(:, i)'));
end 







%�� ������ ��������,  ��������� �� ������� 
if res ~= 0
    symbola(i + 1) = bin2dec(num2str(dyadiki(megethos - res + 1 :megethos, 1)'));
end

%��������� �� ������ GRAY
if gray == 1
    symbola = bin2gray(symbola, epilogh, 8);
end

end
