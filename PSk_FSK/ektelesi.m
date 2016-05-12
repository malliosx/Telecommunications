%======================== Ερώτημα 1 =============================

clear; 
clc;
%counters που χρησιμοποιώ για τα δυο συστήματα
loopp=1;
loop = 1;
loopg=1;%για gray

%τα bits εισόδου 
tabitseisodou = 10^3;

%αρχικοποίηση θεωρητικόυ psk
Pb(loop, 1) = 0;






%αρχικοποίηση για αποθήκευση ber για psk
BER_psk(loop, 1) = 0;

for SNR = 0:2:8
	
    
    dyadiki     = eisodos_dyadiki(tabitseisodou);
    symbola		= antistoixia(dyadiki, 'PSK',0);
    sym_dia		= diamorfwtis(symbola, 'PSK');
    
    enthoribo	= thoribos(sym_dia ,SNR);
    apodiam		= apodiamorfwtis(enthoribo, 'PSK');
    symbols 	= apofasi(apodiam, 'PSK');
    eksodos 	= de_antistoixia(symbols, 'PSK', 0);
    BER_psk(loop, 1) = biterror(dyadiki, eksodos);
     
   
     %υπολογισμός της θεωρητικής τιμής του ber για το 4-PSK 
     Pb(loop, 1) = 1/2*erfc(sqrt( 10^(SNR/10)) );    
    
    loop = loop + 1;
    
    
end
for SNR = 0:2:8
	
    
    dyadiki     = eisodos_dyadiki(tabitseisodou);
    symbola		= antistoixia(dyadiki, 'PSK',1);
    sym_dia		= diamorfwtis(symbola, 'PSK');
    
    enthoribo	= thoribos(sym_dia ,SNR);
    apodiam		= apodiamorfwtis(enthoribo, 'PSK');
    symbols 	= apofasi(apodiam, 'PSK');
    eksodos 	= de_antistoixia(symbols, 'PSK', 1);
    BER_psk_gray(loopg, 1) = biterror(dyadiki, eksodos);
     
   
    
    loopg = loopg + 1;
    
    
end





%======================== Ερώτημα 2 =========================

%αρχικοποίηση για αποθήκευση ber για fsk
BER_fsk(loopp, 1) = 0;
for SNR = 0:2:8
	
  
    dyadikif     = eisodos_dyadiki(tabitseisodou);
    symbolaf		= antistoixia(dyadikif, 'FSK', 0);
    sym_diaf		= diamorfwtis(symbolaf, 'FSK');
    
    enthoribof	= thoribos(sym_diaf ,SNR);
    apodiamf		= apodiamorfwtis(enthoribof, 'FSK');
    symbolsf 	= apofasi(apodiamf, 'FSK');
    eksodosf 	= de_antistoixia(symbolsf, 'FSK', 0);
    BER_fsk(loopp, 1) = biterror(dyadikif, eksodos);
     
   
    
    loopp = loopp + 1;
    
    
end


%======================== Ερώτημα 3================================= 



%Σχεδιασμός BER συναρτήσει του SNR
s_N_R = [0: 2: 8];
semilogy(s_N_R', Pb, 'Y.-');
hold on;
semilogy(s_N_R', BER_psk, 'b.-');
semilogy(s_N_R', BER_fsk, 'm.-');
semilogy(s_N_R', BER_psk_gray, 'r.-');

legend('θεωρητικό ber 4-PSK','ber για  4-PSK χωρίς GRAY','ber για  4-FSK','ber για  4-PSK κατά GRAY');
title('ΒΕR για 4-PSK and 4-FSK ');
xlabel('SNR');
ylabel('BER');
hold;

figure;




%======================== Ερώτημα 4 ==========================




%δείγματα 
f = 2048;
t = 0:1/f:1-1/f;
%τα σύμβολα
s(:,:) = sym_dia(:,:);
%παίρνω το μέγεθος
m = length(s);
%κάνω FOURIER
four = fft(s);
four = four(1:m/2+1);
%τετράγωνο του μέτρου του
sfour = (1/(f*m)) * abs(four).^2;
%συχνότητες
sxynot = 0:f/length(s):f/2;



%δείγματα 
f = 2048;
t = 0:1/f:1-1/f;
%τα σύμβολα
s(:,:) = sym_diaf(:,:);
%παίρνω το μέγεθος
m = length(s);
%κάνω FOURIER
four = fft(s);
four = four(1:m/2+1);
%τετράγωνο του μέτρου του
sfourf = (1/(f*m)) * abs(four).^2;
%συχνότητες
freqf = 0:f/length(s):f/2;


%σχεδίαση διαγράμματος
semilogy(freqf,10*log10(sfourf))
hold on
semilogy(sxynot,10*log10(sfour))
grid on
title('Φάσμα Ισχύος')
xlabel('Συχνότητα')
ylabel('Power/συχνότητα')

