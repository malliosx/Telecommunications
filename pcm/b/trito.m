clear;
clc ; 


%διαβάζω το σήμα
y = audioread('speech.wav');
%τα Ν 
N = 6; %4,6


%--------------πειραματικός υπολογισμός-----------------------------------------------------------%

[y1,kentra1,p1]=lloyd_max_simple(y,N,min(y),max(y));
%εύρεση στοιχείων
stoixeia1 = unique(kentra1(y1));

%από το ιστόγραμμα βρίσκω εμφανίσεις
[emfaniseis1,stoixeiwn1] = hist(kentra1(y1),stoixeia1);
%πιθανότητα = εμφανίσεις / μήκος του σήματος 
pithanotita_peiramatiki1 =(emfaniseis1/length(y1))
     
%υπολογισμός εντροπίας
Entropia_peiramatiki = -pithanotita_peiramatiki1*log2(pithanotita_peiramatiki1)';





%--------------θεωρητικός υπολογισμός-----------------------------------------------------------%

 [pithanotita_theoritiki] = pithanotita_stathmis(y,N,min(y),max(y))
    %entropia_theoritiki= - pithanotita_theoritiki*log2(pithanotita_theoritiki)';% εντροπία
    
 
plot(pithanotita_theoritiki','r')
hold on 
plot(pithanotita_peiramatiki1,'b')
legend('theoritiki','peiramatiki')

