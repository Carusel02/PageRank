function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
    
    % deschidem fisierul de intrare
    file_input = fopen(nume,"r");
    % citim nr de noduri
    n = fscanf(file_input,"%d", 1);
    
    % citim matricea pt a putea ajunge la val1 si val2
    for i = 1:n
        node = fscanf(file_input, "%d", 1);
        index = fscanf(file_input,"%d",1);
        vecini = fscanf(file_input,"%d",index);
    end
    
    % citim val1 si val2
    val1 = fscanf(file_input, "%f", 1);
    val2 = fscanf(file_input, "%f", 1);
    
    % formam numele fisierului de iesire
    s1 = nume ;
    s2 = ".out" ;
    s = strcat(s1,s2);
    % cream fisierul de iesire
    file_output = fopen(s,'w');
    
    % aflam R1 si R2, vectorii PR cu functiile anterioare
    R1 = Iterative(nume,d,eps);
    R2 = Algebraic(nume,d);
    
    % afisam nr de noduri, vectorul PR1 si vectorul PR2
    fprintf(file_output,"%d\n\n",n);
    fprintf(file_output,"%f\n",R1);
    fprintf(file_output,'\n');
    fprintf(file_output,"%f\n",R2);
    fprintf(file_output,'\n');
    
    % apelam functia Bubblesort, X ul = vector sortat, Y ul = vector noduri
    % de precizat este ca folosim R2 ( algoritmul algebraic, asa cum
    % mentioneaza cerinta ) .

    [X , Y] = Bubblesort(R2);
    
    % printam ordinea 1..N , nodul de la pozitia i si apartenenta
    for i = 1:n
    fprintf(file_output,"%d %d %f\n",i,Y(i),Apartenenta(X(i),val1,val2));
    end

    % inchidem fisierele
    fclose(file_input);
    fclose(file_output);
end
