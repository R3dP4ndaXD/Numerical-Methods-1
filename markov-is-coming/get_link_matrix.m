function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  
  [m n] = size(Labyrinth);    
  last_cell = m * n;                                %aflu cat de mare e labirintul
  nodes = reshape(1 : last_cell, [n m]) .';         %construiesc matrice cu codificarea starilor
  %bordez matricea cu starile de win si lose
  nodes = [(last_cell + 1) * ones(1,n); nodes; (last_cell + 1) * ones(1,n)];           
  nodes = [(last_cell + 2) * ones(m + 2, 1) nodes (last_cell + 2) * ones(m + 2, 1)];
  ii =[];
  jj =[];
  sv = [];
  %verific fiecare celula a labirintul si adaug in vectorii de indici perechile de coordonate
  %aferente cailor existente exprimate prim matricea de adiacenta
  %la fiecare pas calculez probabilitatile de a alege a fiecarei cai prin numararea cailor posibile
  for i = 1 : m
    for j = 1 : n
      count = 0;
      if (bitand(Labyrinth(i,j), 8) == 0)
        ii = [ii nodes(i+1, j+1)];
        jj = [jj nodes(i, j+1)];
        count = count + 1;
      endif
      if (bitand(Labyrinth(i,j), 4) == 0)
        ii = [ii nodes(i+1, j+1)];
        jj = [jj nodes(i+2 , j+1)];
        count = count + 1;
      endif
      if (bitand(Labyrinth(i,j), 2) == 0)
        ii = [ii nodes(i+1, j+1)];
        jj = [jj nodes(i+1 , j+2)];
        count = count + 1;
      endif
      if (bitand(Labyrinth(i,j), 1) == 0)
        ii = [ii nodes(i+1, j+1)];
        jj = [jj nodes(i+1 , j)];
        count = count + 1;
      endif
      if (count != 0)
        sv = [sv (1/count) * ones(1,count) ];
      endif
    endfor
  endfor
  %adaug starile de win si lose cu probabilitatate 1
  ii = [ii (last_cell +1) (last_cell +2)];
  jj = [jj (last_cell +1) (last_cell +2)];
  sv = [sv 1 1];
  Link = sparse(ii, jj, sv, last_cell +2, last_cell +2);
endfunction
