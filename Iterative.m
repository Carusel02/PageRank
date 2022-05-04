function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

    % deschidere fisier
    file = fopen(nume,"r");
    % citire numar noduri
    number_nodes = fscanf(file, "%d", 1);
   
    % pentru fiecare numar de noduri
    for i = 1:number_nodes
        % citim nodul 
        node = fscanf(file, "%d", 1);
        % citim numarul de vecini
        index = fscanf(file,"%d",1);
        % citim vectorul de vecini
        vecini = fscanf(file,"%d",index);
        % flag care ne ajuta sa eliminam noduri care se acceseaza pe sine
        flag = 0;
        
        % parcurgere vector vecini
        for j = 1:index
            % daca nodul se acceseaza pe sine
            if( node == vecini(j) )
                flag = 1;
            end
        end
        
        % formare matrice de adiacenta
        for j= 1:index
             % daca flag e 0, nu eliminam nimic
             if(flag == 0)
              matrix(vecini(j),node) = 1/index;
             else
             % daca flag e 1, scadem nodul 
              matrix(vecini(j),node) = 1/(index-1);
             end     
        end
    end
    
    % punem 0 pe diagonala
    for i= 1:number_nodes
        matrix(i,i) = 0;
    end
    
    % folosim variabila flag pentru iteratii
    flag = 1;
    n = number_nodes;
    % primul vector PR (page rank) 
    R_1 = zeros(n,1) + 1/n;
    
    % cat timp flag e 1
    while flag == 1
        % aplicam formula dupa wikipedia
        R_2 = (d*matrix*R_1) + (1-d)/n*ones(n,1);
        % daca ajungem la conditia de oprire, iesim
        if norm(R_1-R_2,2) < eps
            flag = 0; % flag ajunge 0, conditia va fi falsa
        end
        % actualizam vectorul PR
        R_1 = R_2;
    end
    
    % punem ca output al functiei valoarea finala a lui PR
    R = R_2;
    fclose(file);
end