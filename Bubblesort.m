function [array, index] = Bubblesort(vector)
  % Functie bubblesort simpla care primeste un vector ce va fi sortat
  % Scoate ca output vectorul sortat ( array ) si indexul cu nodurile
  
  % aflam lungimea vectorului si formam vectorul de noduri
  n = length(vector);
  nod = 1:n;
  
  % implementam algoritm Bubblesort
  for i= 1:n
      for j= 1:(n-1)
         % aplicam sortarea in ordine descrescatoare
        if vector(j) < vector(j+1)
            % aux schimba elementele din vector
            aux = vector(j);
            vector(j) = vector(j+1);
            vector(j+1) = aux;
            % temp schimba elementele din vectorul de noduri
            temp = nod(j);
            nod(j) = nod(j+1);
            nod(j+1) = temp;
        end
      end
  end
 
  % setam output urile
  array = vector;
  index = nod;

end