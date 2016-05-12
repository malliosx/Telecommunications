function apodia = apodiamorfwtis(lifthen, kwdikop)


%�������� �������� ��� ���������
periodos_sym = 40;				
syxnotita_sym = 1 / periodos_sym; 


%�������� ��������� , �������� ��� ��������� �������� = 1;				
periodos_dei = 1;
periodos_fer = 4;
syxnotita_fer = 1 / periodos_fer;				
energria_sym = 1;



%���������� ������ 
palmos = sqrt(2 * energria_sym / periodos_sym);

[m,periodos_sym ]= size(lifthen);

% �������������
if kwdikop == 'PSK'
    for k = 1: periodos_sym
        y1(k, 1) = palmos * cos(2 * pi * syxnotita_fer * k);
        y2(k, 1) = palmos * sin(2 * pi * syxnotita_fer * k);
    end

    % �������������
    apodia = [lifthen * y1, lifthen * y2];
elseif kwdikop == 'FSK'
    for i = 1: 4
        for k = 1: periodos_sym
            y(i, k) = palmos * cos(2 * pi * ( syxnotita_fer + i * syxnotita_sym) * k);
        end
    end

    % 4 ����������
    apodia = lifthen * y';
end

end
