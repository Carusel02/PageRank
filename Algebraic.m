function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
    
    % deschidere fisier
    file = fopen(nume,"r");
    % citire nr noduri
    number_nodes = fscanf(file, "%d", 1);
    
    % formare matrice ca la algoritmul Iterative
    for i = 1:number_nodes
        node = fscanf(file, "%d", 1);
        index = fscanf(file,"%d",1);
        vecini = fscanf(file,"%d",index);
        flag = 0;
        
        for j = 1:index
            if( node == vecini(j))
                flag = 1;
            end
        end
        
        for j= 1:index
             if(flag == 0)
              matrix(vecini(j),node) = 1/index;
             else
              matrix(vecini(j),node) = 1/(index-1);
             end     
        end
    end

    for i= 1:number_nodes
        matrix(i,i) = 0;
    end

    % R = P + d * M * R   =>  (1 - d * M )R = P   =>   R = inv(1- d * M) * P
    
    % formam matricea P si matricea unitate ( adica 1 din formula de sus )
    n = number_nodes; 
    P = zeros(n,1) + (1-d)/n;
    matrix_unitate = eye(n);
    % formam matricea R apeland functia PR_Inv
    PR = PR_Inv(matrix_unitate - d * matrix) * P;
    % setam output ul ca fiind vectorul PR calculat
    R = PR;
    
    % inchidem fisierul
    fclose(file);
end