clear;
clc ; 


%������� �� ����
y = audioread('speech.wav');
%�� � 
N = 6; %4,6


%--------------������������ �����������-----------------------------------------------------------%

[y1,kentra1,p1]=lloyd_max_simple(y,N,min(y),max(y));
%������ ���������
stoixeia1 = unique(kentra1(y1));

%��� �� ���������� ������ ����������
[emfaniseis1,stoixeiwn1] = hist(kentra1(y1),stoixeia1);
%���������� = ���������� / ����� ��� ������� 
pithanotita_peiramatiki1 =(emfaniseis1/length(y1))
     
%����������� ���������
Entropia_peiramatiki = -pithanotita_peiramatiki1*log2(pithanotita_peiramatiki1)';





%--------------���������� �����������-----------------------------------------------------------%

 [pithanotita_theoritiki] = pithanotita_stathmis(y,N,min(y),max(y))
    %entropia_theoritiki= - pithanotita_theoritiki*log2(pithanotita_theoritiki)';% ��������
    
 
plot(pithanotita_theoritiki','r')
hold on 
plot(pithanotita_peiramatiki1,'b')
legend('theoritiki','peiramatiki')

