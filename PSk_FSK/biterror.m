function ber = biterror(eisodos, eksodos)


%������� ��� �������
len = length(eisodos);




%�������� ��� ��������� �� �� 2
diairesi = mod(len, 2);

%�� ��� 
if diairesi ~= 0
%�� �������� bits ��� ��������
epipleon = 2 - diairesi;
eisodos(len + epipleon) = eisodos(len);
eisodos(len) = 0;
end


ber = sum(eisodos ~= eksodos)/length(eksodos);

end
    
