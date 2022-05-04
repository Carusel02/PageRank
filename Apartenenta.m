function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
    % Avem 3 cazuri

  % daca x e mai mic ca val1, returnam 0
  if x < val1
    y = 0;
  end
   
  % daca x este intre val1 si val2

  % ca functia sa fie continua => val1 * a + b = 0 si val2 * a + b = 1
  % scadem si obtinem a ( val2 - val1 ) = 1 de unde scoatem a si dupa b
  if val1 <= x && x <= val2
    a = 1 / (val2 - val1);
    b = - val1 / (val2 - val1);
    y = a * x + b;
  end
  
  % daca x e mai mare ca val2, returnam 1
  if x > val2
     y = 1;
  end

end