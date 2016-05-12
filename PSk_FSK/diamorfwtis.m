function sym_dia = diamorfwtis(symbola, epilogh)

%������� ��� ��������
megethos = length(symbola);


%�������� ���� ��������
periodos = 40;	
%��������� ���� ��������
syxnotita = 1 / periodos; 


%�������� ���������
per_deigma = 1;	


%�������� ��������
per_fer = 4;
%��������� ��������
freq_fer = 1 / per_fer;
energeia = 1;		



%���������� ������
palmos = sqrt(2 * energeia / periodos);

% ������������
sym_dia = zeros(megethos, periodos / per_deigma);

% �����������
if epilogh == 'PSK'
    for i = 1: megethos
        for j = 1: periodos/per_deigma
            sym_dia(i, j) = palmos * cos( 2*pi*freq_fer*j - 2*pi*symbola(i)/4 );
        end
    end
elseif epilogh == 'FSK'
    for i = 1: megethos
        for j = 1: periodos/per_deigma
            sym_dia(i, j) = palmos * cos(2 * pi * (freq_fer + symbola(i) * syxnotita) * j);
        end
    end
end

end
