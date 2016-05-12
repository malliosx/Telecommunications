function sym_dia = diamorfwtis(symbola, epilogh)

%μέγεθος των συμβόλων
megethos = length(symbola);


%περίοδος κάθε συμβόλου
periodos = 40;	
%συχνότητα κάθε συμβόλου
syxnotita = 1 / periodos; 


%περίοδος δείγματος
per_deigma = 1;	


%περίοδος φέρουσας
per_fer = 4;
%συχνότητα φέρουσας
freq_fer = 1 / per_fer;
energeia = 1;		



%ορθογώνιος παλμός
palmos = sqrt(2 * energeia / periodos);

% αρχικοποίηση
sym_dia = zeros(megethos, periodos / per_deigma);

% υπολογισμός
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
