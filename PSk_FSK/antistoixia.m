function symbola = antistoixia(dyadiki, epilogh, gray)

megethos = length(dyadiki);

%χωρίζουμε τη πρόταση σε δυο γκρούπ αυτές που διαιρούνται ή οχι με το δυο
res = mod(megethos, 2);

%αν διαιρείται με το 2
div_dyad = dyadiki(1 : (megethos - res), :);

%κάνουμε reshape σε αυτή 
resd = reshape(div_dyad, 2, (megethos - res) / 2);

%αντιστοιχία σε bit
for i = 1: (megethos - res) / 2
    symbola(i) = bin2dec(num2str(resd(:, i)'));
end 







%αν αφήνει υπόλοιπο,  μετατροπή σε δυαδικό 
if res ~= 0
    symbola(i + 1) = bin2dec(num2str(dyadiki(megethos - res + 1 :megethos, 1)'));
end

%Μετατροπή σε κώδικα GRAY
if gray == 1
    symbola = bin2gray(symbola, epilogh, 8);
end

end
