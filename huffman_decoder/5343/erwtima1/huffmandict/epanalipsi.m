function eksodos = epanalipsi (tempNode,kwd,eksodos)%ta pairnw ws eisodo apo th huffmandict

%thelw na elegxw an exei paidia o trexwn kombos gia na stamathsei h
%anadromh. an den einai adeios-> exei paidia -> stamataw.
if ~isempty(tempNode)
kwd = [kwd tempNode.code]; % prosthetw to kwdiko pou me odhgei sta fylla
kwd=strtrim(kwd);

%an o kombos einai xaraktiras tote sto into gyrnaei h epithymiti kwdikopoihsh
if ~isempty(tempNode.character)
into = {tempNode.character , kwd , tempNode.probability};
eksodos=[ eksodos ; into];

end

%h epanalispi efarmozetai sto dexi k sto aristero kombo
eksodos=epanalipsi(tempNode.leftNode,kwd,eksodos);
eksodos=epanalipsi(tempNode.rightNode,kwd,eksodos);

end

end