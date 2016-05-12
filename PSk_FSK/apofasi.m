function symbola = apofasi(r, kwdikop)

[grammes, ~] = size(r);
    
if kwdikop == 'PSK'

  % πιθανότητα συμβόλου 

for i = 1: 4
        s(i, 1) = cos( 2 * pi * i / 4 );
        s(i, 2) = sin( 2 * pi * i / 4 );
    end
  
    % υπολογισμός της μεγαλύτερης πιθανότητας
    for j =1: grammes
        for i = 1: 4
            temp(i, 1) = norm([r(j,1), r(j,2)] - s(i,:));
        end
        [d, symbola(j, 1)] = min(temp);
		
    end

	% 4th = 0th
	symbola = mod(symbola,4);    
elseif kwdikop == 'FSK'
    
 
	ypol = zeros(1, grammes);
       % υπολογισμός της μεγαλύτερης πιθανότητας

    ypol = [0: 3];
	for j =1: grammes
		deiktis = logical(round(abs(r(j, :))));
        if isempty(ypol(deiktis))
			symbola(j) = 0;
		else
			symbola(j) = max( ypol(deiktis) );
    end
end

	% 4th = 0th
symbola = mod(symbola,4);

end